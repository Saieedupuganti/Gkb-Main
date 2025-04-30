pageextension 50368 "Posted Purch inv Ext" extends "Posted Purchase Invoice"
{
    layout
    {
        addafter(Corrective)
        {
            field("Ordered By"; Rec."Ordered By")
            {
                ApplicationArea = all;
            }
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = all;
            }
            field("Work Order No"; Rec."Work Order No")
            {
                ApplicationArea = all;
            }
        }
    }
}