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
                field(State; Rec.State)
                {
                    ApplicationArea = all;
                    Caption = 'State';
                }
                field("Sales Person Code"; Rec."Sales Person Code")
                {
                    ApplicationArea = all;
                    Caption = 'Sales Person Code';
                }
                field("Contact Code"; Rec."Contact Code")
                {
                    ApplicationArea = all;
                    Caption = 'Contact Code';
                }
                field("Supplier account Group"; Rec."Supplier account Group")
                {
                    ApplicationArea = all;
                    Caption = 'Supplier Account Group';
                }
                field(WEB; Rec.WEB)
                {
                    ApplicationArea = all;
                    Caption = 'WEB';
                }
                field(Dimension; Rec.Dimension)
                {
                    ApplicationArea = all;
                    Caption = 'Dimension';
                    TableRelation=Dimension.Code;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    Caption = 'Description';
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ApplicationArea = all;
                    Caption = 'Customer Price Group';
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
        addafter("Address 2")
        {
            field("Address 3"; Rec."Address 3")
            {
                ApplicationArea = all;
            }
        }
        addbefore(Address)
        {
            field("Address Name"; Rec."Address Name")
            {
                ApplicationArea = all;
            }
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
