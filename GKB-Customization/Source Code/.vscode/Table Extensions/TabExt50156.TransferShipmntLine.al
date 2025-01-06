tableextension 50156 "GKBTransfer Shipment LineExt" extends "Transfer Shipment Line"
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