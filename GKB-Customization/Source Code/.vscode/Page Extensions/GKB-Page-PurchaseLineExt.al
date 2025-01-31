pageextension 50134 PurchlineExt extends "purchase lines"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field(Obrien_Business_Unit; Rec.Obrien_Business_Unit)
            {
                ApplicationArea = all;
                Visible = false;
            }
        }
        
    }
}