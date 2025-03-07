pageextension 50350 "SaleOrderListExt" extends "Sales Order List"
{
    layout
    {
        addafter("Currency Code")
        {
            field(SystemId; Rec.SystemId) { ApplicationArea = all; }
        }
    }
   trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        rec.Ascending(false);
    end;
}