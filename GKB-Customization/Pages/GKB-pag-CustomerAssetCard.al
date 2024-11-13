page 50556 "Customer Asset Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Customer Asset";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                
            }
            group("Asset Details")
            {
            
            }
            group("Asset Location")
            {
            
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