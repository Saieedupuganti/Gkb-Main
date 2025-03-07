pageextension 50351 "Item Journel Ext" extends "Item Journal"
{
    layout
    {
        addafter("Shortcut Dimension 1 Code")
        {
            field(Comment; Rec.Comment)
            {
                ApplicationArea = All;
                Caption = 'Comment';
            }
        }
        modify("Location Code")
        {
            ShowMandatory = true;
        }
        addafter("Location Code")
        {
            field("Item Availability By Location"; Rec."Item Availability By Location")
            {
                ApplicationArea = all;
                ToolTip = 'Shows the Item availibilty by Location Code';
            }
        }
    }
}