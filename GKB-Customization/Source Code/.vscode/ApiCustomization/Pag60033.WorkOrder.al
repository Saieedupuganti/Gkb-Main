page 50100 "WorkOrderAPI"
{
    PageType = API;
    SourceTable = "GKB Work Order";
    ApplicationArea = All;
    Caption = 'Work Order API';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v1.0', 'v2.0';
    EntityName = 'WorkOrder';
    EntitySetName = 'WorkOrders';
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("WorkOrderNumber"; rec."Work Order No.") { }
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field("ServiceAccount"; rec."Service Account") { }
                field("SystemStatus"; rec."System Status") { }
                field("Substatus"; rec."Substatus") { }
                field("Agreement"; rec."Agreement") { }
                field("BillingAccount"; rec."Billing Account") { }
                field("BillingType"; rec."Billing Type") { }
                // field("Case"; rec."Case") { }
                field("CompletedOn"; rec."Completed On") { }
                field("Contact"; rec."Contact") { }
                field("Currency"; rec."Currency") { }
                field("FixType"; rec."Fix Type") { }
                field("FunctionalLocation"; rec."Functional Location") { }
                field("Opportunity"; rec."Opportunity") { }
                field("Owner"; rec."Owner") { }
                field("SalesOrder"; rec."Sales Order") { }
                field("OwningBusinessUnit"; rec."Owning Business Unit") { }
                field("ParentWorkOrder"; rec."Parent Work Order") { }
                // field("Taxable"; rec."Taxable") { }
                field("TimeWindowStart"; rec."Time Window Start") { }
                field("TimeWindowEnd"; rec."Time Window End") { }
                field("Topic"; rec."Topic") { }
                field("WorkDescription"; rec."Work Description") { }
                // field("WorkLocation"; rec."Work Location") { }
                field("WorkOrderType"; rec."Work Order Type") { }
                field("WorkOrderSummary"; rec."Work Order Summary") { }
                field("Status"; rec."Status") { }
                field("ProjectNo"; rec."Job No.") { }
                field("ProjectTaskNo"; rec."Project Task No") { }
            }
        }
    }
}
