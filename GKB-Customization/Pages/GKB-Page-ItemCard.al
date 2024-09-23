pageextension 50149 GKBItemExt extends "Item Card"
{
    layout
    {
        // modify(Description)
        // {
        //     // renamed description with customer item Description
        //     Caption = 'Customer Item Description';
        //     ShowMandatory = false;
        // }
        // modify("VAT Bus. Posting Gr. (Price)")
        // {
        //     Caption = 'GST Bus. Posting Gr. (Price)';
        //     ToolTip = 'Specifies the GST business posting group for customers for whom you want the sales price including GST to apply.';

        // }
        // modify("VAT Prod. Posting Group")
        // {
        //     Caption = 'GST Prod. Posting Group';
        //     ToolTip = 'Specifies the GST specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the GST posting setup.';

        // }
        // modify("Price Includes VAT")
        // {
        //     Caption = 'Price Includes GST';
        //     ToolTip = 'Specifies if the Unit Price and Line Amount fields on sales document lines for this item should be shown with or without GST.';
        // }

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
