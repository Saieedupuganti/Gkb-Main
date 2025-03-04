pageextension 50300 GKBBlanketSalesOrder extends "Blanket Sales Order Subform"
{
    layout
    {
        modify(Quantity)
        {
            Editable = Rec."Outstanding Qty. (Base)" = Rec.Quantity;
            trigger OnBeforeValidate()
            begin
                if Rec."Quantity" <> 0 then begin
                    if Rec."Remaining Quantity" = 0 then
                        Rec."Remaining Quantity" := Rec."Quantity";
                end;
            end;
        }
        addafter(Quantity)
        {
            field("Remaining Quantity"; Rec."Remaining Quantity")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("QuantityShippedtillnow"; Rec."QuantityShippedtillnow")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter("Location Code")
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
                editable = true;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = All;
                editable = true;
            }
        }
    }
}