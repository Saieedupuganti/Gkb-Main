tableextension 50129 "GKBSales Shipment HeaderExt" extends "Sales Shipment Header"
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
