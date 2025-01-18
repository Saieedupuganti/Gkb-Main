pageextension 50344 "ShipToAddExt" extends "Ship-to Address"
{
    layout
    {
        addafter("Location Code")
        {
            field("Crm Id"; Rec."Crm Id")
            {
                ApplicationArea = All;
            }
        }
    }
}