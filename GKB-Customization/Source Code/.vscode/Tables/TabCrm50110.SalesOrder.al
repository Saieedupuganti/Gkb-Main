table 50110 "CDS SalesOrder 2"
{
  ExternalName = 'salesorder';
  TableType = CDS;
  Description = 'Quote that has been accepted.';

  fields
  {
    field(10000; SalesOrderId; GUID)
    {
      ExternalName = 'salesorderid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Insert;
      Description = 'Unique identifier of the order.';
      Caption = 'Order';
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
    field(10024; VersionNumber; BigInteger)
    {
      ExternalName = 'versionnumber';
      ExternalType = 'BigInt';
      ExternalAccess = Read;
      Description = 'Version Number';
      Caption = 'Version Number';
    }
    field(10025; EmailAddress; Text[100])
    {
      ExternalName = 'emailaddress';
      ExternalType = 'String';
      Description = 'The primary email address for the entity.';
      Caption = 'Email Address';
    }
    field(10026; ImportSequenceNumber; Integer)
    {
      ExternalName = 'importsequencenumber';
      ExternalType = 'Integer';
      ExternalAccess = Insert;
      Description = 'Sequence number of the import that created this record.';
      Caption = 'Import Sequence Number';
    }
    field(10027; OverriddenCreatedOn; Date)
    {
      ExternalName = 'overriddencreatedon';
      ExternalType = 'DateTime';
      ExternalAccess = Insert;
      Description = 'Date and time that the record was migrated.';
      Caption = 'Record Created On';
    }
    field(10028; TimeZoneRuleVersionNumber; Integer)
    {
      ExternalName = 'timezoneruleversionnumber';
      ExternalType = 'Integer';
      Description = 'For internal use only.';
      Caption = 'Time Zone Rule Version Number';
    }
    field(10029; UTCConversionTimeZoneCode; Integer)
    {
      ExternalName = 'utcconversiontimezonecode';
      ExternalType = 'Integer';
      Description = 'Time zone code that was in use when the record was created.';
      Caption = 'UTC Conversion Time Zone Code';
    }
    field(10030; Name; Text[300])
    {
      ExternalName = 'name';
      ExternalType = 'String';
      Description = 'Type a descriptive name for the order.';
      Caption = 'Name';
    }
    field(10031; ProcessId; GUID)
    {
      ExternalName = 'processid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Contains the id of the process associated with the entity.';
      Caption = 'Process Id';
    }
    field(10032; StageId; GUID)
    {
      ExternalName = 'stageid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Contains the id of the stage where the entity is located.';
      Caption = '(Deprecated) Stage Id';
    }
    field(10033; TraversedPath; Text[1250])
    {
      ExternalName = 'traversedpath';
      ExternalType = 'String';
      Description = 'A comma separated list of string values representing the unique identifiers of stages in a Business Process Flow Instance in the order that they occur.';
      Caption = '(Deprecated) Traversed Path';
    }
    field(10034; BillTo_AddressId; GUID)
    {
      ExternalName = 'billto_addressid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Unique identifier of the billing address.';
      Caption = 'Bill To Address ID';
    }
    field(10035; BillTo_City; Text[80])
    {
      ExternalName = 'billto_city';
      ExternalType = 'String';
      Description = 'Type the city for the customer''s billing address.';
      Caption = 'Bill To City';
    }
    field(10036; BillTo_Composite; BLOB)
    {
      ExternalName = 'billto_composite';
      ExternalType = 'Memo';
      ExternalAccess = Read;
      Description = 'Shows the complete Bill To address.';
      Caption = 'Bill To Address';
      Subtype = Memo;
    }
    field(10037; BillTo_ContactName; Text[150])
    {
      ExternalName = 'billto_contactname';
      ExternalType = 'String';
      Description = 'Type the primary contact name at the customer''s billing address.';
      Caption = 'Bill To Contact Name';
    }
    field(10038; BillTo_Country; Text[80])
    {
      ExternalName = 'billto_country';
      ExternalType = 'String';
      Description = 'Type the country or region for the customer''s billing address.';
      Caption = 'Bill To Country/Region';
    }
    field(10039; BillTo_Fax; Text[50])
    {
      ExternalName = 'billto_fax';
      ExternalType = 'String';
      Description = 'Type the fax number for the customer''s billing address.';
      Caption = 'Bill To Fax';
    }
    field(10040; BillTo_Line1; Text[250])
    {
      ExternalName = 'billto_line1';
      ExternalType = 'String';
      Description = 'Type the first line of the customer''s billing address.';
      Caption = 'Bill To Street 1';
    }
    field(10041; BillTo_Line2; Text[250])
    {
      ExternalName = 'billto_line2';
      ExternalType = 'String';
      Description = 'Type the second line of the customer''s billing address.';
      Caption = 'Bill To Street 2';
    }
    field(10042; BillTo_Line3; Text[250])
    {
      ExternalName = 'billto_line3';
      ExternalType = 'String';
      Description = 'Type the third line of the billing address.';
      Caption = 'Bill To Street 3';
    }
    field(10043; BillTo_Name; Text[200])
    {
      ExternalName = 'billto_name';
      ExternalType = 'String';
      Description = 'Type a name for the customer''s billing address, such as "Headquarters" or "Field office", to identify the address.';
      Caption = 'Bill To Name';
    }
    field(10044; BillTo_PostalCode; Text[20])
    {
      ExternalName = 'billto_postalcode';
      ExternalType = 'String';
      Description = 'Type the ZIP Code or postal code for the billing address.';
      Caption = 'Bill To ZIP/Postal Code';
    }
    field(10045; BillTo_StateOrProvince; Text[50])
    {
      ExternalName = 'billto_stateorprovince';
      ExternalType = 'String';
      Description = 'Type the state or province for the billing address.';
      Caption = 'Bill To State/Province';
    }
    field(10046; BillTo_Telephone; Text[50])
    {
      ExternalName = 'billto_telephone';
      ExternalType = 'String';
      Description = 'Type the phone number for the customer''s billing address.';
      Caption = 'Bill To Phone';
    }
    field(10047; CustomerId; GUID)
    {
      ExternalName = 'customerid';
      ExternalType = 'Customer';
      Description = 'Select the customer account or contact to provide a quick link to additional customer details, such as account information, activities, and opportunities.';
      Caption = 'Customer';
    }
    field(10048; DateFulfilled; Date)
    {
      ExternalName = 'datefulfilled';
      ExternalType = 'DateTime';
      Description = 'Enter the date that all or part of the order was shipped to the customer.';
      Caption = 'Date Fulfilled';
    }
    field(10049; Description; BLOB)
    {
      ExternalName = 'description';
      ExternalType = 'Memo';
      Description = 'Type additional information to describe the order, such as the products or services offered or details about the customer''s product preferences.';
      Caption = 'Description';
      Subtype = Memo;
    }
    field(10050; DiscountAmount; Decimal)
    {
      ExternalName = 'discountamount';
      ExternalType = 'Money';
      Description = 'Type the discount amount for the order if the customer is eligible for special savings.';
      Caption = 'Order Discount Amount';
    }
    field(10053; ExchangeRate; Decimal)
    {
      ExternalName = 'exchangerate';
      ExternalType = 'Decimal';
      ExternalAccess = Read;
      Description = 'Shows the conversion rate of the record''s currency. The exchange rate is used to convert all money fields in the record from the local currency to the system''s default currency.';
      Caption = 'Exchange Rate';
    }
    field(10054; DiscountAmount_Base; Decimal)
    {
      ExternalName = 'discountamount_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Order Discount Amount in base currency.';
      Caption = 'Order Discount Amount (Base)';
    }
    field(10055; DiscountPercentage; Decimal)
    {
      ExternalName = 'discountpercentage';
      ExternalType = 'Decimal';
      Description = 'Type the discount rate that should be applied to the Detail Amount field to include additional savings for the customer in the order.';
      Caption = 'Order Discount (%)';
    }
    field(10056; FreightAmount; Decimal)
    {
      ExternalName = 'freightamount';
      ExternalType = 'Money';
      Description = 'Type the cost of freight or shipping for the products included in the order for use in calculating the Total Amount field.';
      Caption = 'Freight Amount';
    }
    field(10057; FreightAmount_Base; Decimal)
    {
      ExternalName = 'freightamount_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Freight Amount in base currency.';
      Caption = 'Freight Amount (Base)';
    }
    field(10058; FreightTermsCode; Option)
    {
      ExternalName = 'freighttermscode';
      ExternalType = 'Picklist';
      Description = 'Select the freight terms to make sure shipping charges are processed correctly.';
      Caption = 'Freight Terms';
      InitValue = " ";
      OptionMembers = " ", CIF, CFR, CIP, CPT, DAF, DDP, DDU, DELIVERY, DEQ, DES, EXW, FAS, FCA, PICKUP, FOB, NoCharge;
      OptionOrdinalValues = -1, 100000001, 100000000, 100000002, 100000003, 100000004, 100000005, 100000006, 100000007, 100000008, 100000009, 100000010, 100000011, 100000012, 100000013, 1, 2;
    }
    field(10060; IsPriceLocked; Boolean)
    {
      ExternalName = 'ispricelocked';
      ExternalType = 'Boolean';
      ExternalAccess = Modify;
      Description = 'Select whether prices specified on the invoice are locked from any further updates.';
      Caption = 'Prices Locked';
    }
    field(10062; LastBackofficeSubmit; Date)
    {
      ExternalName = 'lastbackofficesubmit';
      ExternalType = 'DateTime';
      Description = 'Enter the date and time when the order was last submitted to an accounting or ERP system for processing.';
      Caption = 'Last Submitted to Back Office';
    }
    field(10064; OrderNumber; Text[100])
    {
      ExternalName = 'ordernumber';
      ExternalType = 'String';
      ExternalAccess = Insert;
      Description = 'Shows the order number for customer reference and to use in search. The number cannot be modified.';
      Caption = 'Order ID';
    }
    field(10065; PaymentTermsCode; Option)
    {
      ExternalName = 'paymenttermscode';
      ExternalType = 'Picklist';
      Description = 'Select the payment terms to indicate when the customer needs to pay the total amount.';
      Caption = 'Payment Terms';
      InitValue = " ";
      OptionMembers = " ", "14DAYS", "15DAYS", "1M(8D)", "10DAYS", "2DAYS", "21DAYS", "30DAYS", "60DAYS", "7DAYS", CM, COD, NET30, "2%10NET", NET45, NET60, COD1;
      OptionOrdinalValues = -1, 100000001, 100000002, 100000003, 100000000, 100000004, 100000005, 100000006, 100000007, 100000008, 100000009, 100000010, 1, 2, 3, 4, 100000011;
    }
    field(10068; PricingErrorCode; Option)
    {
      ExternalName = 'pricingerrorcode';
      ExternalType = 'Picklist';
      Description = 'Select the type of pricing error, such as a missing or invalid product, or missing quantity.';
      Caption = 'Pricing Error ';
      InitValue = None;
      OptionMembers = None, DetailError, MissingPriceLevel, InactivePriceLevel, MissingQuantity, MissingUnitPrice, MissingProduct, InvalidProduct, MissingPricingCode, InvalidPricingCode, MissingUOM, ProductNotInPriceLevel, MissingPriceLevelAmount, MissingPriceLevelPercentage, MissingPrice, MissingCurrentCost, MissingStandardCost, InvalidPriceLevelAmount, InvalidPriceLevelPercentage, InvalidPrice, InvalidCurrentCost, InvalidStandardCost, InvalidRoundingPolicy, InvalidRoundingOption, InvalidRoundingAmount, PriceCalculationError, InvalidDiscountType, DiscountTypeInvalidState, InvalidDiscount, InvalidQuantity, InvalidPricingPrecision, MissingProductDefaultUOM, MissingProductUOMSchedule, InactiveDiscountType, InvalidPriceLevelCurrency, PriceAttributeOutOfRange, BaseCurrencyAttributeOverflow, BaseCurrencyAttributeUnderflow, TransactionCurrencyIsNotSetForTheProductPriceListItem;
      OptionOrdinalValues = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38;
    }
    field(10070; PriorityCode; Option)
    {
      ExternalName = 'prioritycode';
      ExternalType = 'Picklist';
      Description = 'Select the priority so that preferred customers or critical issues are handled quickly.';
      Caption = 'Priority';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(10073; RequestDeliveryBy; Date)
    {
      ExternalName = 'requestdeliveryby';
      ExternalType = 'DateTime';
      Description = 'Enter the delivery date requested by the customer for all products in the order.';
      Caption = 'Requested Delivery Date';
    }
    field(10074; ShippingMethodCode; Option)
    {
      ExternalName = 'shippingmethodcode';
      ExternalType = 'Picklist';
      Description = 'Select a shipping method for deliveries sent to this address.';
      Caption = 'Shipping Method';
      InitValue = " ";
      OptionMembers = " ", "OWNLOG.", AUPOST, Airborne, DHL, FEDEX, UPS, PostalMail, FullLoad, WillCall;
      OptionOrdinalValues = -1, 100000001, 100000000, 1, 2, 3, 4, 5, 6, 7;
    }
    field(10076; ShipTo_AddressId; GUID)
    {
      ExternalName = 'shipto_addressid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Unique identifier of the shipping address.';
      Caption = 'Ship To Address ID';
    }
    field(10077; ShipTo_City; Text[80])
    {
      ExternalName = 'shipto_city';
      ExternalType = 'String';
      Description = 'Type the city for the customer''s shipping address.';
      Caption = 'Ship To City';
    }
    field(10078; ShipTo_Composite; BLOB)
    {
      ExternalName = 'shipto_composite';
      ExternalType = 'Memo';
      ExternalAccess = Read;
      Description = 'Shows the complete Ship To address.';
      Caption = 'Ship To Address';
      Subtype = Memo;
    }
    field(10079; ShipTo_ContactName; Text[150])
    {
      ExternalName = 'shipto_contactname';
      ExternalType = 'String';
      Description = 'Type the primary contact name at the customer''s shipping address.';
      Caption = 'Ship To Contact Name';
    }
    field(10080; ShipTo_Country; Text[80])
    {
      ExternalName = 'shipto_country';
      ExternalType = 'String';
      Description = 'Type the country or region for the customer''s shipping address.';
      Caption = 'Ship To Country/Region';
    }
    field(10081; ShipTo_Fax; Text[50])
    {
      ExternalName = 'shipto_fax';
      ExternalType = 'String';
      Description = 'Type the fax number for the customer''s shipping address.';
      Caption = 'Ship to Fax';
    }
    field(10082; ShipTo_FreightTermsCode; Option)
    {
      ExternalName = 'shipto_freighttermscode';
      ExternalType = 'Picklist';
      Description = 'Select the freight terms to make sure shipping orders are processed correctly.';
      Caption = 'Ship To Freight Terms';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(10084; ShipTo_Line1; Text[250])
    {
      ExternalName = 'shipto_line1';
      ExternalType = 'String';
      Description = 'Type the first line of the customer''s shipping address.';
      Caption = 'Ship To Street 1';
    }
    field(10085; ShipTo_Line2; Text[250])
    {
      ExternalName = 'shipto_line2';
      ExternalType = 'String';
      Description = 'Type the second line of the customer''s shipping address.';
      Caption = 'Ship To Street 2';
    }
    field(10086; ShipTo_Line3; Text[250])
    {
      ExternalName = 'shipto_line3';
      ExternalType = 'String';
      Description = 'Type the third line of the shipping address.';
      Caption = 'Ship To Street 3';
    }
    field(10087; ShipTo_Name; Text[200])
    {
      ExternalName = 'shipto_name';
      ExternalType = 'String';
      Description = 'Type a name for the customer''s shipping address, such as "Headquarters" or "Field office",  to identify the address.';
      Caption = 'Ship To Name';
    }
    field(10088; ShipTo_PostalCode; Text[20])
    {
      ExternalName = 'shipto_postalcode';
      ExternalType = 'String';
      Description = 'Type the ZIP Code or postal code for the shipping address.';
      Caption = 'Ship To ZIP/Postal Code';
    }
    field(10089; ShipTo_StateOrProvince; Text[50])
    {
      ExternalName = 'shipto_stateorprovince';
      ExternalType = 'String';
      Description = 'Type the state or province for the shipping address.';
      Caption = 'Ship To State/Province';
    }
    field(10090; ShipTo_Telephone; Text[50])
    {
      ExternalName = 'shipto_telephone';
      ExternalType = 'String';
      Description = 'Type the phone number for the customer''s shipping address.';
      Caption = 'Ship To Phone';
    }
    field(10091; StateCode; Option)
    {
      ExternalName = 'statecode';
      ExternalType = 'State';
      ExternalAccess = Modify;
      Description = 'Shows whether the order is active, submitted, fulfilled, canceled, or invoiced. Only active orders can be edited.';
      Caption = 'Status';
      InitValue = Active;
      OptionMembers = Active, Submitted, Canceled, Fulfilled, Invoiced;
      OptionOrdinalValues = 0, 1, 2, 3, 4;
    }
    field(10093; StatusCode; Option)
    {
      ExternalName = 'statuscode';
      ExternalType = 'Status';
      Description = 'Select the order''s status.';
      Caption = 'Status Reason';
      InitValue = " ";
      OptionMembers = " ", New, Pending, OnHold, InProgress, NoMoney, Complete, Partial, Invoiced;
      OptionOrdinalValues = -1, 1, 2, 690970000, 3, 4, 100001, 100002, 100003;
    }
    field(10095; SubmitDate; Date)
    {
      ExternalName = 'submitdate';
      ExternalType = 'DateTime';
      Description = 'Enter the date when the order was submitted to the fulfillment or shipping center.';
      Caption = 'Date Submitted';
    }
    field(10096; SubmitStatus; Integer)
    {
      ExternalName = 'submitstatus';
      ExternalType = 'Integer';
      Description = 'Type the code for the submitted status in the fulfillment or shipping center system.';
      Caption = 'Submitted Status';
    }
    field(10097; SubmitStatusDescription; BLOB)
    {
      ExternalName = 'submitstatusdescription';
      ExternalType = 'Memo';
      Description = 'Type additional details or notes about the order for the fulfillment or shipping center.';
      Caption = 'Submitted Status Description';
      Subtype = Memo;
    }
    field(10098; TotalAmount; Decimal)
    {
      ExternalName = 'totalamount';
      ExternalType = 'Money';
      ExternalAccess = Modify;
      Description = 'Shows the total amount due, calculated as the sum of the products, discounts, freight, and taxes for the order.';
      Caption = 'Total Amount';
    }
    field(10099; TotalAmount_Base; Decimal)
    {
      ExternalName = 'totalamount_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Total Amount in base currency.';
      Caption = 'Total Amount (Base)';
    }
    field(10100; TotalAmountLessFreight; Decimal)
    {
      ExternalName = 'totalamountlessfreight';
      ExternalType = 'Money';
      ExternalAccess = Modify;
      Description = 'Shows the total product amount for the order, minus any discounts. This value is added to freight and tax amounts in the calculation for the total amount due for the order.';
      Caption = 'Total Pre-Freight Amount';
    }
    field(10101; TotalAmountLessFreight_Base; Decimal)
    {
      ExternalName = 'totalamountlessfreight_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Total Pre-Freight Amount in base currency.';
      Caption = 'Total Pre-Freight Amount (Base)';
    }
    field(10102; TotalDiscountAmount; Decimal)
    {
      ExternalName = 'totaldiscountamount';
      ExternalType = 'Money';
      ExternalAccess = Modify;
      Description = 'Shows the total discount amount, based on the discount price and rate entered on the order.';
      Caption = 'Total Discount Amount';
    }
    field(10103; TotalDiscountAmount_Base; Decimal)
    {
      ExternalName = 'totaldiscountamount_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Total Discount Amount in base currency.';
      Caption = 'Total Discount Amount (Base)';
    }
    field(10104; TotalLineItemAmount; Decimal)
    {
      ExternalName = 'totallineitemamount';
      ExternalType = 'Money';
      ExternalAccess = Modify;
      Description = 'Shows the sum of all existing and write-in products included on the order, based on the specified price list and quantities.';
      Caption = 'Total Detail Amount';
    }
    field(10105; TotalLineItemAmount_Base; Decimal)
    {
      ExternalName = 'totallineitemamount_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Total Detail Amount in base currency.';
      Caption = 'Total Detail Amount (Base)';
    }
    field(10106; TotalLineItemDiscountAmount; Decimal)
    {
      ExternalName = 'totallineitemdiscountamount';
      ExternalType = 'Money';
      ExternalAccess = Modify;
      Description = 'Shows the total of the Manual Discount amounts specified on all products included in the order. This value is reflected in the Detail Amount field on the order and is added to any discount amount or rate specified on the order.';
      Caption = 'Total Line Item Discount Amount';
    }
    field(10107; TotalLineItemDiscountAmount_Base; Decimal)
    {
      ExternalName = 'totallineitemdiscountamount_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Total Line Item Discount Amount in base currency.';
      Caption = 'Total Line Item Discount Amount (Base)';
    }
    field(10108; TotalTax; Decimal)
    {
      ExternalName = 'totaltax';
      ExternalType = 'Money';
      ExternalAccess = Modify;
      Description = 'Shows the Tax amounts specified on all products included in the order, included in the Total Amount due calculation for the order.';
      Caption = 'Total Tax';
    }
    field(10109; TotalTax_Base; Decimal)
    {
      ExternalName = 'totaltax_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Total Tax in base currency.';
      Caption = 'Total Tax (Base)';
    }
    field(10110; WillCall; Boolean)
    {
      ExternalName = 'willcall';
      ExternalType = 'Boolean';
      Description = 'Select whether the products included in the order should be shipped to the specified address or held until the customer calls with further pick-up or delivery instructions.';
      Caption = 'Ship To';
    }
    field(10112; OnHoldTime; Integer)
    {
      ExternalName = 'onholdtime';
      ExternalType = 'Integer';
      ExternalAccess = Read;
      Description = 'Shows the duration in minutes for which the order was on hold.';
      Caption = 'On Hold Time (Minutes)';
    }
    field(10113; LastOnHoldTime; Datetime)
    {
      ExternalName = 'lastonholdtime';
      ExternalType = 'DateTime';
      Description = 'Contains the date time stamp of the last on hold time.';
      Caption = 'Last On Hold Time';
    }
    field(10116; EntityImageId; GUID)
    {
      ExternalName = 'entityimageid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Read;
    }
    field(10120; AccountId; GUID)
    {
      ExternalName = 'accountid';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Shows the parent account related to the record. This information is used to link the sales order to the account selected in the Customer field for reporting and analytics.';
      Caption = 'Account';
      TableRelation = "CDS Account".AccountId;
    }
    field(10123; ContactId; GUID)
    {
      ExternalName = 'contactid';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Shows the parent contact related to the record. This information is used to link the contract to the contact selected in the Customer field for reporting and analytics.';
      Caption = 'Contact';
      TableRelation = "CDS Contact".ContactId;
    }
    field(10134; SkipPriceCalculation; Option)
    {
      ExternalName = 'skippricecalculation';
      ExternalType = 'Picklist';
      Description = 'Skip Price Calculation';
      Caption = 'Skip Price Calculation (For Internal Use)';
      InitValue = DoPriceCalcAlways;
      OptionMembers = DoPriceCalcAlways, SkipPriceCalcOnRetrieve;
      OptionOrdinalValues = 0, 1;
    }
    field(10138; msdyn_ordertype; Option)
    {
      ExternalName = 'msdyn_ordertype';
      ExternalType = 'Picklist';
      Description = 'Whether it is for an Item- based or a Work-based sale';
      Caption = 'Order Type';
      InitValue = ItemBased;
      OptionMembers = "Service-MaintenanceBased", ItemBased, WorkBased;
      OptionOrdinalValues = 690970002, 192350000, 192350001;
    }
    field(10140; msdyn_Account; GUID)
    {
      ExternalName = 'msdyn_account';
      ExternalType = 'Lookup';
      Description = 'Customer Account associated with this Order';
      Caption = 'Potential Customer';
      TableRelation = "CDS Account".AccountId;
    }
    field(10144; OrderCreationMethod; Option)
    {
      ExternalName = 'ordercreationmethod';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Creation Method';
      InitValue = Unknown;
      OptionMembers = Unknown, WinQuote;
      OptionOrdinalValues = 776160000, 776160001;
    }
    field(10146; bcbi_BusinessCentralDocumentOccurrenceNumber; Integer)
    {
      ExternalName = 'bcbi_businesscentraldocumentoccurrencenumber';
      ExternalType = 'Integer';
      Description = 'Defines associated document occurrence number in Business Central';
      Caption = 'Business Central Document Occurrence Number';
    }
    field(10147; bcbi_BusinessCentralOrderNumber; Text[20])
    {
      ExternalName = 'bcbi_businesscentralordernumber';
      ExternalType = 'String';
      Description = 'Defines associated order number in Business Central';
      Caption = 'Business Central Order Number';
    }
    field(10152; msdyn_PSAState; Option)
    {
      ExternalName = 'msdyn_psastate';
      ExternalType = 'Picklist';
      Description = 'Shows the current state of the project contract.';
      Caption = 'Contract Status';
      InitValue = Draft;
      OptionMembers = Draft, OnHold, Active, Closed;
      OptionOrdinalValues = 192350000, 192350001, 192350002, 192350003;
    }
    field(10154; msdyn_PSAStatusReason; Option)
    {
      ExternalName = 'msdyn_psastatusreason';
      ExternalType = 'Picklist';
      Description = 'Shows the reason for the project contract status.';
      Caption = 'Contract Status Reason';
      InitValue = Draft;
      OptionMembers = Draft, InReview, OnHold, Confirmed, Completed, Lost, Abandoned;
      OptionOrdinalValues = 192350000, 192350001, 192350002, 192350003, 192350004, 192350005, 192350006;
    }
    field(10156; msdyn_TotalChargeableCostRollup; Decimal)
    {
      ExternalName = 'msdyn_totalchargeablecostrollup';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the estimated chargeable cost.';
      Caption = 'Total Chargeable Cost';
    }
    field(10157; msdyn_totalchargeablecostrollup_Base; Decimal)
    {
      ExternalName = 'msdyn_totalchargeablecostrollup_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Total Chargeable Cost in base currency.';
      Caption = 'Total Chargeable Cost (Base)';
    }
    field(10158; msdyn_TotalChargeableCostRollup_Date; Datetime)
    {
      ExternalName = 'msdyn_totalchargeablecostrollup_date';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Last Updated time of rollup field Total Chargeable Cost.';
      Caption = 'Total Chargeable Cost (Last Updated On)';
    }
    field(10159; msdyn_TotalChargeableCostRollup_State; Integer)
    {
      ExternalName = 'msdyn_totalchargeablecostrollup_state';
      ExternalType = 'Integer';
      ExternalAccess = Read;
      Description = 'State of rollup field Total Chargeable Cost.';
      Caption = 'Total Chargeable Cost (State)';
    }
    field(10160; msdyn_TotalNonchargeableCostRollup; Decimal)
    {
      ExternalName = 'msdyn_totalnonchargeablecostrollup';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Total estimated cost that will not be charged to the customer.';
      Caption = 'Total Non-chargeable Cost';
    }
    field(10161; msdyn_totalnonchargeablecostrollup_Base; Decimal)
    {
      ExternalName = 'msdyn_totalnonchargeablecostrollup_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Total Non-chargeable Cost in base currency.';
      Caption = 'Total Non-chargeable Cost (Base)';
    }
    field(10162; msdyn_TotalNonchargeableCostRollup_Date; Datetime)
    {
      ExternalName = 'msdyn_totalnonchargeablecostrollup_date';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Last Updated time of rollup field Total Non-chargeable Cost.';
      Caption = 'Total Non-chargeable Cost (Last Updated On)';
    }
    field(10163; msdyn_TotalNonchargeableCostRollup_State; Integer)
    {
      ExternalName = 'msdyn_totalnonchargeablecostrollup_state';
      ExternalType = 'Integer';
      ExternalAccess = Read;
      Description = 'State of rollup field Total Non-chargeable Cost.';
      Caption = 'Total Non-chargeable Cost (State)';
    }
    field(10167; adigkb_Type; Option)
    {
      ExternalName = 'adigkb_type';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Type';
      InitValue = " ";
      OptionMembers = " ", "Service/Parts", Training, Energy, Sales, "N/A";
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004;
    }
    field(10169; adigkb_bcid; Text[100])
    {
      ExternalName = 'adigkb_bcid';
      ExternalType = 'String';
      Description = 'BC record Integration reference ID';
      Caption = 'bcid';
    }
    field(10170; adigkb_BillingType; Option)
    {
      ExternalName = 'adigkb_billingtype';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Billing Type';
      InitValue = " ";
      OptionMembers = " ", ChargeUp, Quoted, MonthlyBilling, NotChargeable, "N/A";
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004;
    }
  }
  keys
  {
    key(PK; SalesOrderId)
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