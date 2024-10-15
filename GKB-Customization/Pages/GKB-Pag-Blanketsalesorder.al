pageextension 50101 GKBBlanketSalesOrdereader extends "Blanket Sales Order"
{
    layout
    {
        addafter(Status) // Adds the new field after the 'Status' field
        {
            field("Percentage"; Rec.Percentage) 
            {
                ApplicationArea = All;
                Caption = 'Percentage to Update';
            }
        }
    }
}