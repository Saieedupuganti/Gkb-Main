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
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Obrien_Business Unit Code';
            ApplicationArea = all;
        }
        addlast(Control1)
        {
            field("Work Order No"; Rec."Work Order No")
            {
                Caption = 'Work Order No.';
                ApplicationArea = all;
                ShowMandatory = true;
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
            }
        }
        addafter("Vendor No.")
        {
            field(VendorName; Rec."Vendor Name")
            {
                ApplicationArea = all;
                Visible = true;
            }
        }
        modify("Vendor No.")
        {
            trigger OnAfterValidate()
            var
                Item: Record Item;
            begin
                if Item.Get(Rec."No.") then begin
                    if Item."Vendor No." <> '' then begin
                        Rec."Vendor No." := Item."Vendor No.";
                        Rec."Vendor Name" := Item."Vendor Item Name";
                        Rec.VendorName := Item."Vendor Item Name";
                        Rec.Modify(false);
                    end;
                end;
            end;
        }
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
                RecTemp: Record "Requisition Line";
                FirstBusinessUnitCode: Code[20];
                IsSame: Boolean;
            begin
                IsSame := true;
                if Rec.FindSet then begin
                    FirstBusinessUnitCode := Rec."Shortcut Dimension 1 Code";

                    repeat
                        if Rec."Shortcut Dimension 1 Code" <> FirstBusinessUnitCode then begin
                            IsSame := false;
                            break;
                        end;
                    until Rec.Next() = 0;
                end;

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
    // var
    //     CurrentlyCoupledCDSSalesadi_PurchaseRequest: Record "CDS adigkb_PurchaseRequest"; 
}