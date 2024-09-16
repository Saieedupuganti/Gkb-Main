pageextension 50107 PurchaseListExt extends "Purchase Order List"
{
    layout
    {
        modify("Amount Including VAT")
        {
            Caption = 'Amount Including GST';
            ToolTip = 'Specifies the sum of amounts, including GST, on all the lines in the document. This will include invoice discounts.';
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}