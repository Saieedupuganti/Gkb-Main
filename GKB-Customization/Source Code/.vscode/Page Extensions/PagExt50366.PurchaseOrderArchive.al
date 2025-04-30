pageextension 50366 "Purchase Order Archive Ext" extends "Purchase Order Archive"
{
    layout
    {
      addafter(Status)
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