pageextension 50149 GKBItemExt extends "Item Card"
{
    layout
    {
        modify(Description)
        {
            // renamed description with customer item Description
            Caption = 'Customer Item Description';
            ShowMandatory = false;
        }
        addafter(Description)
        {
            field("OBS Item Name"; Rec."OBS Item Name")
            {
                Caption = 'OBS Item Name';
                ApplicationArea = All;
            }

        }
        addafter("Vendor Item No.")
        {
            field("Vendor Item Name"; Rec."Vendor Item Name")
            {
                Caption = 'Vendor Item Name';
                ApplicationArea = All;
            }
        }
    }
}