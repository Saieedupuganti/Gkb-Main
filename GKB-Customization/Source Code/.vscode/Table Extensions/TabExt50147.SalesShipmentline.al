tableextension 50147 "GKBSales Shipment LineExt" extends "Sales Shipment Line"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
    }
}