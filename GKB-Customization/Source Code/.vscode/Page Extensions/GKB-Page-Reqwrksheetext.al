namespace Proejct.Proejct;

using Microsoft.Inventory.Requisition;
using System.Automation;
using Microsoft.Integration.Dataverse;
using System.Security.User;
using Microsoft.Purchases.Document;
using Microsoft.Projects.Project.Job;
using Microsoft.Inventory.Item;
using Microsoft.Purchases.Vendor;

pageextension 50100 "Req WO" extends "Req. Worksheet"
{
    Caption = 'Purchase Request';
    layout
    {
        modify("Location Code")
        {
            Caption = 'Warehouse';  // Changing the location code to warehouse in req. worksheet.
        }
        modify(Control1903326807)
        {
            Visible = false;

        }
        modify("Due Date")
        {
            Caption = 'Required by date';
            ShowMandatory = true;
        }
        addlast(Control1)
        {
            field("Work Order No"; Rec."Work Order No")
            {
                Caption = 'Work Order No.';
                ApplicationArea = all;
                ShowMandatory = true;

                trigger OnValidate()
                var
                    WorkOrder: Record "Work Order";
                begin
                    if xRec."Work Order No" <> Rec."Work Order No" then begin
                        WorkOrder.Reset();
                        if WorkOrder.Get(Rec."Work Order No") then begin
                            Rec."Project Task No" := WorkOrder."Project Task No";
                            Rec.projectNo := WorkOrder."Project No";
                            Rec."Shortcut Dimension 1 Code" := WorkOrder."Owning Business Unit";
                        end;
                    end;
                end;
            }
            field(projectNo; Rec.projectNo)
            {
                ApplicationArea = all;
                ShowMandatory = true;
            }

            field("Project Task No"; Rec."Project Task No")
            {
                ApplicationArea = all;
                ShowMandatory = true;

                // trigger OnValidate()
                // var
                //     JobTask: Record "Job Task";
                // //JobTaskDimension: Record "Job Task Dimension";
                // begin
                //     if not JobTask.Get(Rec.projectNo, Rec."Project Task No") then
                //         Error('The Project Task No. %1 does not exist for Project No. %2.', Rec.projectNo, Rec."Project Task No");

                //     // Rec."Shortcut Dimension 1 Code" := JobTaskDimension."Dimension Value Code";
                //     Rec."Shortcut Dimension 1 Code" := JobTask."Global Dimension 1 Code";

                //     Rec.Modify();
                // end;
            }

            field("Obrien Business Unit Code"; Rec."Obrien Business Unit Code")
            {
                ApplicationArea = all;
                Visible = false;
            }

        }

        addafter("Vendor No.")
        {
            field(VendorName; Rec.VendorName)
            {
                ApplicationArea = all;
                Visible = true;
                trigger OnValidate()
                var
                    VendorRec: Record Vendor;
                begin
                    if VendorRec.Get(Rec."Vendor Name") then
                        Rec."Vendor No." := VendorRec."No.";
                end;

            }
        }
        // modify("Vendor No.")
        // {

        //     trigger OnBeforeValidate()
        //     var
        //         item: Record Item;
        //     begin
        //         if item.Type = "Item Type"::Inventory then
        //             VendorNoForInventory()
        //         else
        //             VendorNoForNonInventory();
        //     end;
        // }
        addafter(Control1903326807)
        {
            part(ItemAvailability; "Req WO FactBox")
            {
                ApplicationArea = Planning;
                SubPageLink = "Worksheet Template Name" = field("Worksheet Template Name"), "Journal Batch Name" = field("Journal Batch Name"), "Line No." = field("Line No.");
                Visible = true;
            }
        }
        addafter(Control1)
        {

            part(Inventory; "Req WO FactBox")
            {
                ApplicationArea = Planning;
                SubPageLink = "Worksheet Template Name" = field("Worksheet Template Name"), "Journal Batch Name" = field("Journal Batch Name"), "Line No." = field("Line No.");
                Visible = false;
            }
        }
    }
    actions
    {
        modify(CarryOutActionMessage)
        {
            Caption = 'Create Purchase Order';
            trigger OnBeforeAction()
            var
                RecTemp: Record "Requisition Line"; // Temporary variable to store the worksheet records
                FirstBusinessUnitCode: Code[20];  // To store the first record's Obrien_Business Unit Code
                IsSame: Boolean;
            begin
                IsSame := true;

                // Initialize the first record's Obrien_Business Unit Code
                if Rec.FindSet then begin
                    FirstBusinessUnitCode := Rec."Shortcut Dimension 1 Code";

                    // Message(FirstBusinessUnitCode);
                    // Loop through all records to check if the Obrien_Business Unit Code matches the first record
                    repeat
                        if Rec."Shortcut Dimension 1 Code" <> FirstBusinessUnitCode then begin
                            IsSame := false;
                            break;
                        end;
                    until Rec.Next() = 0;
                end;

                // If there's a mismatch, show an error message
                if not IsSame then begin
                    Error('The Obrien_Business Unit Codes are not the same.');
                    // exit;
                end;

            end;
        }
        addfirst(processing)
        {
            action(CreatePoAndSendApproval)
            {
                ApplicationArea = all;
                Caption = 'Create Po And Send Approval';
                Promoted = true;
                PromotedCategory = Process;
                AccessByPermission = tabledata 454 = rim;
                Visible = false;


                trigger OnAction()
                var
                    Ph: Record "Purchase Header";
                begin

                end;
            }
            }
        }
    procedure VendorNoForInventory()
    var
        Vendor: Record Vendor;
        item: Record Item;
    begin
        if item.Type = "Item Type"::Inventory then begin
            // Assuming you have a way to determine the Vendor No. and Vendor Name
            Vendor.Get(Rec."Vendor No.");
            rec."Vendor No." := Vendor."No.";
            rec.VendorName := Vendor.Name;
        end;
    end;

    procedure VendorNoForNonInventory()
    var
        item: Record Item;
        vendor: Record Vendor;
    begin
        if item.Type <> "Item Type"::Inventory then begin
            // Vendor No. should be populated when Vendor Name is selected manually
            // Assuming you have a way to determine the Vendor No. based on Vendor Name
            if rec.VendorName <> '' then begin
                // Logic to find and set Vendor No. based on Vendor Name
                // Example:
                Vendor.Get(Rec.VendorName);
                rec."Vendor No." := Vendor."No.";
            end;
        end;
    end;

    var
        CurrentlyCoupledCDSSalesadi_PurchaseRequest: Record "CDS adigkb_PurchaseRequest";

}


