tableextension 50140 "GKBPurch. Rcpt. HeaderExt" extends "Purch. Rcpt. Header"
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