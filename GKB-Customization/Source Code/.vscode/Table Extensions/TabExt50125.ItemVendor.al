tableextension 50125 GKBItemVendorExt extends "Item Vendor"
{
    fields
    {
        field(50100; "current cost"; Decimal)
        {
            Caption = 'current cost';
            ObsoleteState = Removed;
            ObsoleteReason = 'This field is no longer needed and has been removed.';
        }
        field(50101; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No."=FIELD("Vendor No.")));
        }
    }
}
