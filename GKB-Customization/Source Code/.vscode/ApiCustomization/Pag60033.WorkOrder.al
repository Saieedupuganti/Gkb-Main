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
                field("workordernumber"; rec."Work Order No.") { }
                field(crmid; Rec."CRM ID") { }
                field("serviceaccount"; rec."Service Account") { }
                field("systemstatus"; rec."System Status") { }
                field("substatus"; rec."Substatus") { }
                field("agreement"; rec."Agreement") { }
                field("billingaccount"; rec."Billing Account") { }
                field("billingtype"; rec."Billing Type") { }
                field("contact"; rec."Contact") { }
                field("currency"; rec."Currency") { }
                field("fixtype"; rec."Fix Type") { }
                field("customerponumber"; Rec."Customer PO Number") { }
                field("functionallocation"; rec."Functional Location") { }
                field("opportunity"; rec."Opportunity") { }
                field("salesorder"; rec."Sales Order") { }
                field("owningbusinessunit"; rec."Shortcut Dimension 1 Code") { }
                field("parentworkorder"; rec."Parent Work Order") { }
                field("timewindowstart"; rec."Time Window Start") { }
                field("timewindowend"; rec."Time Window End") { }
                field("topic"; rec."Topic") { }
                field("workdescription"; rec."Work Description") { }
                field("workordertype"; rec."Work Order Type") { }
                field("workordersummary"; rec."Work Order Summary") { }
                field("status"; rec."Status") { }
            }
        }
    }
}
