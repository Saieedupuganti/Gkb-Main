page 50320 "API Inventory"
{
    PageType = API;
    Caption = 'API Inventory';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'Inventory';
    EntitySetName = 'Inventory';
    SourceTable = "Item Journal Line";
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Description;Rec.Description)
                {
                    Caption = 'Description';
                }
                field("UnitofMeasureCode";Rec."Unit of Measure Code")
                {
                    Caption = 'Unit Of Measure Code';
                }
                field("GenProdPostingGroup";Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. posting Group';
                }
                field(Quantity;Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field("UnitCost";Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}