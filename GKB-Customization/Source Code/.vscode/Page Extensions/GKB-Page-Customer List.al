pageextension 50123 "GKB customer list EXT" extends "Customer List"
{
    layout
    {
        addafter("Payments (LCY)")
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
                //Editable = false;
                Enabled = false;
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
            field("ABN No."; Rec."ABN No.")
            {
                ApplicationArea = All;
                Caption = 'ABN No.';
            }
            field(ABN; Rec.ABN)
            {
                Visible = false;
            }
        }
    }
    actions
    {
        addafter(Dimensions)
        {
            action(DeletingShiptoaddress)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    ManINt: Record 5384;
                begin
                    ManINt.Reset();
                    ManINt.SetRange("Table Field No.", 102);
                    ManINt.SetRange("Integration Table Field No.", 49);
                    if ManINt.FindFirst() then
                     ManINt.Delete();  
                end;
            }
        }
    }
}
