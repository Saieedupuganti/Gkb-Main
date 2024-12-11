reportextension 76654 MyExtension extends "Carry Out Action Msg. - Req."
{
    dataset
    {
    }

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

    rendering
    {
    }
}