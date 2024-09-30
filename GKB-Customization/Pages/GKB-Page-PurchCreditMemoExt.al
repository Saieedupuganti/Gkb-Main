pageextension 50151 "Purchase Credit Memo Ext" extends "Purchase Credit Memo"
{
    layout
    {
        // modify("VAT Bus. Posting Group")
        // {
        //     Caption = 'GST Bus. Posting Group';
        //     ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';

        // }
        // modify("VAT Reporting Date")
        // {
        //     Caption = 'GST Date';
        //     ToolTip = 'Specifies the date used to include entries on VAT reports in a VAT period. This is either the date that the document was created or posted, depending on your setting on the General Ledger Setup page.';

        // }
        // modify("Prices Including VAT")
        // {
        //     Caption = 'Prices Including GST';
        //     ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';

        // }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}