page 50522 "Low Stock"
{
    PageType = CardPart;
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
                        TempItem: Record Item temporary;
                        ItemList: Page "Item List";
                    begin
                        // Reset and set filter for items with a reorder point
                        Item.Reset();
                        Item.SetFilter("Reorder Point", '<>0');

                        // Find all items below reorder point and add to temp table
                        if Item.FindSet() then
                            repeat
                                Item.CalcFields(Inventory);
                                if Item.Inventory <= Item."Reorder Point" then begin
                                    TempItem.Init();
                                    TempItem.TransferFields(Item);
                                    TempItem.Insert();
                                end;
                            until Item.Next() = 0;

                        // Run the page with the temporary table
                        if TempItem.FindFirst() then begin
                            Clear(ItemList);
                            ItemList.SetTableView(TempItem);
                            ItemList.Run();
                        end else
                            Message('No items found below reorder point.');
                    end;
                }
            }
        }
    }

    local procedure CountLowStock(): Integer
    var
        Item: Record Item;
        Count: Integer;
    begin
        Count := 0;

        Item.Reset();
        Item.SetFilter("Reorder Point", '<>0');

        if Item.FindSet() then
            repeat
                Item.CalcFields(Inventory);
                if Item.Inventory <= Item."Reorder Point" then
                    Count += 1;
            until Item.Next() = 0;

        exit(Count);
    end;
}