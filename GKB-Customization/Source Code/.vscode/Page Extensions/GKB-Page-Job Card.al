pageextension 50142 "GKB Job Card" extends "Job Card"
{
    layout
    {
        addafter(Description)
        {
            field("Work Order Type";Rec."Work Order Type")
            {
                ApplicationArea = all;
                Caption = 'Work Order Type';
            }
            field("Service Account";Rec."Service Account")
            {
                ApplicationArea = all;
                Caption = 'Service Account';
            }
        }
    }
}