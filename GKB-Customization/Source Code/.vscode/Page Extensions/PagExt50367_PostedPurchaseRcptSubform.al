pageextension 50367 "Posted Purch RcptSubform Ext" extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("Ordered By";Rec."Ordered By")
            {
                ApplicationArea = all;
            }
            field("Created By";Rec."Created By")
            {
                ApplicationArea = all;
            }
            field("Work Order No";Rec."Work Order No")
            {
                ApplicationArea = all;
            }
        }
    }
}