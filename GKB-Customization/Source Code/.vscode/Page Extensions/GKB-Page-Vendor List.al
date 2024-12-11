pageextension 50138 GKBVendorExt extends "Vendor List"
{
    layout
    {
        addafter("Payments (LCY)")
        {
            field("Vendor Profile"; Rec."Vendor Profile")
            {
                ApplicationArea = All;
                Caption = 'Vendor Profile';
            }
            // field("Supplier account Group"; Rec."Supplier account Group")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Supplier account Group';
            //     ShowMandatory = false;
            // }
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
            // field("ABN No."; Rec."ABN No.")
            // {
            //     ApplicationArea = All;
            //     Caption = 'ABN No.';
            // }
            field(ABN; Rec.ABN)
            {
                Visible = true;
                ShowMandatory = true;
            }
            
        }
    }
}
