pageextension 50347 "SalesInvExt" extends "Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("Sales Order No."; Rec."Sales Order No.")
            {
                ApplicationArea = All;
                Caption = 'Sales Order No.';
            }
            field("Job No.";Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("Job Task No."; Rec."Job Task No")
            {
                ApplicationArea = All;
            }
        }
    }
}