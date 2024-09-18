namespace GKBCustomization.GKBCustomization;

using Microsoft.Purchases.Document;

pageextension 50152 "GKB-Page-PurchaseReturnorder" extends "Purchase Return Order"
{
    layout
    {
        modify("VAT Bus. Posting Group")
        {
            Caption='GST Bus. Posting Group';
        }
        modify("VAT Reporting Date")
        {
            Caption= 'GST Reporting Date';
        }
        modify("Prices Including VAT")
        {
            Caption = 'Prices Including GST';
        }
    }
}
