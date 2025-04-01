pageextension 50534 "Purch.Price Ext" extends "Purchase Price List"
{
    layout
    {
        addafter(Status)
        {
            field("Source Type"; Rec."Source Type")
            {
            }
            field("Price Type"; Rec."Price Type")
            {
            }
        }
    }
}