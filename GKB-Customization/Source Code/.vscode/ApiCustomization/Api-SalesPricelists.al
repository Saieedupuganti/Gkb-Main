page 50114 "Price List Lines API"
{
    PageType = API;
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'SalesPriceListLine';
    EntitySetName = 'SalesPriceListLines';
    SourceTable = "Price List Line";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                // Price list code and Line No. are the PK
                field("CrmId"; Rec."Crm Id")
                {
                    Caption = 'Crm Id';
                }
                field(ParentSourceNo; Rec."Parent Source No.")
                {
                    Caption = 'Assign-to Project No.';
                }

                field(AssignToParentNo; Rec."Assign-to Parent No.")
                {
                    Caption = 'Assign-to Project No.';
                }
                field(SourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                }
                field(AssignToNo; Rec."Assign-to No.")
                {
                    Caption = 'Assign-to No.';
                }
                field(CurrencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(StartingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }
                field(EndingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                }
                field(AssetType; Rec."Asset Type")
                {
                    Caption = 'Asset Type';
                }
                field(AssetNo; Rec."Asset No.")
                {
                    Caption = 'Asset No.';
                }
                field(ProductNo; Rec."Product No.")
                {
                    Caption = 'Product No.';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(VariantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                }
                field(WorkTypeCode; Rec."Work Type Code")
                {
                    Caption = 'Work Type Code';
                }
                field(UnitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(MinimumQuantity; Rec."Minimum Quantity")
                {
                    Caption = 'Minimum Quantity';
                }
                field(AmountType; Rec."Amount Type")
                {
                    Caption = 'Amount Type';
                }
                field(PublishedPrice; Rec."Published Price")
                {
                    Caption = 'Published Price';
                }
                field(Cost; Rec.Cost)
                {
                    Caption = 'Cost';
                }
                field(DiscountAmount; Rec."Discount Amount")  //NN
                {
                    Caption = 'Discount Amount';
                }
                field(UnitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(CostFactor; Rec."Cost Factor")
                {
                    Caption = 'Cost Factor';
                }
                field(AllowLineDiscount; Rec."Allow Line Disc.")
                {
                    Caption = 'Allow Line Disc.';
                }
                field(LineDiscountPercent; Rec."Line Discount %")
                {
                    Caption = 'Line Discount %';
                }
                field(AllowInvoiceDiscount; Rec."Allow Invoice Disc.")
                {
                    Caption = 'Allow Invoice Disc.';
                }
                field(PriceIncludesVAT; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes VAT';
                }
                field(VATBusPostingGroupPrice; Rec."VAT Bus. Posting Gr. (Price)")
                {
                    Caption = 'VAT Business Posting Group (Price)';
                }
            }
        }
    }
}
