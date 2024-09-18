pageextension 50153 "Purchase Quote SubForm Ext" extends "Purchase Quote Subform"
{
    layout
    {
        modify("VAT Bus. Posting Group")
        {
            Caption = 'GST Bus. Posting Group';
        }
        modify("VAT Prod. Posting Group")
        {
            Caption = 'GST Prod. Posting Group';
        }
        modify("Total VAT Amount")           //captionclasss
        {
            Caption = 'Total GST Amount';
            CaptionClass = GetCaptionClassWithCurrencyCode('Total GST Amount', rec."Currency Code");
        }
        modify("Total Amount Excl. VAT")
        {
            Caption = 'Total Amount Excl. GST';     //captionclass
            CaptionClass = GetCaptionClassWithCurrencyCode('Total Amount Excl. GST', rec."Currency Code");
        }
        modify("Total Amount Incl. VAT")
        {
            Caption = 'Total Amount Incl. GST';// caption class
            CaptionClass = GetCaptionClassWithCurrencyCode('Total Amount Incl. GST', rec."Currency Code");
        }
        modify(AmountBeforeDiscount)
        {
            Caption = 'Subtotal Excl. GST';       //Captionclass
            CaptionClass = GetCaptionClassWithCurrencyCode('Subtotal Excl. GST', rec."Currency Code");
        }
        modify("Direct Unit Cost")
        {
            Caption = 'Direct Unit Cost Excl. GSt';
            CaptionClass = GetFieldCaption(39, 22, 'Direct unit Cose Excl. GST');
        }
        modify("Line Amount")
        {
            Caption = 'Line Amount Excl. GST';
            CaptionClass = GetFieldCaption(39, 103, 'Line Amount Excl. GST');
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

    procedure GetCaptionClass(FieldNumber: Integer): Text[80]
    var
        PurchLineCaptionClassMgmt: Codeunit "Purch. Line CaptionClass Mgmt";
    begin
        exit(PurchLineCaptionClassMgmt.GetPurchaseLineCaptionClass(Rec, FieldNumber));
    end;
    //================================================================
    var
        GlobalPurchaseHeader: Record "Purchase Header";
        GlobalField: Record "Field";

    procedure GetPurchaseLineCaptionClass(var PurchaseLine: Record "Purchase Line"; FieldNumber: Integer): Text
    var
        Caption: Text;
        IsHandled: Boolean;
    begin
        if (GlobalPurchaseHeader."Document Type" <> PurchaseLine."Document Type") or
           (GlobalPurchaseHeader."No." <> PurchaseLine."Document No.")
        then
            if not GlobalPurchaseHeader.Get(PurchaseLine."Document Type", PurchaseLine."Document No.") then
                Clear(GlobalPurchaseHeader);

        OnGetPurchaseLineCaptionClass(GlobalPurchaseHeader, PurchaseLine, FieldNumber, IsHandled, Caption);
        if IsHandled then
            exit(Caption);

        case FieldNumber of
            PurchaseLine.FieldNo("No."):
                exit(StrSubstNo('3,%1', GetFieldCaption(DATABASE::"Purchase Line", FieldNumber, Caption)));
            else begin
                if GlobalPurchaseHeader."Prices Including VAT" then
                    exit('2,1,0,' + GetFieldCaption(DATABASE::"Purchase Line", FieldNumber, Caption));
                exit('2,0,' + GetFieldCaption(DATABASE::"Purchase Line", FieldNumber, Caption));
            end;
        end;
    end;

    local procedure GetFieldCaption(TableNumber: Integer; FieldNumber: Integer; Caption: Text): Text
    begin
        if (GlobalField.TableNo <> TableNumber) or (GlobalField."No." <> FieldNumber) or (GlobalField."Field Caption" <> Caption) then
            GlobalField.Get(TableNumber, FieldNumber, Caption);
        exit(GlobalField."Field Caption");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetPurchaseLineCaptionClass(PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; FieldNumber: Integer; var IsHandled: Boolean; var Caption: Text)
    begin
    end;
}