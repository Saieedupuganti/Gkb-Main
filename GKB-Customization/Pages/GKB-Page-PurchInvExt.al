pageextension 50109 PurchInvExt extends "Purchase Invoice"
{
    layout
     {
    //     modify("VAT Bus. Posting Group")
    //     {
    //         Caption = 'GST Bus. Posting Group';
    //         ToolTip = 'Specifies the GST specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the GST posting setup.';

    //     }
    //     modify("VAT Reporting Date")
    //     {
    //         Caption = 'GST Reporting Date';
    //         ToolTip = 'Specifies the date used to include entries on GST reports in a GST period. This is either the date that the document was created or posted, depending on your setting on the General Ledger Setup page.';
    //     }
    //     modify("Prices Including VAT")
    //     {
    //         Caption = 'Prices Including GST';
    //         ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without GST.';
    //     }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}