tableextension 50146 "GKBSales Invoice HeaderExt" extends "Sales Invoice Header"
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