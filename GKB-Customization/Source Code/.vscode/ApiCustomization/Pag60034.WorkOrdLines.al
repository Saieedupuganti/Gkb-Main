page 60033 "Work Order Lines API"
{
    PageType = API;
    ApplicationArea = All;
    SourceTable = "Work Order Lines";
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0','v1.0';
    EntityName = 'WorkOrderLine';
    EntitySetName = 'WorkOrderLines';
    DelayedInsert = true;
    

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("WorkOrderNo"; Rec."Work Order No.")
                {
                }
                field(Code; Rec.Code)
                {
                }
                field("UnitCode"; Rec."Unit Code")
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
                field("TotalCost"; Rec."Total Cost")
                {
                }
                field("UnitAmount"; Rec."Unit Amount")
                {
                }
                field("TotalAmount"; Rec."Total Amount")
                {
                }
                field("ProjectCode"; Rec."Project Code")
                {
                }
                field("ProjectTaskCode"; Rec."Project Task Code")
                {
                }
            }
        }
    }   
}

