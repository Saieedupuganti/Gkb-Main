namespace BCIntegration.BCIntegration;
using Microsoft.Integration.Dataverse;

page 50500 "CDS Projects List"
{
    ApplicationArea = All;
    Caption = 'CDS Projects List';
    PageType = List;
    SourceTable = "CDS msdyn_workorder";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(msdyn_workorderId; Rec.msdyn_workorderId)
                {
                    ToolTip = 'Specifies the value of the WO Number field.', Comment = '%';
                }
                field("Service Account Name"; Rec."Service Account Name")
                {
                    ApplicationArea = All;
                }
                field(CreatedOn; Rec.CreatedOn)
                {
                    ToolTip = 'Specifies the value of the Created On field.', Comment = '%';
                }
                field(ModifiedOn; Rec.ModifiedOn)
                {
                    ToolTip = 'Specifies the value of the Modified On field.', Comment = '%';
                }
                field(statecode; Rec.statecode)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(statuscode; Rec.statuscode)
                {
                    ToolTip = 'Specifies the value of the Status Reason field.', Comment = '%';
                }
                field(VersionNumber; Rec.VersionNumber)
                {
                    ToolTip = 'Specifies the value of the Version Number field.', Comment = '%';
                }
                field(ImportSequenceNumber; Rec.ImportSequenceNumber)
                {
                    ToolTip = 'Specifies the value of the Import Sequence Number field.', Comment = '%';
                }
                field(OverriddenCreatedOn; Rec.OverriddenCreatedOn)
                {
                    ToolTip = 'Specifies the value of the Record Created On field.', Comment = '%';
                }
                field(TimeZoneRuleVersionNumber; Rec.TimeZoneRuleVersionNumber)
                {
                    ToolTip = 'Specifies the value of the Time Zone Rule Version Number field.', Comment = '%';
                }
                field(UTCConversionTimeZoneCode; Rec.UTCConversionTimeZoneCode)
                {
                    ToolTip = 'Specifies the value of the UTC Conversion Time Zone Code field.', Comment = '%';
                }
                field(msdyn_name; Rec.msdyn_name)
                {
                    ToolTip = 'Specifies the value of the Work Order Number field.', Comment = '%';
                }
                field(processid; Rec.processid)
                {
                    ToolTip = 'Specifies the value of the Process Id field.', Comment = '%';
                }
                field(stageid; Rec.stageid)
                {
                    ToolTip = 'Specifies the value of the Stage Id field.', Comment = '%';
                }
                field(traversedpath; Rec.traversedpath)
                {
                    ToolTip = 'Specifies the value of the Traversed Path field.', Comment = '%';
                }
                field(msdyn_Address1; Rec.msdyn_Address1)
                {
                    ToolTip = 'Specifies the value of the Street 1 field.', Comment = '%';
                }
                field(msdyn_Address2; Rec.msdyn_Address2)
                {
                    ToolTip = 'Specifies the value of the Street 2 field.', Comment = '%';
                }
                field(msdyn_Address3; Rec.msdyn_Address3)
                {
                    ToolTip = 'Specifies the value of the Street 3 field.', Comment = '%';
                }
                field(msdyn_AddressName; Rec.msdyn_AddressName)
                {
                    ToolTip = 'Specifies the value of the Address Name field.', Comment = '%';
                }
                field(msdyn_AutoNumbering; Rec.msdyn_AutoNumbering)
                {
                    ToolTip = 'Specifies the value of the Auto-Numbering field.', Comment = '%';
                }
                field(msdyn_BookingSummary; Rec.msdyn_BookingSummary)
                {
                    ToolTip = 'Specifies the value of the Booked Resources field.', Comment = '%';
                }
                field(msdyn_ChildIndex; Rec.msdyn_ChildIndex)
                {
                    ToolTip = 'Specifies the value of the Child Index field.', Comment = '%';
                }
                field(msdyn_City; Rec.msdyn_City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(msdyn_Country; Rec.msdyn_Country)
                {
                    ToolTip = 'Specifies the value of the Country/Region field.', Comment = '%';
                }
                field(msdyn_DateWindowEnd; Rec.msdyn_DateWindowEnd)
                {
                    ToolTip = 'Specifies the value of the Date Window End field.', Comment = '%';
                }
                field(msdyn_DateWindowStart; Rec.msdyn_DateWindowStart)
                {
                    ToolTip = 'Specifies the value of the Date Window Start field.', Comment = '%';
                }
                field(msdyn_EstimateSubtotalAmount; Rec.msdyn_EstimateSubtotalAmount)
                {
                    ToolTip = 'Specifies the value of the Estimate Subtotal Amount field.', Comment = '%';
                }
                field(ExchangeRate; Rec.ExchangeRate)
                {
                    ToolTip = 'Specifies the value of the Exchange Rate field.', Comment = '%';
                }
                field(msdyn_estimatesubtotalamount_Base; Rec.msdyn_estimatesubtotalamount_Base)
                {
                    ToolTip = 'Specifies the value of the Estimate Subtotal Amount (Base) field.', Comment = '%';
                }
                field(msdyn_FollowUpNote; Rec.msdyn_FollowUpNote)
                {
                    ToolTip = 'Specifies the value of the Follow Up Note (Deprecated) field.', Comment = '%';
                }
                field(msdyn_FollowUpRequired; Rec.msdyn_FollowUpRequired)
                {
                    ToolTip = 'Specifies the value of the Follow Up Required (Deprecated) field.', Comment = '%';
                }
                field(msdyn_Instructions; Rec.msdyn_Instructions)
                {
                    ToolTip = 'Specifies the value of the Instructions field.', Comment = '%';
                }
                field(msdyn_InternalFlags; Rec.msdyn_InternalFlags)
                {
                    ToolTip = 'Specifies the value of the Internal Flags field.', Comment = '%';
                }
                field(msdyn_IsFollowUp; Rec.msdyn_IsFollowUp)
                {
                    ToolTip = 'Specifies the value of the Is FollowUp (Deprecated) field.', Comment = '%';
                }
                field(msdyn_IsMobile; Rec.msdyn_IsMobile)
                {
                    ToolTip = 'Specifies the value of the Is Mobile field.', Comment = '%';
                }
                field(msdyn_Latitude; Rec.msdyn_Latitude)
                {
                    ToolTip = 'Specifies the value of the Latitude field.', Comment = '%';
                }
                field(msdyn_Longitude; Rec.msdyn_Longitude)
                {
                    ToolTip = 'Specifies the value of the Longitude field.', Comment = '%';
                }
                field(msdyn_mapcontrol; Rec.msdyn_mapcontrol)
                {
                    ToolTip = 'Specifies the value of the This field should only be used to load the custom map control field.', Comment = '%';
                }
                field(msdyn_ParentWorkOrder; Rec.msdyn_ParentWorkOrder)
                {
                    ToolTip = 'Specifies the value of the Parent Work Order field.', Comment = '%';
                }
                field(msdyn_PostalCode; Rec.msdyn_PostalCode)
                {
                    ToolTip = 'Specifies the value of the Postal Code field.', Comment = '%';
                }
                field(msdyn_PrimaryIncidentDescription; Rec.msdyn_PrimaryIncidentDescription)
                {
                    ToolTip = 'Specifies the value of the Primary Incident Description field.', Comment = '%';
                }
                field(msdyn_PrimaryIncidentEstimatedDuration; Rec.msdyn_PrimaryIncidentEstimatedDuration)
                {
                    ToolTip = 'Specifies the value of the Primary Incident Estimated Duration field.', Comment = '%';
                }
                field(msdyn_StateOrProvince; Rec.msdyn_StateOrProvince)
                {
                    ToolTip = 'Specifies the value of the State Or Province field.', Comment = '%';
                }
                field(msdyn_SubtotalAmount; Rec.msdyn_SubtotalAmount)
                {
                    ToolTip = 'Specifies the value of the Subtotal Amount field.', Comment = '%';
                }
                field(msdyn_subtotalamount_Base; Rec.msdyn_subtotalamount_Base)
                {
                    ToolTip = 'Specifies the value of the Subtotal Amount (Base) field.', Comment = '%';
                }
                field(msdyn_SystemStatus; Rec.msdyn_SystemStatus)
                {
                    ToolTip = 'Specifies the value of the System Status field.', Comment = '%';
                }
                field(msdyn_Taxable; Rec.msdyn_Taxable)
                {
                    ToolTip = 'Specifies the value of the Taxable field.', Comment = '%';
                }
                field(msdyn_TimeClosed; Rec.msdyn_TimeClosed)
                {
                    ToolTip = 'Specifies the value of the Closed On field.', Comment = '%';
                }
                field(msdyn_TimeFromPromised; Rec.msdyn_TimeFromPromised)
                {
                    ToolTip = 'Specifies the value of the Time From Promised field.', Comment = '%';
                }
                field(msdyn_TimeToPromised; Rec.msdyn_TimeToPromised)
                {
                    ToolTip = 'Specifies the value of the Time To Promised field.', Comment = '%';
                }
                field(msdyn_TimeWindowEnd; Rec.msdyn_TimeWindowEnd)
                {
                    ToolTip = 'Specifies the value of the Time Window End field.', Comment = '%';
                }
                field(msdyn_TimeWindowStart; Rec.msdyn_TimeWindowStart)
                {
                    ToolTip = 'Specifies the value of the Time Window Start field.', Comment = '%';
                }
                field(msdyn_TotalAmount; Rec.msdyn_TotalAmount)
                {
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
                field(msdyn_totalamount_Base; Rec.msdyn_totalamount_Base)
                {
                    ToolTip = 'Specifies the value of the Total Amount (Base) field.', Comment = '%';
                }
                field(msdyn_TotalSalesTax; Rec.msdyn_TotalSalesTax)
                {
                    ToolTip = 'Specifies the value of the Total Sales Tax field.', Comment = '%';
                }
                field(msdyn_totalsalestax_Base; Rec.msdyn_totalsalestax_Base)
                {
                    ToolTip = 'Specifies the value of the Total Sales Tax (Base) field.', Comment = '%';
                }
                field(msdyn_WorkLocation; Rec.msdyn_WorkLocation)
                {
                    ToolTip = 'Specifies the value of the Work Location field.', Comment = '%';
                }
                field(msdyn_WorkOrderSummary; Rec.msdyn_WorkOrderSummary)
                {
                    ToolTip = 'Specifies the value of the Work Order Summary field.', Comment = '%';
                }
                field(msdyn_ParentWorkOrderName; Rec.msdyn_ParentWorkOrderName)
                {
                    ToolTip = 'Specifies the value of the msdyn_ParentWorkOrderName field.', Comment = '%';
                }
                field(msdyn_completedon; Rec.msdyn_completedon)
                {
                    ToolTip = 'Specifies the value of the Completed On field.', Comment = '%';
                }
                field(msdyn_CostNTEPercent; Rec.msdyn_CostNTEPercent)
                {
                    ToolTip = 'Specifies the value of the Cost not-to-exceed 1 field.', Comment = '%';
                }
                field(msdyn_firstarrivedon; Rec.msdyn_firstarrivedon)
                {
                    ToolTip = 'Specifies the value of the First Arrived On field.', Comment = '%';
                }
                field(msdyn_nottoexceedcostamount; Rec.msdyn_nottoexceedcostamount)
                {
                    ToolTip = 'Specifies the value of the Cost not-to-exceed field.', Comment = '%';
                }
                field(msdyn_nottoexceedcostamount_Base; Rec.msdyn_nottoexceedcostamount_Base)
                {
                    ToolTip = 'Specifies the value of the Cost not-to-exceed (Base) field.', Comment = '%';
                }
                field(msdyn_nottoexceedpriceamount; Rec.msdyn_nottoexceedpriceamount)
                {
                    ToolTip = 'Specifies the value of the Price not-to-exceed field.', Comment = '%';
                }
                field(msdyn_nottoexceedpriceamount_Base; Rec.msdyn_nottoexceedpriceamount_Base)
                {
                    ToolTip = 'Specifies the value of the Price not-to-exceed (Base) field.', Comment = '%';
                }
                field(msdyn_phoneNumber; Rec.msdyn_phoneNumber)
                {
                    ToolTip = 'Specifies the value of the Customer Phone Number field.', Comment = '%';
                }
                field(msdyn_PriceNTEPercent; Rec.msdyn_PriceNTEPercent)
                {
                    ToolTip = 'Specifies the value of the Price not-to-exceed 1 field.', Comment = '%';
                }
                field(msdyn_productsservicescost; Rec.msdyn_productsservicescost)
                {
                    ToolTip = 'Specifies the value of the Total Cost field.', Comment = '%';
                }
                field(msdyn_productsservicescost_Base; Rec.msdyn_productsservicescost_Base)
                {
                    ToolTip = 'Specifies the value of the Total Cost (Base) field.', Comment = '%';
                }
                field(msdyn_productsservicesestimatedcost; Rec.msdyn_productsservicesestimatedcost)
                {
                    ToolTip = 'Specifies the value of the Total Estimated Cost field.', Comment = '%';
                }
                field(msdyn_productsservicesestimatedcost_Base; Rec.msdyn_productsservicesestimatedcost_Base)
                {
                    ToolTip = 'Specifies the value of the Total Estimated Cost (Base) field.', Comment = '%';
                }
                field(msdyn_totalestimatedaftertaxprice; Rec.msdyn_totalestimatedaftertaxprice)
                {
                    ToolTip = 'Specifies the value of the Total Estimated After Tax Price field.', Comment = '%';
                }
                field(msdyn_totalestimatedaftertaxprice_Base; Rec.msdyn_totalestimatedaftertaxprice_Base)
                {
                    ToolTip = 'Specifies the value of the Total Estimated After Tax Price (Base) field.', Comment = '%';
                }
                field(msdyn_totalestimatedduration; Rec.msdyn_totalestimatedduration)
                {
                    ToolTip = 'Specifies the value of the Total Estimated Duration field.', Comment = '%';
                }
                field(adids_ProjectManager; Rec.adids_ProjectManager)
                {
                    ToolTip = 'Specifies the value of the Project Manager field.', Comment = '%';
                }
                field(adids_CustomerPONumber; Rec.adids_CustomerPONumber)
                {
                    ToolTip = 'Specifies the value of the Customer PO Number field.', Comment = '%';
                }
                field(adids_ServiceCallID; Rec.adids_ServiceCallID)
                {
                    ToolTip = 'Specifies the value of the Service Call ID field.', Comment = '%';
                }
                field(adids_AccountNumber; Rec.adids_AccountNumber)
                {
                    ToolTip = 'Specifies the value of the Account Number field.', Comment = '%';
                }
                field(adids_BillingType; Rec.adids_BillingType)
                {
                    ToolTip = 'Specifies the value of the Billing Type field.', Comment = '%';
                }
                field(adids_SAPOpenPOCost; Rec.adids_SAPOpenPOCost)
                {
                    ToolTip = 'Specifies the value of the SAP-Open PO Cost field.', Comment = '%';
                }
                field(adids_sapopenpocost_Base; Rec.adids_sapopenpocost_Base)
                {
                    ToolTip = 'Specifies the value of the SAP-Open PO Cost (Base) field.', Comment = '%';
                }
                field(adids_SAPAPCost; Rec.adids_SAPAPCost)
                {
                    ToolTip = 'Specifies the value of the SAP-AP Cost field.', Comment = '%';
                }
                field(adids_sapapcost_Base; Rec.adids_sapapcost_Base)
                {
                    ToolTip = 'Specifies the value of the SAP-AP Cost (Base) field.', Comment = '%';
                }
                field(adids_SAPBudgetRevenue; Rec.adids_SAPBudgetRevenue)
                {
                    ToolTip = 'Specifies the value of the SAP - Budget Revenue field.', Comment = '%';
                }
                field(adids_sapbudgetrevenue_Base; Rec.adids_sapbudgetrevenue_Base)
                {
                    ToolTip = 'Specifies the value of the SAP - Budget Revenue (Base) field.', Comment = '%';
                }
                field(adids_SAPBudgetGP; Rec.adids_SAPBudgetGP)
                {
                    ToolTip = 'Specifies the value of the SAP - Budget GP field.', Comment = '%';
                }
                field(adids_sapbudgetgp_Base; Rec.adids_sapbudgetgp_Base)
                {
                    ToolTip = 'Specifies the value of the SAP - Budget GP (Base) field.', Comment = '%';
                }
                field(adids_SAPBudgetCost; Rec.adids_SAPBudgetCost)
                {
                    ToolTip = 'Specifies the value of the SAP - Budget Cost field.', Comment = '%';
                }
                field(adids_sapbudgetcost_Base; Rec.adids_sapbudgetcost_Base)
                {
                    ToolTip = 'Specifies the value of the SAP - Budget Cost (Base) field.', Comment = '%';
                }
                field(adids_SAPARInvoice; Rec.adids_SAPARInvoice)
                {
                    ToolTip = 'Specifies the value of the SAP - AR Invoice field.', Comment = '%';
                }
                field(adids_saparinvoice_Base; Rec.adids_saparinvoice_Base)
                {
                    ToolTip = 'Specifies the value of the SAP - AR Invoice  (Base) field.', Comment = '%';
                }
                field(adids_SAPLabourCost; Rec.adids_SAPLabourCost)
                {
                    ToolTip = 'Specifies the value of the SAP - Labour Cost field.', Comment = '%';
                }
                field(adids_saplabourcost_Base; Rec.adids_saplabourcost_Base)
                {
                    ToolTip = 'Specifies the value of the SAP - Labour Cost (Base) field.', Comment = '%';
                }
                field(adids_SAPActualCommittedCosttodate; Rec.adids_SAPActualCommittedCosttodate)
                {
                    ToolTip = 'Specifies the value of the SAP - Actual & Committed Cost to date field.', Comment = '%';
                }
                field(adids_sapactualcommittedcosttodate_Base; Rec.adids_sapactualcommittedcosttodate_Base)
                {
                    ToolTip = 'Specifies the value of the SAP - Actual & Committed Cost to date  (Base) field.', Comment = '%';
                }
                field(adids_SAPRunningPL; Rec.adids_SAPRunningPL)
                {
                    ToolTip = 'Specifies the value of the SAP -  Running P&L field.', Comment = '%';
                }
                field(adids_saprunningpl_Base; Rec.adids_saprunningpl_Base)
                {
                    ToolTip = 'Specifies the value of the SAP -  Running P&L  (Base) field.', Comment = '%';
                }
                field(adids_QuotedChargeUp; Rec.adids_QuotedChargeUp)
                {
                    ToolTip = 'Specifies the value of the Quoted / Charge Up field.', Comment = '%';
                }
                field(adids_WorkDescription; Rec.adids_WorkDescription)
                {
                    ToolTip = 'Specifies the value of the Work Description field.', Comment = '%';
                }
                field(adids_Topic; Rec.adids_Topic)
                {
                    ToolTip = 'Specifies the value of the Topic field.', Comment = '%';
                }
                field(msdyn_DisplayAddress; Rec.msdyn_DisplayAddress)
                {
                    ToolTip = 'Specifies the value of the Display Address field.', Comment = '%';
                }
                field(adids_AllocatedHours; Rec.adids_AllocatedHours)
                {
                    ToolTip = 'Specifies the value of the Allocated Hours field.', Comment = '%';
                }
                field(adids_BussinessPartnerAccountID; Rec.adids_BussinessPartnerAccountID)
                {
                    ToolTip = 'Specifies the value of the Bussiness Partner Account ID field.', Comment = '%';
                }
                field(adids_CustomerAppoval; Rec.adids_CustomerAppoval)
                {
                    ToolTip = 'Specifies the value of the Customer Appoval field.', Comment = '%';
                }
                field(adids_DateofEmail1; Rec.adids_DateofEmail1)
                {
                    ToolTip = 'Specifies the value of the Date of Email 1 field.', Comment = '%';
                }
                field(adids_DateofEmail2; Rec.adids_DateofEmail2)
                {
                    ToolTip = 'Specifies the value of the Date of Email 2 field.', Comment = '%';
                }
                field(adids_DateofEmail3; Rec.adids_DateofEmail3)
                {
                    ToolTip = 'Specifies the value of the Date of Email 3 field.', Comment = '%';
                }
                field(adids_DateofEmail4; Rec.adids_DateofEmail4)
                {
                    ToolTip = 'Specifies the value of the Date of Email 4 field.', Comment = '%';
                }
                field(adids_EffortCost; Rec.adids_EffortCost)
                {
                    ToolTip = 'Specifies the value of the Effort Cost field.', Comment = '%';
                }
                field(adids_effortcost_Base; Rec.adids_effortcost_Base)
                {
                    ToolTip = 'Specifies the value of the Effort Cost (Base) field.', Comment = '%';
                }
                field(adids_EffortHours; Rec.adids_EffortHours)
                {
                    ToolTip = 'Specifies the value of the Effort Hours field.', Comment = '%';
                }
                field(adids_Email1; Rec.adids_Email1)
                {
                    ToolTip = 'Specifies the value of the Email 1 field.', Comment = '%';
                }
                field(adids_Email2; Rec.adids_Email2)
                {
                    ToolTip = 'Specifies the value of the Email 2 field.', Comment = '%';
                }
                field(adids_Email3; Rec.adids_Email3)
                {
                    ToolTip = 'Specifies the value of the Email 3 field.', Comment = '%';
                }
                field(adids_Email4; Rec.adids_Email4)
                {
                    ToolTip = 'Specifies the value of the Email 4 field.', Comment = '%';
                }
                field(adids_ImportSerialNo; Rec.adids_ImportSerialNo)
                {
                    ToolTip = 'Specifies the value of the Import Serial No field.', Comment = '%';
                }
                field(adids_RevenueToDateActualCommittedCost; Rec.adids_RevenueToDateActualCommittedCost)
                {
                    ToolTip = 'Specifies the value of the Revenue To Date - Actual & Committed Cost field.', Comment = '%';
                }
                field(adids_revenuetodateactualcommittedcost_Base; Rec.adids_revenuetodateactualcommittedcost_Base)
                {
                    ToolTip = 'Specifies the value of the Revenue To Date - Actual & Committed Cost (Base) field.', Comment = '%';
                }
                field(adids_TotalMatCost; Rec.adids_TotalMatCost)
                {
                    ToolTip = 'Specifies the value of the Total Mat Cost field.', Comment = '%';
                }
                field(adids_totalmatcost_Base; Rec.adids_totalmatcost_Base)
                {
                    ToolTip = 'Specifies the value of the Total Mat Cost (Base) field.', Comment = '%';
                }
                field(adids_SAPServiceCallID; Rec.adids_SAPServiceCallID)
                {
                    ToolTip = 'Specifies the value of the SAP - Service Call ID field.', Comment = '%';
                }
                field(adids_OpenPoCost; Rec.adids_OpenPoCost)
                {
                    ToolTip = 'Specifies the value of the Open Po Cost field.', Comment = '%';
                }
                field(adids_openpocost_Base; Rec.adids_openpocost_Base)
                {
                    ToolTip = 'Specifies the value of the Open Po Cost (Base) field.', Comment = '%';
                }
                field(adids_POBillCost; Rec.adids_POBillCost)
                {
                    ToolTip = 'Specifies the value of the PO Bill Cost field.', Comment = '%';
                }
                field(adids_pobillcost_Base; Rec.adids_pobillcost_Base)
                {
                    ToolTip = 'Specifies the value of the PO Bill Cost (Base) field.', Comment = '%';
                }
                field(adids_OpenPO; Rec.adids_OpenPO)
                {
                    ToolTip = 'Specifies the value of the Open PO field.', Comment = '%';
                }
                field(adids_ProposedSolution; Rec.adids_ProposedSolution)
                {
                    ToolTip = 'Specifies the value of the Proposed Solution field.', Comment = '%';
                }
                field(adids_WorkOrderDuration; Rec.adids_WorkOrderDuration)
                {
                    ToolTip = 'Specifies the value of the Work Order Duration field.', Comment = '%';
                }
                field(adids_BudgetRevenue; Rec.adids_BudgetRevenue)
                {
                    ToolTip = 'Specifies the value of the Budget Revenue field.', Comment = '%';
                }
                field(adids_budgetrevenue_Base; Rec.adids_budgetrevenue_Base)
                {
                    ToolTip = 'Specifies the value of the Budget Revenue (Base) field.', Comment = '%';
                }
                field(adids_BudgetCost; Rec.adids_BudgetCost)
                {
                    ToolTip = 'Specifies the value of the Budget Cost field.', Comment = '%';
                }
                field(adids_budgetcost_Base; Rec.adids_budgetcost_Base)
                {
                    ToolTip = 'Specifies the value of the Budget Cost (Base) field.', Comment = '%';
                }
                field(adids_BudgetGP; Rec.adids_BudgetGP)
                {
                    ToolTip = 'Specifies the value of the Budget GP field.', Comment = '%';
                }
                field(adids_budgetgp_Base; Rec.adids_budgetgp_Base)
                {
                    ToolTip = 'Specifies the value of the Budget GP (Base) field.', Comment = '%';
                }
                field(adids_FixType; Rec.adids_FixType)
                {
                    ToolTip = 'Specifies the value of the Fix Type field.', Comment = '%';
                }
                field(adigkb_bcid; Rec.adigkb_bcid)
                {
                    ToolTip = 'Specifies the value of the bcid field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }


            }
        }
    }
    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"CRM Integration Management");
    end;

    procedure SetCurrentlyCoupledCDSProjects(CDSworkorder: Record "CDS msdyn_workorder")
    begin
        CurrentlyCoupledCDSProspect := CDSworkorder;
    end;

    var
        CurrentlyCoupledCDSProspect: Record "CDS msdyn_workorder";
}
