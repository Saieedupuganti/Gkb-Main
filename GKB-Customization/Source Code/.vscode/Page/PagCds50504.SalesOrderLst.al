page 50504 "CDS Sales Order List"
{
    Caption = 'CDS Sales Order List';
    PageType = List;
    SourceTable = "CDS SalesOrder 2";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmailAddress; rec."EmailAddress")
                {
                    ApplicationArea = All;
                    Caption = 'Email Address';
                }

                field(OnHoldTime; rec."OnHoldTime")
                {
                    ApplicationArea = All;
                    Caption = 'On Hold Time';
                }

                field(LastOnHoldTime; rec."LastOnHoldTime")
                {
                    ApplicationArea = All;
                    Caption = 'Last On Hold Time';
                }

                field(SkipPriceCalculation; rec."SkipPriceCalculation")
                {
                    ApplicationArea = All;
                    Caption = 'Skip Price Calculation';
                }

                field(msdyn_ordertype; rec."msdyn_ordertype")
                {
                    ApplicationArea = All;
                    Caption = 'Order Type';
                }

                field(msdyn_Account; rec."msdyn_Account")
                {
                    ApplicationArea = All;
                    Caption = 'Potential Customer';
                }

                field(OrderCreationMethod; rec."OrderCreationMethod")
                {
                    ApplicationArea = All;
                    Caption = 'Creation Method';
                }

                // field(msdyn_AccountManagerId; rec."")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Account Manager';
                // }

                field(msdyn_PSAState; rec."msdyn_PSAState")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Status';
                }

                field(msdyn_PSAStatusReason; rec."msdyn_PSAStatusReason")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Status Reason';
                }

                field(msdyn_TotalChargeableCostRollup; rec."msdyn_TotalChargeableCostRollup")
                {
                    ApplicationArea = All;
                    Caption = 'Total Chargeable Cost';
                }

                field(msdyn_totalchargeablecostrollup_Base; rec."msdyn_totalchargeablecostrollup_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Total Chargeable Cost (Base)';
                }

                field(msdyn_TotalChargeableCostRollup_Date; rec."msdyn_TotalChargeableCostRollup_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Total Chargeable Cost (Last Updated On)';
                }

                field(msdyn_TotalChargeableCostRollup_State; rec."msdyn_TotalChargeableCostRollup_State")
                {
                    ApplicationArea = All;
                    Caption = 'Total Chargeable Cost (State)';
                }

                field(msdyn_TotalNonchargeableCostRollup; rec."msdyn_TotalNonchargeableCostRollup")
                {
                    ApplicationArea = All;
                    Caption = 'Total Non-chargeable Cost';
                }

                field(msdyn_totalnonchargeablecostrollup_Base; rec."msdyn_totalnonchargeablecostrollup_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Total Non-chargeable Cost (Base)';
                }

                field(msdyn_TotalNonchargeableCostRollup_Date; rec."msdyn_TotalNonchargeableCostRollup_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Total Non-chargeable Cost (Last Updated On)';
                }

                field(msdyn_TotalNonchargeableCostRollup_State; rec."msdyn_TotalNonchargeableCostRollup_State")
                {
                    ApplicationArea = All;
                    Caption = 'Total Non-chargeable Cost (State)';
                }

                field(adigkb_Type; rec."adigkb_Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                }

                field(adigkb_bcid; rec."adigkb_bcid")
                {
                    ApplicationArea = All;
                    Caption = 'bcid';
                }

                field(adigkb_BillingType; rec."adigkb_BillingType")
                {
                    ApplicationArea = All;
                    Caption = 'Billing Type';
                }
                
            }
        }
    }
}