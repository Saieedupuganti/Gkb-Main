pageextension 50117 PurchaseQteExt extends "Purchase Quote"
{
    layout
    {
        modify("VAT Bus. Posting Group")
        {
            Caption = 'GST Bus. Posting Group';
            ToolTip = 'Specifies the GST specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the GST posting setup.';

        }
        modify("Prices Including VAT")
        {
            Caption = 'Prices Including GST';
            ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without GST.';

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}