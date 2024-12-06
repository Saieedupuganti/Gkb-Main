pageextension 50200 "JobTaskCardExt" extends "Job Task Card"
{
    layout
    {
        addafter(General)
        {
            group("Custom Fields")
            {
                Caption = 'Custom Fields';
                field("Billing Type"; Rec."Billing Type")
                {
                    ApplicationArea = All;
                    Caption = 'Billing Type';
                }

                field("Contact"; Rec."Contact")
                {
                    ApplicationArea = All;
                    Caption = 'Contact';
                }

                field("Fix Type"; Rec."Fix Type")
                {
                    ApplicationArea = All;
                    Caption = 'Fix Type';
                }

                field("Functional Location"; Rec."Functional Location")
                {
                    ApplicationArea = All;
                    Caption = 'Functional Location';
                }

                field("Sales Order"; Rec."Sales Order")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Order';
                }

                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    Caption = 'Description 2';
                }

                field("Work Order Type"; Rec."Work Order Type")
                {
                    ApplicationArea = All;
                    Caption = 'Work Order Type';
                }

                field("Work Order Summary"; Rec."Work Order Summary")
                {
                    ApplicationArea = All;
                    Caption = 'Work Order Summary';
                }
                field("Parent Task No."; Rec."Parent Task No.")
                {
                    ApplicationArea = all;
                    Caption = 'Parent Task No.';
                }
            }
        }
    }
}
