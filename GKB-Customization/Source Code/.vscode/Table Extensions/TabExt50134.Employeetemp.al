tableextension 50134 "GKBEmployee Templ.Ext" extends "Employee Templ."
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