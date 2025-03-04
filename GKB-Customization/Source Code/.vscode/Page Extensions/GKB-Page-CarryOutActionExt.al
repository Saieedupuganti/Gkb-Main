reportextension 76654 "Carry Out Ext" extends "Carry Out Action Msg. - Req."
{
    requestpage
    {
        layout
        {
            modify(PrintOrders)
            {
                Visible = false;   // Hiding the print orders feild in the purchase request.
            }
        }
    }
}