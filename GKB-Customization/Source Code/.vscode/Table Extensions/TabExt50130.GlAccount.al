tableextension 50130 "GKBG/L AccountExt" extends "G/L Account"
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