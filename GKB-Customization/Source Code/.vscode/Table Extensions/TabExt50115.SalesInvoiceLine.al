tableextension 50115 "GKBSales Invoice LineExt" extends "Sales Invoice Line"
{
    fields
    {
        field(50100; Comments2; Text[200])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Crm Id"; Decimal)
        {
            Caption = 'Crm Id';
            DataClassification = ToBeClassified;
        }
    }
}
