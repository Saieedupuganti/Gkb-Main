tableextension 50115 "GKBSales Invoice LineExt" extends "Sales Invoice Line"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101;"Crm Id";Text[100])
        {
            Caption = 'Crm Id';
            DataClassification = ToBeClassified;
        }
    }
}
