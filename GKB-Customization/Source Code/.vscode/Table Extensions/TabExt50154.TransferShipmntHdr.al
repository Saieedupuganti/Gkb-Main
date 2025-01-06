tableextension 50154 "GKBTransfer Shipment HeaderExt" extends "Transfer Shipment Header"
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