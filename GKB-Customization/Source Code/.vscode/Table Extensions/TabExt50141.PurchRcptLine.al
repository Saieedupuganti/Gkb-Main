tableextension 50141 "GKBPurch. Rcpt. LineExt" extends "Purch. Rcpt. Line"
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