pageextension 50343 "PriceListLinesExt" extends "Price List Lines"
{
    layout
    {
        addafter(Cost)
        {
            field("Crm Id"; Rec."Crm Id")
            {
                ApplicationArea = all;
            }
        }
    }
}