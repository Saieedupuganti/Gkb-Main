tableextension 50124 "GKBSales Cr.Memo LineExt" extends "Sales Cr.Memo Line"
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
