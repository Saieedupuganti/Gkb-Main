page 50556 "Customer Asset Card"
{
    Caption = 'Customer Asset Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Customer Asset";
    RefreshOnActivate = true;
    AboutTitle='Customer Asset Card';
    
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