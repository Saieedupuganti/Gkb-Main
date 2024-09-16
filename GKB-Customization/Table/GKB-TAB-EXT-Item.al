tableextension 50102 GKBItemExt extends Item
{
    fields
    {
        field(50100; "OBS Item Name"; Text[100])
        {
            Caption = 'OBS Item Name';
            DataClassification = ToBeClassified;
        }
        field(50101; "Vendor Item Name"; Text[100])
        {
            Caption = 'Vendor Item Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No."=FIELD("Vendor No.")));
        }
        field(50111; VendorName; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No."=FIELD("Vendor No.")));
        }
    }
}
