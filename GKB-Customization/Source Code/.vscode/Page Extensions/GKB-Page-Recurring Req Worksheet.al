pageextension 50124 "GKB Rec.Req.Worksheet" extends "Recurring Req. Worksheet"
{
    Caption = 'Purchase Recurring Request';

    layout
    {
        modify("Location Code")     // changing the Location Code to Warehouse.
        {
            Caption = 'Warehouse';
        }
    }
}
