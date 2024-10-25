pageextension 70125 "GKB Vendor EXT" extends "Vendor Card"
{
    layout
    {
        modify(ABN)
        {
            Editable = true;
            Enabled = true;
            Visible = true;
            ShowMandatory = true;
        }
        addafter(General)
        {
            group("D365 CUSTOM FIELDS")
            {
                field("Vendor Profile"; Rec."Vendor Profile")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Profile';
                }
                field("D365 Account ID"; Rec."D365 Account ID")
                {
                    ApplicationArea = All;
                    Caption = 'D365 Account ID';
                }
                field("SAP Vendor Number"; Rec."SAP Vendor Number")
                {
                    ApplicationArea = All;
                    Caption = 'SAP Vendor Number';
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
                field("Customer Group"; Rec."Customer Group")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Group';
                }
                field("Contact Groups"; Rec."Contact Groups")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Group';
                }
                field("CreditHold"; Rec."Credit Hold")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Hold';
                    Visible = false;
                }
                field("SAP Vendor No"; Rec."SAP Vendor No")
                {
                    ApplicationArea = All;
                    Caption = 'SAP Vendor No';
                }
                field("Owner Ship"; Rec."Owner Ship")
                {
                    ApplicationArea = all;
                }
                field("Credit Holds"; Rec."Credit Holds")
                {
                    ApplicationArea = all;
                }

            }
        }
        addafter("IRD No.")
        {
            // field("ABN No."; Rec."ABN No.")
            // {
            //     ApplicationArea = All;
            //     ShowMandatory = true;
            // }
        }
    }
    trigger OnOpenPage();
    var
        UserSetupRec: Record "User Setup";
        IsUserAllowed: Boolean;
    begin
        // Check if the current user has permission to edit the Vendor Card
        if UserSetupRec.Get(UserId()) then begin
            IsUserAllowed := UserSetupRec."Allow Edit Mode";
        end else begin
            IsUserAllowed := false;
        end;

        // If the user does not have permission, make the fields non-editable
        if not IsUserAllowed then
            CurrPage.Editable(false);  // Set the entire page to non-editable
    end;
}
