page 50503 "CDS Product List"
{
    Caption = 'CDS Product List';
    PageType = List;
    SourceTable = "CDS Product";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ProductId; Rec.ProductId)
                {
                    ApplicationArea = All;
                    Caption = 'Product ID';
                }

                field(CreatedOn; rec."CreatedOn")
                {
                    ApplicationArea = All;
                    Caption = 'Created On';
                }

                field(ModifiedOn; rec."ModifiedOn")
                {
                    ApplicationArea = All;
                    Caption = 'Modified On';
                }

                field(VersionNumber; rec."VersionNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Version Number';
                }

                field(ImportSequenceNumber; rec."ImportSequenceNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Import Sequence Number';
                }

                field(OverriddenCreatedOn; rec."OverriddenCreatedOn")
                {
                    ApplicationArea = All;
                    Caption = 'Overridden Created On';
                }

                field(TimeZoneRuleVersionNumber; rec."TimeZoneRuleVersionNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Time Zone Rule Version Number';
                }

                field(UTCConversionTimeZoneCode; rec."UTCConversionTimeZoneCode")
                {
                    ApplicationArea = All;
                    Caption = 'UTC Conversion Time Zone Code';
                }

                field(Name; rec."Name")
                {
                    ApplicationArea = All;
                    Caption = 'Product Name';
                }

                field(ProcessId; rec."ProcessId")
                {
                    ApplicationArea = All;
                    Caption = 'Process ID';
                }

                field(StageId; rec."StageId")
                {
                    ApplicationArea = All;
                    Caption = 'Stage ID';
                }

                field(TraversedPath; rec."TraversedPath")
                {
                    ApplicationArea = All;
                    Caption = 'Traversed Path';
                }

                field(VendorID; rec."VendorID")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor ID';
                }

                field(ValidFromDate; rec."ValidFromDate")
                {
                    ApplicationArea = All;
                    Caption = 'Valid From Date';
                }

                field(ValidToDate; rec."ValidToDate")
                {
                    ApplicationArea = All;
                    Caption = 'Valid To Date';
                }

                field(CurrentCost; rec."CurrentCost")
                {
                    ApplicationArea = All;
                    Caption = 'Current Cost';
                }

                field(ExchangeRate; rec."ExchangeRate")
                {
                    ApplicationArea = All;
                    Caption = 'Exchange Rate';
                }

                field(CurrentCost_Base; rec."CurrentCost_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Current Cost (Base)';
                }

                field(Description; rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }

                field(IsKit; rec."IsKit")
                {
                    ApplicationArea = All;
                    Caption = 'Is Kit';
                }

                field(IsStockItem; rec."IsStockItem")
                {
                    ApplicationArea = All;
                    Caption = 'Is Stock Item';
                }

                field(ParentProductId; rec."ParentProductId")
                {
                    ApplicationArea = All;
                    Caption = 'Parent Product ID';
                }

                field(Price; rec."Price")
                {
                    ApplicationArea = All;
                    Caption = 'Price';
                }

                field(Price_Base; rec."Price_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Price (Base)';
                }

                field(ProductStructure; rec."ProductStructure")
                {
                    ApplicationArea = All;
                    Caption = 'Product Structure';
                }

                field(ProductNumber; rec."ProductNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Product Number';
                }

                field(ProductTypeCode; rec."ProductTypeCode")
                {
                    ApplicationArea = All;
                    Caption = 'Product Type Code';
                }

                field(ProductUrl; rec."ProductUrl")
                {
                    ApplicationArea = All;
                    Caption = 'Product URL';
                }

                field(QuantityDecimal; rec."QuantityDecimal")
                {
                    ApplicationArea = All;
                    Caption = 'Quantity Decimal';
                }

                field(QuantityOnHand; rec."QuantityOnHand")
                {
                    ApplicationArea = All;
                    Caption = 'Quantity On Hand';
                }

                field(Size; rec."Size")
                {
                    ApplicationArea = All;
                    Caption = 'Size';
                }

                field(StandardCost; rec."StandardCost")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Cost';
                }

                field(StandardCost_Base; rec."StandardCost_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Cost (Base)';
                }

                field(StateCode; rec."StateCode")
                {
                    ApplicationArea = All;
                    Caption = 'State Code';
                }

                field(StatusCode; rec."StatusCode")
                {
                    ApplicationArea = All;
                    Caption = 'Status Code';
                }

                field(StockVolume; rec."StockVolume")
                {
                    ApplicationArea = All;
                    Caption = 'Stock Volume';
                }

                field(StockWeight; rec."StockWeight")
                {
                    ApplicationArea = All;
                    Caption = 'Stock Weight';
                }

                field(SupplierName; rec."SupplierName")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Name';
                }

                field(VendorName; rec."VendorName")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Name';
                }

                field(VendorPartNumber; rec."VendorPartNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Part Number';
                }

                field(HierarchyPath; rec."HierarchyPath")
                {
                    ApplicationArea = All;
                    Caption = 'Hierarchy Path';
                }

                field(EntityImageId; rec."EntityImageId")
                {
                    ApplicationArea = All;
                    Caption = 'Entity Image ID';
                }

                field(ParentProductIdName; rec."ParentProductIdName")
                {
                    ApplicationArea = All;
                    Caption = 'Parent Product ID Name';
                }

                field(IsReparented; rec."IsReparented")
                {
                    ApplicationArea = All;
                    Caption = 'Is Reparented';
                }

                field(msdyn_gdproptout; rec."msdyn_gdproptout")
                {
                    ApplicationArea = All;
                    Caption = 'GDPR Opt-out';
                }

                field(msdyn_FieldServiceProductType; rec."msdyn_FieldServiceProductType")
                {
                    ApplicationArea = All;
                    Caption = 'Field Service Product Type';
                }

                field(msdyn_ConvertToCustomerAsset; rec."msdyn_ConvertToCustomerAsset")
                {
                    ApplicationArea = All;
                    Caption = 'Convert to Customer Asset';
                }

                field(msdyn_DefaultVendor; rec."msdyn_DefaultVendor")
                {
                    ApplicationArea = All;
                    Caption = 'Default Vendor';
                }

                field(msdyn_PurchaseName; rec."msdyn_PurchaseName")
                {
                    ApplicationArea = All;
                    Caption = 'Purchase Name';
                }

                field(msdyn_Taxable; rec."msdyn_Taxable")
                {
                    ApplicationArea = All;
                    Caption = 'Taxable';
                }

                field(msdyn_UPCCode; rec."msdyn_UPCCode")
                {
                    ApplicationArea = All;
                    Caption = 'UPC Code';
                }

                field(adids_InternalProductName; rec."adids_InternalProductName")
                {
                    ApplicationArea = All;
                    Caption = 'Internal Product Name';
                }

                field(adids_PurchaseItem; rec."adids_PurchaseItem")
                {
                    ApplicationArea = All;
                    Caption = 'Purchase Item';
                }

                field(adids_MinimumOrderQuantity; rec."adids_MinimumOrderQuantity")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Order Quantity';
                }

                field(adids_Manufacturer; rec."adids_Manufacturer")
                {
                    ApplicationArea = All;
                    Caption = 'Manufacturer';
                }

                field(adids_ManufacturerCatalogNo; rec."adids_ManufacturerCatalogNo")
                {
                    ApplicationArea = All;
                    Caption = 'Manufacturer Catalog No';
                }

                field(adids_ManufactureCountry; rec."adids_ManufactureCountry")
                {
                    ApplicationArea = All;
                    Caption = 'Manufacture Country';
                }

                field(adids_VendorDescription; rec."adids_VendorDescription")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Description';
                }

                field(adids_AlternateVendor; rec."adids_AlternateVendor")
                {
                    ApplicationArea = All;
                    Caption = 'Alternate Vendor';
                }

                field(adids_AlternateVendorCatalogNumber; rec."adids_AlternateVendorCatalogNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Alternate Vendor Catalog Number';
                }

                field(adids_AlternateVendorDiscPrice; rec."adids_AlternateVendorDiscPrice")
                {
                    ApplicationArea = All;
                    Caption = 'Alternate Vendor Discount Price';
                }

                field(adids_alternatevendordiscprice_Base; rec."adids_alternatevendordiscprice_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Alternate Vendor Discount Price (Base)';
                }

                field(adids_AlternateVendorlistPrice; rec."adids_AlternateVendorlistPrice")
                {
                    ApplicationArea = All;
                    Caption = 'Alternate Vendor List Price';
                }

                field(adids_alternatevendorlistprice_Base; rec."adids_alternatevendorlistprice_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Alternate Vendor List Price (Base)';
                }

                field(adids_AdditionalSpecialInstructions; rec."adids_AdditionalSpecialInstructions")
                {
                    ApplicationArea = All;
                    Caption = 'Additional Special Instructions';
                }

                field(adids_MarkupPercentage; rec."adids_MarkupPercentage")
                {
                    ApplicationArea = All;
                    Caption = 'Markup Percentage';
                }

                field(adids_ProjectSellPrice; rec."adids_ProjectSellPrice")
                {
                    ApplicationArea = All;
                    Caption = 'Project Sell Price';
                }

                field(adids_projectsellprice_Base; rec."adids_projectsellprice_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Project Sell Price (Base)';
                }

                field(adids_DiscountedPrice; rec."adids_DiscountedPrice")
                {
                    ApplicationArea = All;
                    Caption = 'Discounted Price';
                }

                field(adids_discountedprice_Base; rec."adids_discountedprice_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Discounted Price (Base)';
                }
                field(adids_ProductIDBase; rec."adids_ProductIDBase")
                {
                    ApplicationArea = All;
                    Caption = 'Product ID Base';
                }

                field(adids_ProductID; rec."adids_ProductID")
                {
                    ApplicationArea = All;
                    Caption = 'Product ID';
                }

                field(cr72a_QRCode; rec."cr72a_QRCode")
                {
                    ApplicationArea = All;
                    Caption = 'QR Code';
                }

                field(adids_BarCodeId; rec."adids_BarCodeId")
                {
                    ApplicationArea = All;
                    Caption = 'Bar Code ID';
                }

                field(adids_Product_QR_CodeId; rec."adids_Product_QR_CodeId")
                {
                    ApplicationArea = All;
                    Caption = 'Product QR Code ID';
                }

                field(adids_GroupName; rec."adids_GroupName")
                {
                    ApplicationArea = All;
                    Caption = 'Group Name';
                }

                field(adids_AdditionalSpecs; rec."adids_AdditionalSpecs")
                {
                    ApplicationArea = All;
                    Caption = 'Additional Specs';
                }

                field(adids_AlternateVendor3; rec."adids_AlternateVendor3")
                {
                    ApplicationArea = All;
                    Caption = 'Alternate Vendor 3';
                }

                field(adids_OBSInternalSerialNumber; rec."adids_OBSInternalSerialNumber")
                {
                    ApplicationArea = All;
                    Caption = 'OBS Internal Serial Number';
                }

                field(adids_Pressure; rec."adids_Pressure")
                {
                    ApplicationArea = All;
                    Caption = 'Pressure';
                }

                field(adids_ProductLength; rec."adids_ProductLength")
                {
                    ApplicationArea = All;
                    Caption = 'Product Length';
                }

                field(adids_ProductWidth; rec."adids_ProductWidth")
                {
                    ApplicationArea = All;
                    Caption = 'Product Width';
                }

                field(adids_Vendor3CatalogueNumber; rec."adids_Vendor3CatalogueNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor 3 Catalogue Number';
                }

                field(adids_Vendor3CurrentCost; rec."adids_Vendor3CurrentCost")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor 3 Current Cost';
                }

                field(adids_vendor3currentcost_Base; rec."adids_vendor3currentcost_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor 3 Current Cost (Base)';
                }

                field(adids_Vendor3StandardCost; rec."adids_Vendor3StandardCost")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor 3 Standard Cost';
                }

                field(adids_vendor3standardcost_Base; rec."adids_vendor3standardcost_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor 3 Standard Cost (Base)';
                }

                field(adids_Vendor1SAPCode; rec."adids_Vendor1SAPCode")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor 1 SAP Code';
                }

                field(adids_Vendor2SAPCode; rec."adids_Vendor2SAPCode")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor 2 SAP Code';
                }

                field(adids_Vendor3SAPCode; rec."adids_Vendor3SAPCode")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor 3 SAP Code';
                }

                field(adids_TradeType; rec."adids_TradeType")
                {
                    ApplicationArea = All;
                    Caption = 'Trade Type';
                }

                field(adids_QRCodePixelSize; rec."adids_QRCodePixelSize")
                {
                    ApplicationArea = All;
                    Caption = 'QR Code Pixel Size';
                }

                field(CRMID; rec."CRM ID")
                {
                    ApplicationArea = All;
                    Caption = 'CRM ID';
                }
            }
        }
    }
}