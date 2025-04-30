page 60033 "Work Order Lines API"
{
    PageType = API;
    ApplicationArea = All;
    SourceTable = "GKB Work Order Lines";
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'WorkOrderLine';
    EntitySetName = 'WorkOrderLines';
    DelayedInsert = true;



    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("CRMID"; Rec."CRM ID")
                {
                }
                field("WorkOrderNo"; Rec."Work Order No.")
                {
                }
                field("LineNo"; Rec."Line No.")
                {
                }
                field(Code; Rec.Code)
                {
                }
                field("LineType"; Rec."Line Type")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Name; Rec.Description)
                {
                }
                field("UnitCode"; Rec."Unit Code") // Unit Of Measure
                {
                }
                field("LineStatus"; Rec."Line Status")
                {
                }
                field("EstimateQuantity"; Rec."Estimate Quantity")
                {
                }
                field("QuantitytoBuild"; Rec."Quantity to Build")
                {
                }
                field("LocationCode"; Rec."Location Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("UnitCost"; Rec."Unit Cost")
                {
                }
                field("UnitAmount"; Rec."Unit Amount")
                {
                }
                field("ServiceDuration"; Rec."Service Duration")
                {
                }
                field("WorkStartTime"; Rec."Work Start Time")
                {
                }
                field("WorkEndTime"; Rec."Work End Time")
                {
                }
            }
        }
    }
}