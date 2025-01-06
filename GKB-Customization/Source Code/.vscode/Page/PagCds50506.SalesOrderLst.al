page 50506 "CRM SalesorderList"
{
    PageType = List;
    SourceTable = "CRM Salesorder";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group1)
            {
                field(EmailAddress; rec.EmailAddress)
                {
                    ApplicationArea = All;
                }
                field(OnHoldTime; Rec.OnHoldTime)
                {
                    ApplicationArea = All;
                }
                field(LastOnHoldTime; rec.LastOnHoldTime)
                {
                    ApplicationArea = All;
                }
                field(SkipPriceCalculation; rec.SkipPriceCalculation)
                {
                    ApplicationArea = All;
                }
                field(msdyn_ordertype; Rec.msdyn_ordertype)
                {
                    ApplicationArea = All;
                }
                field(msdyn_Account; REC.msdyn_Account)
                {
                    ApplicationArea = All;
                }
                field(OrderCreationMethod; Rec.OrderCreationMethod)
                {
                    ApplicationArea = All;
                }
                field(msdyn_AccountManagerId; Rec.msdyn_AccountManagerId)
                {
                    ApplicationArea = All;
                }
                field(msdyn_PSAState; Rec.msdyn_PSAState)
                {
                    ApplicationArea = All;
                }
                field(msdyn_PSAStatusReason; Rec.msdyn_PSAStatusReason)
                {
                    ApplicationArea = All;
                }
                field(msdyn_TotalChargeableCostRollup; Rec.msdyn_TotalChargeableCostRollup)
                {
                    ApplicationArea = All;
                }
                field(msdyn_totalchargeablecostrollup_Base; Rec.msdyn_totalchargeablecostrollup_Base)
                {
                    ApplicationArea = All;
                }
                field(msdyn_TotalChargeableCostRollup_Date; Rec.msdyn_TotalChargeableCostRollup_Date)
                {
                    ApplicationArea = All;
                }
                field(msdyn_TotalChargeableCostRollup_State; Rec.msdyn_TotalChargeableCostRollup_State)
                {
                    ApplicationArea = All;
                }
                field(msdyn_TotalNonchargeableCostRollup; Rec.msdyn_TotalNonchargeableCostRollup)
                {
                    ApplicationArea = All;
                }
                field(msdyn_totalnonchargeablecostrollup_Base; Rec.msdyn_totalnonchargeablecostrollup_Base)
                {
                    ApplicationArea = All;
                }
                field(msdyn_TotalNonchargeableCostRollup_Date; Rec.msdyn_TotalNonchargeableCostRollup_Date)
                {
                    ApplicationArea = All;
                }
                field(msdyn_TotalNonchargeableCostRollup_State; Rec.msdyn_TotalNonchargeableCostRollup_State)
                {
                    ApplicationArea = All;
                }
                field(adigkb_Type; Rec.adigkb_Type)
                {
                    ApplicationArea = All;
                }
                field(adigkb_bcid; Rec.adigkb_bcid)
                {
                    ApplicationArea = All;
                }
                field(adigkb_BillingType; Rec.adigkb_BillingType)
                {
                    ApplicationArea = All;
                }
                field(OpportunityId;Rec.OpportunityId)
                {
                    ApplicationArea = all;
                }
                field(QuoteId;Rec.QuoteId)
                {
                    ApplicationArea = all;
                }
                field(Name;Rec.Name)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}