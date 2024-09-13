pageextension 50119 CustomerCardExt extends "Customer Card"
{
    layout
    {
        modify("VAT Bus. Posting Group")
        {
            Caption = 'GST Bus. Posting Group';
            ToolTip = 'Specifies the customers GST specification to link transactions made for this customer to.';
        }
        modify("VAT Registration No.")
        {
            Caption = 'GST Registration NO.';
            ToolTip = 'Specifies the customer''s GST registration number for customers in EU countries/regions.';
        }
        modify("Prices Including VAT")
        {
            Caption = 'Prices Including GST';
            ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without GST';
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}