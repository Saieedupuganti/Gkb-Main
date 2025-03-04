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
            field("Obrien Business Unit Code"; Rec."Shortcut Dimension 1 Code")
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
            }
            field("Requested By Name"; Rec."Requested By Name")
            {
                ApplicationArea = all;
            }
            field("Stock Check"; Rec."Stock Check")
            {
                ApplicationArea = all;
                ToolTip = 'Checks item is in stock or not';
            }
            field("Item Inventory"; Rec."Item Inventory")
            {
                ApplicationArea = all;
                ToolTip = 'Shows the item inventory';
            }
            field("Alternate Vendor For Item"; Rec."Alternate Vendor For Item")
            {
                ApplicationArea = all;
                ToolTip = 'Checks item has alternate vendor or not';
            }
            field("Ship To"; Rec."Ship To")
            {
                ApplicationArea = all;

            }
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
        addafter("Location Code")
        {
            field("Item Availability By Location";Rec."Item Availability By Location")
            {
                ApplicationArea = all;
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

                    // Loop through all records to check if the Obrien_Business Unit Code matches the first record
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
}