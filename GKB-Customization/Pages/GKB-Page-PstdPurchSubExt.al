pageextension 50115 PstdPurchSubExt extends "Posted Purch. Invoice Subform"
{
    layout
    {
        modify("Total VAT Amount")
        {
            Caption = 'Total GST Amount';
            CaptionClass = GetCaptionWithCurrencyCode('Total GST Amount', Rec.GetCurrencyCode());
            ToolTip = 'Specifies the sum of GST amounts on all lines in the document.';
        }
        modify("Total Amount Excl. VAT")
        {
            Caption = 'Total Amount Excl. GST';
            CaptionClass = GetCaptionWithCurrencyCode('Total Amount Excl. GST', Rec.GetCurrencyCode());
            ToolTip = 'Specifies the sum of the value in the Line Amount Excl. GST field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';
        }
        modify("Total Amount Incl. VAT")
        {
            Caption = 'Total Amount Incl. GST';
            CaptionClass = GetCaptionWithCurrencyCode('Total Amount Incl. GST', Rec.GetCurrencyCode());
            ToolTip = 'Specifies the sum of the value in the Line Amount Incl. GST field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';
        }
        modify("Invoice Discount Amount")
        {
            Caption = 'Invoice Discount Amount Excl. GST';
            CaptionClass = GetCaptionWithCurrencyCode('Invoice Discount Amount Excl. GST', Rec.GetCurrencyCode());
            ToolTip = 'Specifies a discount amount that is deducted from the value of the Total Incl. GST field, based on purchase lines where the Allow Invoice Disc. field is selected.';
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

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

    procedure GetCurrencyCode1(): Code[10]
    var
        PurchInvHeader: Record "Purch. Inv. Header";
    begin
        if Rec."No." = PurchInvHeader."No." then
            exit(PurchInvHeader."Currency Code");
        if PurchInvHeader.Get(Rec."No.") then
            exit(PurchInvHeader."Currency Code");
        exit('');
    end;

    local procedure GetCaptionWithVATInfo(CaptionWithoutVATInfo: Text; IncludesVAT: Boolean): Text
    begin
        if IncludesVAT then
            exit('2,1,' + CaptionWithoutVATInfo);

        exit('2,0,' + CaptionWithoutVATInfo);
    end;

    // procedure GetCaptionClass1(FieldNumber: Integer): Text[80]
    // var
    //     PurchLineCaptionClassMgmt: Codeunit "Purch. Line CaptionClass Mgmt";
    // begin
    //     exit(PurchLineCaptionClassMgmt.GetPurchaseLineCaptionClass(Rec, FieldNumber));
    // end;


}



