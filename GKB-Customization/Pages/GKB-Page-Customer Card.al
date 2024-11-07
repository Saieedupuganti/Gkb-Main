pageextension 50121 "customercustom/mandatory" extends "Customer Card"
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
                    Editable = true;
                    //Enabled = false;
                    Visible = true;
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
                    //look up 
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
                field("Customer group"; Rec."Customer group")
                {
                    ApplicationArea = all;
                    Visible=false;
                }
                field("Contact Group"; Rec."Contact Group")
                {
                    ApplicationArea = all;

                }
                field("Credit Hold"; Rec."Credit Hold")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field("Import Serial No"; Rec."Import Serial No")
                {
                    ApplicationArea = all;
                }
                field("Owner Ship"; Rec."Owner Ship")
                {
                    ApplicationArea = all;
                }
                
            }
        }
        addafter("Address 2")
        {
            field("Address 3";Rec."Address 3")
            {
                ApplicationArea = all;
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
            IsUserAllowed := UserSetupRec."Customer Card";
        end else begin
            IsUserAllowed := false;
        end;

        // If the user does not have permission, make the fields non-editable
        if not IsUserAllowed then
            CurrPage.Editable(false);  // Set the entire page to non-editable
    end;
}