pageextension 50369 "Role Center Ext" extends "Order Processor Role Center"
{
    layout
    {
        addafter("User Tasks Activities")
        {
            part(PurchaseCue; "Purchase order - Open")
            {
                ApplicationArea = all;
                Visible = true;
            }
            part(StockCue; "Low Stock")
            {
                ApplicationArea = all;
                Visible = true;
            }
        }
    }
}