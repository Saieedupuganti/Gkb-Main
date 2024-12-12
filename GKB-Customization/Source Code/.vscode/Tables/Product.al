table 50134 "CDS Product"
{
  ExternalName = 'product';
  TableType = CDS;
  Description = 'Information about products and their pricing information.';

  fields
  {
    field(10000; ProductId; GUID)
    {
      ExternalName = 'productid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Insert;
      Description = 'Unique identifier of the product.';
      Caption = 'Product';
    }
    field(10001; CreatedOn; Datetime)
    {
      ExternalName = 'createdon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the record was created.';
      Caption = 'Created On';
    }
    field(10003; ModifiedOn; Datetime)
    {
      ExternalName = 'modifiedon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the record was modified.';
      Caption = 'Modified On';
    }
    field(10017; VersionNumber; BigInteger)
    {
      ExternalName = 'versionnumber';
      ExternalType = 'BigInt';
      ExternalAccess = Read;
      Description = 'Version Number';
      Caption = 'Version Number';
    }
    field(10018; ImportSequenceNumber; Integer)
    {
      ExternalName = 'importsequencenumber';
      ExternalType = 'Integer';
      ExternalAccess = Insert;
      Description = 'Sequence number of the import that created this record.';
      Caption = 'Import Sequence Number';
    }
    field(10019; OverriddenCreatedOn; Date)
    {
      ExternalName = 'overriddencreatedon';
      ExternalType = 'DateTime';
      ExternalAccess = Insert;
      Description = 'Date and time that the record was migrated.';
      Caption = 'Record Created On';
    }
    field(10020; TimeZoneRuleVersionNumber; Integer)
    {
      ExternalName = 'timezoneruleversionnumber';
      ExternalType = 'Integer';
      Description = 'For internal use only.';
      Caption = 'Time Zone Rule Version Number';
    }
    field(10021; UTCConversionTimeZoneCode; Integer)
    {
      ExternalName = 'utcconversiontimezonecode';
      ExternalType = 'Integer';
      Description = 'Time zone code that was in use when the record was created.';
      Caption = 'UTC Conversion Time Zone Code';
    }
    field(10022; Name; Text[100])
    {
      ExternalName = 'name';
      ExternalType = 'String';
      Description = 'Name of the product.';
      Caption = 'Customer Product Name';
    }
    field(10023; ProcessId; GUID)
    {
      ExternalName = 'processid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Contains the id of the process associated with the entity.';
      Caption = 'Process Id';
    }
    field(10024; StageId; GUID)
    {
      ExternalName = 'stageid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Contains the id of the stage where the entity is located.';
      Caption = '(Deprecated) Stage Id';
    }
    field(10025; TraversedPath; Text[1250])
    {
      ExternalName = 'traversedpath';
      ExternalType = 'String';
      Description = 'A comma separated list of string values representing the unique identifiers of stages in a Business Process Flow Instance in the order that they occur.';
      Caption = '(Deprecated) Traversed Path';
    }
    field(10027; VendorID; Text[100])
    {
      ExternalName = 'vendorid';
      ExternalType = 'String';
      Description = 'Unique identifier of vendor supplying the product.';
      Caption = 'Vendor ID';
    }
    field(10028; ValidFromDate; Date)
    {
      ExternalName = 'validfromdate';
      ExternalType = 'DateTime';
      Description = 'Date from which this product is valid.';
      Caption = 'Valid From';
    }
    field(10029; ValidToDate; Date)
    {
      ExternalName = 'validtodate';
      ExternalType = 'DateTime';
      Description = 'Date to which this product is valid.';
      Caption = 'Valid To';
    }
    field(10030; CurrentCost; Decimal)
    {
      ExternalName = 'currentcost';
      ExternalType = 'Money';
      Description = 'Current cost for the product item. Used in price calculations.';
      Caption = 'Current Cost';
    }
    field(10033; ExchangeRate; Decimal)
    {
      ExternalName = 'exchangerate';
      ExternalType = 'Decimal';
      ExternalAccess = Read;
      Description = 'Exchange rate for the currency associated with the product with respect to the base currency.';
      Caption = 'Exchange Rate';
    }
    field(10034; CurrentCost_Base; Decimal)
    {
      ExternalName = 'currentcost_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Current Cost in base currency.';
      Caption = 'Current Cost (Base)';
    }
    field(10037; Description; BLOB)
    {
      ExternalName = 'description';
      ExternalType = 'Memo';
      Description = 'Description of the product.';
      Caption = 'Description';
      Subtype = Memo;
    }
    field(10038; IsKit; Boolean)
    {
      ExternalName = 'iskit';
      ExternalType = 'Boolean';
      Description = 'Information that specifies whether the product is a kit.';
      Caption = 'Is Kit';
    }
    field(10040; IsStockItem; Boolean)
    {
      ExternalName = 'isstockitem';
      ExternalType = 'Boolean';
      Description = 'Information about whether the product is a stock item.';
      Caption = 'Stock Item';
    }
    field(10042; ParentProductId; GUID)
    {
      ExternalName = 'parentproductid';
      ExternalType = 'Lookup';
      Description = 'Specifies the parent product family hierarchy.';
      Caption = 'Parent';
      TableRelation = "CDS Product".ProductId;
    }
    field(10043; Price; Decimal)
    {
      ExternalName = 'price';
      ExternalType = 'Money';
      Description = 'List price for the product item. Used in price calculations.';
      Caption = 'List Price';
    }
    field(10044; Price_Base; Decimal)
    {
      ExternalName = 'price_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the List Price in base currency.';
      Caption = 'List Price (Base)';
    }
    field(10045; ProductStructure; Option)
    {
      ExternalName = 'productstructure';
      ExternalType = 'Picklist';
      ExternalAccess = Insert;
      Description = 'Product Structure.';
      Caption = 'Product Structure';
      InitValue = Product;
      OptionMembers = Product, ProductFamily, ProductBundle;
      OptionOrdinalValues = 1, 2, 3;
    }
    field(10047; ProductNumber; Text[100])
    {
      ExternalName = 'productnumber';
      ExternalType = 'String';
      Description = 'User-defined product ID.';
      Caption = 'SAP Item No.';
    }
    field(10048; ProductTypeCode; Option)
    {
      ExternalName = 'producttypecode';
      ExternalType = 'Picklist';
      Description = 'Type of product.';
      Caption = 'Product Type';
      InitValue = SalesInventory;
      OptionMembers = SalesInventory, MiscellaneousCharges, Services, FlatFees;
      OptionOrdinalValues = 1, 2, 3, 4;
    }
    field(10050; ProductUrl; Text[255])
    {
      ExternalName = 'producturl';
      ExternalType = 'String';
      Description = 'URL for the Website associated with the product.';
      Caption = 'URL';
    }
    field(10051; QuantityDecimal; Integer)
    {
      ExternalName = 'quantitydecimal';
      ExternalType = 'Integer';
      Description = 'Number of decimal places that can be used in monetary amounts for the product.';
      Caption = 'Decimals Supported';
    }
    field(10052; QuantityOnHand; Decimal)
    {
      ExternalName = 'quantityonhand';
      ExternalType = 'Decimal';
      Description = 'Quantity of the product in stock.';
      Caption = 'Quantity On Hand';
    }
    field(10053; Size; Text[200])
    {
      ExternalName = 'size';
      ExternalType = 'String';
      Description = 'Product size.';
      Caption = 'Size';
    }
    field(10054; StandardCost; Decimal)
    {
      ExternalName = 'standardcost';
      ExternalType = 'Money';
      Description = 'Standard cost for the product item. Used in price calculations.';
      Caption = 'Standard Cost';
    }
    field(10055; StandardCost_Base; Decimal)
    {
      ExternalName = 'standardcost_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Standard Cost in base currency.';
      Caption = 'Standard Cost (Base)';
    }
    field(10056; StateCode; Option)
    {
      ExternalName = 'statecode';
      ExternalType = 'State';
      Description = 'Status of the product.';
      Caption = 'Status';
      InitValue = Draft;
      OptionMembers = Active, Retired, Draft, UnderRevision;
      OptionOrdinalValues = 0, 1, 2, 3;
    }
    field(10058; StatusCode; Option)
    {
      ExternalName = 'statuscode';
      ExternalType = 'Status';
      Description = 'Reason for the status of the product.';
      Caption = 'Status Reason';
      InitValue = " ";
      OptionMembers = " ", Active, Retired, Draft, UnderRevision;
      OptionOrdinalValues = -1, 1, 2, 0, 3;
    }
    field(10060; StockVolume; Decimal)
    {
      ExternalName = 'stockvolume';
      ExternalType = 'Decimal';
      Description = 'Stock volume of the product.';
      Caption = 'Stock Volume';
    }
    field(10061; StockWeight; Decimal)
    {
      ExternalName = 'stockweight';
      ExternalType = 'Decimal';
      Description = 'Stock weight of the product.';
      Caption = 'Stock Weight';
    }
    field(10062; SupplierName; Text[100])
    {
      ExternalName = 'suppliername';
      ExternalType = 'String';
      Description = 'Name of the product''s supplier.';
      Caption = 'Supplier Name';
    }
    field(10063; VendorName; Text[100])
    {
      ExternalName = 'vendorname';
      ExternalType = 'String';
      Description = 'Name of the product vendor.';
      Caption = 'Vendor';
    }
    field(10064; VendorPartNumber; Text[100])
    {
      ExternalName = 'vendorpartnumber';
      ExternalType = 'String';
      Description = 'Unique part identifier in vendor catalog of this product.';
      Caption = 'Vendor Name';
    }
    field(10065; HierarchyPath; Text[450])
    {
      ExternalName = 'hierarchypath';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = 'Hierarchy path of the product.';
      Caption = 'Hierarchy Path';
    }
    field(10068; EntityImageId; GUID)
    {
      ExternalName = 'entityimageid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Read;
    }
    field(10079; ParentProductIdName; Text[100])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS Product".Name where(ProductId=field(ParentProductId)));
      ExternalName = 'parentproductidname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(10083; IsReparented; Boolean)
    {
      ExternalName = 'isreparented';
      ExternalType = 'Boolean';
      Description = '';
      Caption = 'Is Reparented';
    }
    field(10085; msdyn_gdproptout; Boolean)
    {
      ExternalName = 'msdyn_gdproptout';
      ExternalType = 'Boolean';
      Description = 'Describes whether product is opted out or not';
      Caption = 'GDPR Optout';
    }
    field(10087; msdyn_FieldServiceProductType; Option)
    {
      ExternalName = 'msdyn_fieldserviceproducttype';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Field Service Product Type';
      InitValue = " ";
      OptionMembers = " ", Inventory, "Non-Inventory", Service;
      OptionOrdinalValues = -1, 690970000, 690970001, 690970002;
    }
    field(10089; msdyn_ConvertToCustomerAsset; Boolean)
    {
      ExternalName = 'msdyn_converttocustomerasset';
      ExternalType = 'Boolean';
      Description = 'Specify whether a product is to be converted to a customer asset. When a product is used on a work order, the system will automatically convert it into a customer asset when the work order is closed.';
      Caption = 'Convert to Customer Asset';
    }
    field(10091; msdyn_DefaultVendor; GUID)
    {
      ExternalName = 'msdyn_defaultvendor';
      ExternalType = 'Lookup';
      Description = 'Default vendor that supplies this product';
      Caption = 'Default Vendor';
      TableRelation = "CDS Account".AccountId;
    }
    field(10092; msdyn_PurchaseName; Text[100])
    {
      ExternalName = 'msdyn_purchasename';
      ExternalType = 'String';
      Description = 'Type the name for the product when used on a purchase order.';
      Caption = 'Purchase Name';
    }
    field(10093; msdyn_Taxable; Boolean)
    {
      ExternalName = 'msdyn_taxable';
      ExternalType = 'Boolean';
      Description = 'Select whether the item is taxable. If an item is set as not taxable, it won''t be taxable even on a taxable work order.';
      Caption = 'Taxable';
    }
    field(10095; msdyn_UPCCode; Text[50])
    {
      ExternalName = 'msdyn_upccode';
      ExternalType = 'String';
      Description = 'Shows the UPC Code for product. Used for bar code scanning.';
      Caption = 'UPC Code';
    }
    field(10098; adids_InternalProductName; Text[100])
    {
      ExternalName = 'adids_internalproductname';
      ExternalType = 'String';
      Description = '';
      Caption = 'Internal Product Name';
    }
    field(10099; adids_PurchaseItem; Boolean)
    {
      ExternalName = 'adids_purchaseitem';
      ExternalType = 'Boolean';
      Description = '';
      Caption = 'Purchase Item';
    }
    field(10101; adids_MinimumOrderQuantity; Integer)
    {
      ExternalName = 'adids_minimumorderquantity';
      ExternalType = 'Integer';
      Description = '';
      Caption = 'Minimum Order Quantity';
    }
    field(10102; adids_Manufacturer; GUID)
    {
      ExternalName = 'adids_manufacturer';
      ExternalType = 'Lookup';
      Description = '';
      Caption = 'Manufacturer';
      TableRelation = "CDS Account".AccountId;
    }
    field(10105; adids_ManufacturerCatalogNo; Text[100])
    {
      ExternalName = 'adids_manufacturercatalogno';
      ExternalType = 'String';
      Description = '';
      Caption = 'Vendor 1 Catalogue Number';
    }
    field(10106; adids_ManufactureCountry; Text[100])
    {
      ExternalName = 'adids_manufacturecountry';
      ExternalType = 'String';
      Description = '';
      Caption = 'Manufacture Country';
    }
    field(10107; adids_VendorDescription; BLOB)
    {
      ExternalName = 'adids_vendordescription';
      ExternalType = 'Memo';
      Description = '';
      Caption = 'Vendor Description';
      Subtype = Memo;
    }
    field(10111; adids_AlternateVendor; GUID)
    {
      ExternalName = 'adids_alternatevendor';
      ExternalType = 'Lookup';
      Description = 'Alternate Vendor';
      Caption = 'Alternate Vendor 2';
      TableRelation = "CDS Account".AccountId;
    }
    field(10114; adids_AlternateVendorCatalogNumber; Text[100])
    {
      ExternalName = 'adids_alternatevendorcatalognumber';
      ExternalType = 'String';
      Description = 'Alternate Vendor Catalog Number';
      Caption = 'Vendor 2 Catalogue Number';
    }
    field(10115; adids_AlternateVendorDiscPrice; Decimal)
    {
      ExternalName = 'adids_alternatevendordiscprice';
      ExternalType = 'Money';
      Description = '';
      Caption = 'Vendor 2 Current Cost';
    }
    field(10116; adids_alternatevendordiscprice_Base; Decimal)
    {
      ExternalName = 'adids_alternatevendordiscprice_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the  Alternate Vendor Disc Price   in base currency.';
      Caption = ' Alternate Vendor Disc Price   (Base)';
    }
    field(10117; adids_AlternateVendorlistPrice; Decimal)
    {
      ExternalName = 'adids_alternatevendorlistprice';
      ExternalType = 'Money';
      Description = ' Alternate Vendor list Price  ';
      Caption = 'Vendor 2 Standard Cost';
    }
    field(10118; adids_alternatevendorlistprice_Base; Decimal)
    {
      ExternalName = 'adids_alternatevendorlistprice_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the  Alternate Vendor list Price   in base currency.';
      Caption = ' Alternate Vendor list Price   (Base)';
    }
    field(10120; adids_AdditionalSpecialInstructions; BLOB)
    {
      ExternalName = 'adids_additionalspecialinstructions';
      ExternalType = 'Memo';
      Description = '';
      Caption = 'Additional Special Instructions';
      Subtype = Memo;
    }
    field(10121; adids_MarkupPercentage; Decimal)
    {
      ExternalName = 'adids_markuppercentage';
      ExternalType = 'Double';
      Description = '';
      Caption = 'Markup Percentage';
    }
    field(10122; adids_ProjectSellPrice; Decimal)
    {
      ExternalName = 'adids_projectsellprice';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = '';
      Caption = 'Project Sell Price';
    }
    field(10123; adids_projectsellprice_Base; Decimal)
    {
      ExternalName = 'adids_projectsellprice_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Project Sell Price in base currency.';
      Caption = 'Project Sell Price (Base)';
    }
    field(10124; adids_DiscountedPrice; Decimal)
    {
      ExternalName = 'adids_discountedprice';
      ExternalType = 'Money';
      Description = '';
      Caption = 'Sell Price';
    }
    field(10125; adids_discountedprice_Base; Decimal)
    {
      ExternalName = 'adids_discountedprice_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Discounted Price in base currency.';
      Caption = 'Discounted Price (Base)';
    }
    field(10126; adids_ProductIDBase; Text[100])
    {
      ExternalName = 'adids_productidbase';
      ExternalType = 'String';
      Description = 'Product ID (Base)';
      Caption = 'Product ID (Base)';
    }
    field(10127; adids_ProductID; Text[100])
    {
      ExternalName = 'adids_productid';
      ExternalType = 'String';
      Description = 'Product ID';
      Caption = 'Product ID';
    }
    field(10132; cr72a_QRCode; Text[100])
    {
      ExternalName = 'cr72a_qrcode';
      ExternalType = 'String';
      Description = '';
      Caption = 'QR Code';
    }
    field(10137; adids_BarCodeId; GUID)
    {
      ExternalName = 'adids_barcodeid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Read;
    }
    field(10143; adids_Product_QR_CodeId; GUID)
    {
      ExternalName = 'adids_product_qr_codeid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Read;
    }
    field(10147; adids_GroupName; Option)
    {
      ExternalName = 'adids_groupname';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Group Name';
      InitValue = " ";
      OptionMembers = " ", AdditionalExpenses, Ancillaries, Boilers, "Burners&Controls", ElectricalComponents, EngineeredItems, FixedAssets, "Gaskets&Consumables", GaugeGlass, Instruments, "Plumbing&Piping", Pumps, SteelCopperFitting, TBA, "Valves&Actuators";
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005, 888880006, 888880007, 888880008, 888880009, 888880010, 888880011, 888880012, 888880013, 888880014;
    }
    field(10149; adids_AdditionalSpecs; Text[400])
    {
      ExternalName = 'adids_additionalspecs';
      ExternalType = 'String';
      Description = '';
      Caption = 'Additional Specs';
    }
    field(10150; adids_AlternateVendor3; GUID)
    {
      ExternalName = 'adids_alternatevendor3';
      ExternalType = 'Lookup';
      Description = '';
      Caption = 'Alternate Vendor 3';
      TableRelation = "CDS Account".AccountId;
    }
    field(10151; adids_OBSInternalSerialNumber; Text[100])
    {
      ExternalName = 'adids_obsinternalserialnumber';
      ExternalType = 'String';
      Description = '';
      Caption = 'OBS Internal Serial Number';
    }
    field(10152; adids_Pressure; Text[100])
    {
      ExternalName = 'adids_pressure';
      ExternalType = 'String';
      Description = '';
      Caption = 'Pressure';
    }
    field(10153; adids_ProductLength; Text[100])
    {
      ExternalName = 'adids_productlength';
      ExternalType = 'String';
      Description = '';
      Caption = 'Product Length';
    }
    field(10154; adids_ProductWidth; Text[100])
    {
      ExternalName = 'adids_productwidth';
      ExternalType = 'String';
      Description = '';
      Caption = 'Product Width';
    }
    field(10156; adids_Vendor3CatalogueNumber; Text[200])
    {
      ExternalName = 'adids_vendor3cataloguenumber';
      ExternalType = 'String';
      Description = '';
      Caption = 'Vendor 3 Catalogue Number';
    }
    field(10158; adids_Vendor3CurrentCost; Decimal)
    {
      ExternalName = 'adids_vendor3currentcost';
      ExternalType = 'Money';
      Description = '';
      Caption = 'Vendor 3 Current Cost';
    }
    field(10159; adids_vendor3currentcost_Base; Decimal)
    {
      ExternalName = 'adids_vendor3currentcost_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Vendor 3 Current Cost in base currency.';
      Caption = 'Vendor 3 Current Cost (Base)';
    }
    field(10160; adids_Vendor3StandardCost; Decimal)
    {
      ExternalName = 'adids_vendor3standardcost';
      ExternalType = 'Money';
      Description = '';
      Caption = 'Vendor 3 Standard Cost';
    }
    field(10161; adids_vendor3standardcost_Base; Decimal)
    {
      ExternalName = 'adids_vendor3standardcost_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Vendor 3 Standard Cost in base currency.';
      Caption = 'Vendor 3 Standard Cost (Base)';
    }
    field(10162; adids_Vendor1SAPCode; Text[2048])
    {
      ExternalName = 'adids_vendor1sapcode';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = '';
      Caption = 'Vendor 1 SAP Code';
    }
    field(10163; adids_Vendor2SAPCode; Text[2048])
    {
      ExternalName = 'adids_vendor2sapcode';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = '';
      Caption = 'Vendor 2 SAP Code ';
    }
    field(10164; adids_Vendor3SAPCode; Text[2048])
    {
      ExternalName = 'adids_vendor3sapcode';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = '';
      Caption = 'Vendor 3 SAP Code';
    }
    field(10171; adids_TradeType; Option)
    {
      ExternalName = 'adids_tradetype';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Trade Type';
      InitValue = " ";
      OptionMembers = " ", ServiceEngineerDualTrade, "First-YearApprentice", "Second-YearApprenctice", "Third-YearApprenctice", "Fourth-YearApprenctice";
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004;
    }
    field(10173; adids_QRCodePixelSize; Integer)
    {
      ExternalName = 'adids_qrcodepixelsize';
      ExternalType = 'Integer';
      Description = '';
      Caption = 'QR Code Pixel Size';
    }
  }
  keys
  {
    key(PK; ProductId)
    {
      Clustered = true;
    }
    key(Name; Name)
    {
    }
  }
  fieldgroups
  {
    fieldgroup(DropDown; Name)
    {
    }
  }
}