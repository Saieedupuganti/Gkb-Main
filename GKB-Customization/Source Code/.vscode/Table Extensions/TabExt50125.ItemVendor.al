tableextension 50125 GKBItemVendorExt extends "Item Vendor"
{
    fields
    {
        field(50100; "current cost"; Decimal)
        {
            Caption = 'current cost';
        }
        field(50101; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No."=FIELD("Vendor No.")));
        }
    }
}
