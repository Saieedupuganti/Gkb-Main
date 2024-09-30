namespace Proejct.Proejct;

using Microsoft.Inventory.Requisition;
using System.Automation;
using System.Security.User;
using Microsoft.Purchases.Document;
using Microsoft.Inventory.Item;


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
        addlast(Control1)
        {
            field(projectNo; Rec.projectNo)
            {
                ApplicationArea = all;
            }

        }
        addafter("Vendor No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field(VendorName; Rec.VendorName)
            {
                ApplicationArea = all;
                Visible = true;
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


                trigger OnAction()
                var
                    Ph: Record "Purchase Header";
                begin

                end;
            }


        }


    }

}