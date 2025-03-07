tableextension 50149 "GKBTransfer HeaderExt" extends "Transfer Header"
{
    fields
    {
            field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50102; "Transfer Note"; Text[200])
        {
            Caption = 'Transfer Note';
            DataClassification = ToBeClassified;
        }
    }
    
}