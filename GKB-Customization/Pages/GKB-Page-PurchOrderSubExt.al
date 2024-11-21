pageextension 50118 PurchOrderSubExt extends "Purchase Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field(VendorCatalogueNo; Rec.VendorCatalogueNo)
            {
                Caption = 'Vendor Catologue No';
                ApplicationArea = all;
            }
            
        }

        //     modify("VAT Bus. Posting Group")
        //     {
        //         Caption = 'GST Bus. Posting Group';
        //     }
        //     modify("Total VAT Amount")     //in po
        //     {
        //         Caption = 'Total GST Amount';
        //         CaptionClass = GetCaptionWithCurrencyCode('Total GST Amount', Rec."Currency Code");
        //     }
        //     modify("Total Amount Excl. VAT")
        //     {
        //         Caption = 'Total Amount Excl. GST';
        //         CaptionClass = GetCaptionWithCurrencyCode('Total Amount Excl. GST', Rec."Currency Code");
        //     }
        //     modify("Total Amount Incl. VAT")
        //     {
        //         Caption = 'Total Amount Incl. GST';
        //         CaptionClass = GetCaptionWithCurrencyCode('Total Amount Incl. GST', Rec."Currency Code");
        //     }
        //     modify("VAT Prod. Posting Group")
        //     {
        //         Caption = 'GST Prod. Posting Group';
        //         //    CaptionClass=GetCaptionWithCurrencyCode('GST Prod. Posting Group',Rec."Currency Code");
        //     }
        //     modify(AmountBeforeDiscount)   //in po
        //     {
        //         Caption = 'Sub Total Excl. GST';
        //         CaptionClass = GetCaptionWithCurrencyCode('Sub Total Excl. GST', Rec."Currency Code");
        //     }
        //     modify("Location Code")
        //     {
        //         Caption = 'Warehouse';
        //     }
        //     modify("Direct Unit Cost")
        //     {
        //         Caption = 'Direct Unit Cost Excl. GST';
        //         //  CaptionClass = GetFieldCaption(39, 22);
        //     }
        //     modify("Line Amount")
        //     {
        //         Caption = 'Line Amount Excl. GST';
        //         //  CaptionClass = GetFieldCaption(39, 103);
        //     }

    }
    // actions
    // {
    //     // Add changes to page actions here
    // }

    // var
    //     myInt: Integer;

    // local procedure GetCaptionClassWithCurrencyCode(CaptionWithoutCurrencyCode: Text; CurrencyCode: Code[10]): Text
    // begin
    //     exit('3,' + GetCaptionWithCurrencyCode(CaptionWithoutCurrencyCode, CurrencyCode));
    // end;

    // local procedure GetCaptionWithCurrencyCode(CaptionWithoutCurrencyCode: Text; CurrencyCode: Code[10]): Text
    // var
    //     GLSetup: Record "General Ledger Setup";
    // begin
    //     if CurrencyCode = '' then begin
    //         GLSetup.Get();
    //         CurrencyCode := GLSetup.GetCurrencyCode(CurrencyCode);
    //     end;

    //     if CurrencyCode <> '' then
    //         exit(CaptionWithoutCurrencyCode + StrSubstNo(' (%1)', CurrencyCode));

    //     exit(CaptionWithoutCurrencyCode);
    // end;

    // var
    //     GlobalPurchaseHeader: Record "Purchase Header";
    //     GlobalField: Record "Field";

    // procedure GetPurchaseLineCaptionClass(var PurchaseLine: Record "Purchase Line"; FieldNumber: Integer): Text
    // var
    //     Caption: Text;
    //     IsHandled: Boolean;
    // begin
    //     if (GlobalPurchaseHeader."Document Type" <> PurchaseLine."Document Type") or
    //        (GlobalPurchaseHeader."No." <> PurchaseLine."Document No.")
    //     then
    //         if not GlobalPurchaseHeader.Get(PurchaseLine."Document Type", PurchaseLine."Document No.") then
    //             Clear(GlobalPurchaseHeader);

    //     OnGetPurchaseLineCaptionClass(GlobalPurchaseHeader, PurchaseLine, FieldNumber, IsHandled, Caption);
    //     if IsHandled then
    //         exit(Caption);

    //     case FieldNumber of
    //         PurchaseLine.FieldNo("No."):
    //             exit(StrSubstNo('3,%1', GetFieldCaption(DATABASE::"Purchase Line", FieldNumber)));
    //         else begin
    //             if GlobalPurchaseHeader."Prices Including VAT" then
    //                 exit('2,1,' + GetFieldCaption(DATABASE::"Purchase Line", FieldNumber));
    //             exit('2,0,' + GetFieldCaption(DATABASE::"Purchase Line", FieldNumber));
    //         end;
    //     end;
    // end;

    // local procedure GetFieldCaption(TableNumber: Integer; FieldNumber: Integer): Text
    // begin
    //     if (GlobalField.TableNo <> TableNumber) or (GlobalField."No." <> FieldNumber) then
    //         GlobalField.Get(TableNumber, FieldNumber, caption);
    //     exit(GlobalField."Field Caption");
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnGetPurchaseLineCaptionClass(PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; FieldNumber: Integer; var IsHandled: Boolean; var Caption: Text)
    // begin
    // end;
}