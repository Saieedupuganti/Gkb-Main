tableextension 50157 OrderExt extends "CRM Salesorder"
{
  Description = 'Quote that has been accepted.';

  fields
  {
    field(10025; EmailAddress; Text[100])
    {
      ExternalName = 'emailaddress';
      ExternalType = 'String';
      Description = 'The primary email address for the entity.';
      Caption = 'Email Address';
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
      TableRelation = "CRM Account".AccountId;
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
    field(10150; msdyn_AccountManagerId; GUID)
    {
      ExternalName = 'msdyn_accountmanagerid';
      ExternalType = 'Lookup';
      Description = 'User responsible for managing the account referenced by this contract.';
      Caption = 'Account Manager';
      TableRelation = "CRM Systemuser".SystemUserId;
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
}