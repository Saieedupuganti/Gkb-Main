pageextension 50121 "customercustom/mandatory" extends "Customer Card"
{
    layout
    {
        modify(ABN)
        {
            Editable = false;
            Enabled = false;
            Visible = false;
        }
        addafter(General)
        {
            group("D365 CUSTOM FIELDS")
            {
                field("Customer Profile"; Rec."Customer Profile")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Profile';
                }
                field("Supplier account Group"; Rec."Supplier account Group")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier account Group';
                    ShowMandatory = true;
                    Editable = false;
                    Enabled = false;
                    Visible = false;
                }
                field("D365 Account ID"; Rec."D365 Account ID")
                {
                    ApplicationArea = All;
                    Caption = 'D365 Account ID';
                }
                field("SAP Customer Number"; Rec."SAP Customer Number")
                {
                    ApplicationArea = All;
                    Caption = 'SAP Customer Number';
                }
                field("Service Agreement"; Rec."Service Agreement")
                {
                    Caption = 'Service Agreement';
                    ApplicationArea = All;
                }
                field("Account Contract Manager"; Rec."Account Contract Manager")
                {
                    ApplicationArea = All;
                    Caption = 'Account Contract Manager';
                }
                field("Capex From"; Rec."Capex From")
                {
                    ApplicationArea = All;
                }
                field("Capex To"; Rec."Capex To")
                {
                    ApplicationArea = All;
                    Caption = 'Capex To';
                }
            }
        }
        addafter("IRD No.")
        {
            field("ABN No."; Rec."ABN No.")
            {
                ApplicationArea = All;
                ShowMandatory = true;
            }
        }
    }
}
