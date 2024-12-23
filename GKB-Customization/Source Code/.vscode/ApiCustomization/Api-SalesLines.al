page 50330 "API Sales Lines"
{
    PageType = API;
    Caption = 'API Sales Line';
    ApplicationArea = All;
    APIPublisher = 'integration';
    APIGroup = 'Api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'SalesLines';
    EntitySetName = 'SalesLines';
    UsageCategory = Administration;
    SourceTable = "Sales Line";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("CRMID";Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field("UnitofMeasure"; Rec."Unit of Measure")
                {
                    Caption = 'Unit Of Measure';
                }
                field(product; Rec.Product)
                {
                    Caption = 'Product';
                }
                field(Amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field("DimensionSetID"; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension';
                }
            }
        }
    }
}