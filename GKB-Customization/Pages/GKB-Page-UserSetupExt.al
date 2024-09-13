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
        }
    }
}