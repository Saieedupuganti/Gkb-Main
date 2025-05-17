tableextension 50148 "GKBSales Shipment HeaderExt" extends "Sales Shipment Header"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Delivery Docket No."; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
}