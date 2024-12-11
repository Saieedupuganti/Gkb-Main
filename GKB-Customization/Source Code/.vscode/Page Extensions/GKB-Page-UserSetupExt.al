pageextension 50120 "User Setup Page Ext" extends "User Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {
            field("Allow Edit Mode"; Rec."Allow Edit Mode")
            {
                ApplicationArea = All;
            }
            field("Allow Edit Vandor Bank"; Rec."Allow Edit Vandor Bank")
            {
                ApplicationArea = all;
            }
            field("Customer Card"; Rec."Customer Card")
            {
                ApplicationArea = all;
            }
            field("G\L Account"; Rec."G\L Account")
            {
                ApplicationArea = all;
            }
            field("Location"; Rec."Location")
            {
                ApplicationArea = all;
            }
            field("Sales Quote"; Rec."Sales Quote")
            {
                ApplicationArea = all;
            }
        }
    }
}