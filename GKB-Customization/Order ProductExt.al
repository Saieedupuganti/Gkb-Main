tableextension 60611 "Order ProductExt" extends "CRM Salesorderdetail"
{
  Description = 'Line item in a sales order.';

  fields
  {
    field(10022; OwningTeam; GUID)
    {
      ExternalName = 'owningteam';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier for the team that owns the record.';
      Caption = 'Owning Team';
      TableRelation = "CRM Team".TeamId;
    }
    field(10054; ProductName; Text[500])
    {
      ExternalName = 'productname';
      ExternalType = 'String';
      Description = 'Calculated field that will be populated by name and description of the product.';
      Caption = 'Product Name';
    }
    field(10096; QuoteDetailId; GUID)
    {
      ExternalName = 'quotedetailid';
      ExternalType = 'Lookup';
      Description = 'Unique identifier for Quote Line associated with Order Line.';
      Caption = 'Quote Product Id';
      TableRelation = "CRM Quotedetail".QuoteDetailId;
    }
    field(10097; SalesOrderDetailName; Text[500])
    {
      ExternalName = 'salesorderdetailname';
      ExternalType = 'String';
      Description = 'Sales Order Detail Name. Added for 1:n referential relationship (internal purposes only)';
      Caption = 'Name';
    }
    field(10098; ParentBundleIdRef; GUID)
    {
      ExternalName = 'parentbundleidref';
      ExternalType = 'Lookup';
      Description = 'Choose the parent bundle associated with this product';
      Caption = 'Parent bundle product';
      TableRelation = "CRM Salesorderdetail".SalesOrderDetailId;
    }
    field(10099; SkipPriceCalculation; Option)
    {
      ExternalName = 'skippricecalculation';
      ExternalType = 'Picklist';
      Description = 'Skip the price calculation';
      Caption = 'Skip Price Calculation';
      InitValue = DoPriceCalcAlways;
      OptionMembers = DoPriceCalcAlways, SkipPriceCalcOnCreate, SkipPriceCalcOnUpdate, SkipPriceCalcOnUpSert;
      OptionOrdinalValues = 0, 1, 2, 3;
    }
    field(10102; ProductNumber; Text[100])
    {
      ExternalName = 'productnumber';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = 'User-defined product ID.';
      Caption = 'Product Number';
    }
    field(10104; msdyn_LineType; Option)
    {
      ExternalName = 'msdyn_linetype';
      ExternalType = 'Picklist';
      Description = 'The field to distinguish the order lines to be of project service or field service';
      Caption = 'Line Type';
      InitValue = " ";
      OptionMembers = " ", ProjectServiceLine, FieldServiceLine;
      OptionOrdinalValues = -1, 690970000, 690970001;
    }
    field(10107; OrderCreationMethod; Option)
    {
      ExternalName = 'ordercreationmethod';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Creation Method';
      InitValue = Unknown;
      OptionMembers = Unknown, WinQuote;
      OptionOrdinalValues = 776160000, 776160001;
    }
    field(10110; msdyn_BillingMethod; Option)
    {
      ExternalName = 'msdyn_billingmethod';
      ExternalType = 'Picklist';
      Description = 'Billing method for the project contract line. Valid values are Time and Material and Fixed Price';
      Caption = 'Billing Method';
      InitValue = " ";
      OptionMembers = " ", TimeAndMaterial, FixedPrice;
      OptionOrdinalValues = -1, 192350000, 192350001;
    }
    field(10112; msdyn_BillingStartDate; Date)
    {
      ExternalName = 'msdyn_billingstartdate';
      ExternalType = 'DateTime';
      Description = 'Select the billing start date for the project contract line.';
      Caption = 'Billing Start Date';
    }
    field(10113; msdyn_BillingStatus; Option)
    {
      ExternalName = 'msdyn_billingstatus';
      ExternalType = 'Picklist';
      Description = 'Select the billing status for the project contract line.';
      Caption = 'Billing Status';
      InitValue = " ";
      OptionMembers = " ", "WorkOrderClosed-Posted", ReadyToInvoice, UnbilledSalesCreated, CustomerInvoiceCreated, CustomerInvoicePosted, Canceled;
      OptionOrdinalValues = -1, 690970000, 192350004, 192350000, 192350001, 192350002, 192350003;
    }
    field(10115; msdyn_BudgetAmount; Decimal)
    {
      ExternalName = 'msdyn_budgetamount';
      ExternalType = 'Money';
      Description = 'Enter the amount the customer has set aside or is willing to pay for the project contract component.';
      Caption = 'Customer Budget';
    }
    field(10116; msdyn_budgetamount_Base; Decimal)
    {
      ExternalName = 'msdyn_budgetamount_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Budget Amount in base currency.';
      Caption = 'Budget Amount (Base)';
    }
    field(10117; msdyn_CostAmount; Decimal)
    {
      ExternalName = 'msdyn_costamount';
      ExternalType = 'Money';
      Description = 'Shows the total cost price of the product based on the cost price per unit and quantity.';
      Caption = 'Cost Amount';
    }
    field(10118; msdyn_costamount_Base; Decimal)
    {
      ExternalName = 'msdyn_costamount_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Cost Amount in base currency.';
      Caption = 'Cost Amount (Base)';
    }
    field(10119; msdyn_CostPricePerUnit; Decimal)
    {
      ExternalName = 'msdyn_costpriceperunit';
      ExternalType = 'Money';
      Description = 'Cost per unit of the product. The default is the cost price of the product.';
      Caption = 'Cost Per Unit';
    }
    field(10120; msdyn_costpriceperunit_Base; Decimal)
    {
      ExternalName = 'msdyn_costpriceperunit_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Cost Price Per Unit in base currency.';
      Caption = 'Cost Price Per Unit (Base)';
    }
    field(10121; msdyn_IncludeExpense; Boolean)
    {
      ExternalName = 'msdyn_includeexpense';
      ExternalType = 'Boolean';
      Description = 'Select whether to include expenses in the project contract line.';
      Caption = 'Include Expense';
    }
    field(10123; msdyn_IncludeFee; Boolean)
    {
      ExternalName = 'msdyn_includefee';
      ExternalType = 'Boolean';
      Description = 'Select whether to include fees in the project contract line.';
      Caption = 'Include Fee';
    }
    field(10125; msdyn_IncludeMaterial; Boolean)
    {
      ExternalName = 'msdyn_includematerial';
      ExternalType = 'Boolean';
      Description = 'Select whether to include materials in the project contract line.';
      Caption = 'Include Material';
    }
    field(10127; msdyn_IncludeTime; Boolean)
    {
      ExternalName = 'msdyn_includetime';
      ExternalType = 'Boolean';
      Description = 'Select whether to include time transactions in the project contract line.';
      Caption = 'Include Time';
    }
    field(10131; msdyn_QuoteLine; Text[100])
    {
      ExternalName = 'msdyn_quoteline';
      ExternalType = 'String';
      Description = '(Deprecated) Shows the quote line related to the project contract line.';
      Caption = '(Deprecated) Quote Line';
    }
  }
}