pageextension 50113 PostedPurchInvExt extends "Posted Purchase Invoice"
{
    layout
    {
        modify("VAT Reporting Date")
        {
            Caption = 'GST Reporting Date';
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}