tableextension 50144 "GKBSales Cr.Memo HeaderExt" extends "Sales Cr.Memo Header"
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