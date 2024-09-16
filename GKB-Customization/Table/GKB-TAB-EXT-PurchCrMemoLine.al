tableextension 50114 "GKBPurch. Cr. Memo LineExt" extends "Purch. Cr. Memo Line"
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
