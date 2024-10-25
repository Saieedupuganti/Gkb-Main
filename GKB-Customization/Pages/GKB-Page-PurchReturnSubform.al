// pageextension 50154 "Purchase return Sub ext" extends "Purchase Return Order Subform"
// {
//     layout
//     {
//         modify("VAT Bus. Posting Group")
//         {
//             Caption = 'GST Bus. Posting Group';
//         }
//         modify("VAT Prod. Posting Group")
//         {
//             Caption = 'GST Prod. Posting Group';
//         }
//         modify("Total VAT Amount")           //captionclasss
//         {
//             Caption = 'Total GST Amount';
//             CaptionClass = GetCaptionClassWithCurrencyCode('Total GST Amount', rec."Currency Code");
//         }
//         modify("Total Amount Excl. VAT")
//         {
//             Caption = 'Total Amount Excl. GST';     //captionclass
//             CaptionClass = GetCaptionClassWithCurrencyCode('Total Amount Excl. GST', rec."Currency Code");
//         }
//         modify("Total Amount Incl. VAT")
//         {
//             Caption = 'Total Amount Incl. GST';// caption class
//             CaptionClass = GetCaptionClassWithCurrencyCode('Total Amount Incl. GST', rec."Currency Code");
//         }
//         modify(AmountBeforeDiscount)
//         {
//             Caption = 'Subtotal Excl. GST';       //Captionclass
//             CaptionClass = GetCaptionClassWithCurrencyCode('Subtotal Excl. GST', rec."Currency Code");
//         }
//         modify("Direct Unit Cost")
//         {
//             Caption = 'Direct Unit Cost Excl. GSt';
//         }
//         modify("Line Amount")
//         {
//             Caption = 'Line Amount Excl. GST';
//         }
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;

//     local procedure GetCaptionClassWithCurrencyCode(CaptionWithoutCurrencyCode: Text; CurrencyCode: Code[10]): Text
//     begin
//         exit('3,' + GetCaptionWithCurrencyCode(CaptionWithoutCurrencyCode, CurrencyCode));
//     end;

//     local procedure GetCaptionWithCurrencyCode(CaptionWithoutCurrencyCode: Text; CurrencyCode: Code[10]): Text
//     var
//         GLSetup: Record "General Ledger Setup";
//     begin
//         if CurrencyCode = '' then begin
//             GLSetup.Get();
//             CurrencyCode := GLSetup.GetCurrencyCode(CurrencyCode);
//         end;

//         if CurrencyCode <> '' then
//             exit(CaptionWithoutCurrencyCode + StrSubstNo(' (%1)', CurrencyCode));

//         exit(CaptionWithoutCurrencyCode);
//     end;

// }