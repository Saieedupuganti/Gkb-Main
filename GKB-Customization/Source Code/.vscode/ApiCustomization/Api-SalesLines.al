page 50330 "API Sales Lines"
{
    PageType = API;
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'SalesLines';
    EntitySetName = 'SalesLines';
    SourceTable = "Sales Line";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("CRMID"; Rec."CRM ID")
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