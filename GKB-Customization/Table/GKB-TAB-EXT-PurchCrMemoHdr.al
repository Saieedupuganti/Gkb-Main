tableextension 50113 "GKBPurch. Cr. Memo Hdr.Ext" extends "Purch. Cr. Memo Hdr."
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
