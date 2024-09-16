pageextension 50112 PurchInvSubFormExt extends "Purch. Invoice Subform"
{
    layout
    {
        modify("VAT Bus. Posting Group")
        {
            ApplicationArea = all;
            Caption = 'GST Bus. Posting Group';
            //Editable = true;
            ToolTip = 'Specifies the vendor''s GST specification to link transactions made for this vendor with the appropriate general ledger account according to the GST posting setup.';
        }
        modify("VAT Prod. Posting Group")
        {

            ApplicationArea = all;
            Caption = 'GST Prod. Posting Group';
            //Editable = true;
            ToolTip = 'Specifies the GST product posting group. Links business transactions made for the item, resource, or G/L account with the general ledger, to account for GST amounts resulting from trade with that record.';
        }
        modify("Total VAT Amount")
        {
            ApplicationArea = all;
            Caption = 'Total GST';
            CaptionClass = GetCaptionClassWithCurrencyCode('Total GST', Rec."Currency Code");
            //Editable = true;
            ToolTip = 'Specifies the sum of the value in the Line Amount Excl. GST field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';
        }
        modify("Total Amount Excl. VAT")
        {
            ApplicationArea = all;
            Caption = 'Total Excl. GST';
            CaptionClass = GetCaptionClassWithCurrencyCode('Total Excl. GST', Rec."Currency Code");
            //Editable = true;
            ToolTip = 'Specifies the sum of the value in the Line Amount Excl. GST field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';
        }
        modify("Total Amount Incl. VAT")
        {
            ApplicationArea = all;
            Caption = 'Total Incl. GST';
            CaptionClass = GetCaptionClassWithCurrencyCode('Total Incl. GST', Rec."Currency Code");
            //Editable = true;
            ToolTip = 'Specifies the sum of the value in the Line Amount Incl. GST field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';
        }
        modify(NonDeductibleVATAmount)
        {

            ApplicationArea = all;
            Caption = 'NonDeductibleGSTAmount';
            //Editable = true;
            ToolTip = 'Specifies the amount of the transaction for which GST is not applied, due to the type of goods or services purchased.';
        }
        modify(NonDeductibleVATBase)
        {

            ApplicationArea = all;
            Caption = 'NonDeductibleGSTBase';
            CaptionClass = GetCaptionClassWithCurrencyCode('NonDeductibleGSTBase', 'AUD');
            // Editable = true;
            ToolTip = 'Specifies the amount of GST that is not deducted due to the type of goods or services purchased.';
        }
        modify(AmountBeforeDiscount)
        {
            ApplicationArea = all;
            Caption = 'Subtotal Excl. GST';
            CaptionClass = GetCaptionClassWithCurrencyCode('Subtotal Excl. GST', Rec."Currency Code");
            ToolTip = 'Specifies the sum of the value in the Line Amount Excl. GST field on all lines in the document.';
        }
        modify("Direct Unit Cost")
        {
            Caption = 'Direct Unit Cost Excl. GST';
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    local procedure GetCaptionClassWithCurrencyCode(CaptionWithoutCurrencyCode: Text; CurrencyCode: Code[10]): Text
    begin
        exit('3,' + GetCaptionWithCurrencyCode(CaptionWithoutCurrencyCode, CurrencyCode));
    end;

    local procedure GetCaptionWithCurrencyCode(CaptionWithoutCurrencyCode: Text; CurrencyCode: Code[10]): Text
    var
        GLSetup: Record "General Ledger Setup";
    begin
        if CurrencyCode = '' then begin
            GLSetup.Get();
            CurrencyCode := GLSetup.GetCurrencyCode(CurrencyCode);
        end;

        if CurrencyCode <> '' then
            exit(CaptionWithoutCurrencyCode + StrSubstNo(' (%1)', CurrencyCode));

        exit(CaptionWithoutCurrencyCode);
    end;
}
