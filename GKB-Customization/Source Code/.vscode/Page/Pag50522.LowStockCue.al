page 50522 "Low Stock"
{
    PageType = CardPart;
    SourceTable = Item;
    RefreshOnActivate = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(LowStockGroup)
            {
                Caption = 'Low Stock';

                field(LowStock; CountLowStock())
                {
                    Caption = 'Below Reorder Point';
                    DrillDown = true;
                    ToolTip = 'Number of items with inventory less than or equal to reorder point.';
                    Style = Attention;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        Item: Record Item;
                        ItemList: Page "Item List";
                    begin
                        Item.Reset();
                        Item.SetFilter("Low Stock", 'true');

                        if Item.FindSet() then begin
                            ItemList.SetTableView(Item);
                            ItemList.Run();
                        end;
                    end;
                }
            }
        }
    }

    local procedure CountLowStock(): Integer
    var
        Item: Record "Item";
    begin
        Item.SetRange("Low Stock", true);
        exit(Item.Count());
    end;
}
