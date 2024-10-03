pageextension 50149 GKBItemExt extends "Item Card"
{
    layout
    {
        addafter("Attached Documents")
        {
            part(qrcode; "Qr Code")
            {
                ApplicationArea = all;
                // Caption = 'Qr Code';
                SubPageLink = "No." = field("No.");
            }
        }
        addafter(Description)
        {
            field("OBS Item Name"; Rec."OBS Item Name")
            {
                Caption = 'OBS Item Name';
                ApplicationArea = All;
            }
            field("D365 Product ID"; Rec."D365 Product ID")
            {
                ApplicationArea = all;
            }
            field("Vendor 1 Catalogue Number"; Rec."Vendor 1 Catalogue Number")
            {
                ApplicationArea = all;
            }
            field("Trade Type"; Rec."Trade Type")
            {
                ApplicationArea = all;
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
