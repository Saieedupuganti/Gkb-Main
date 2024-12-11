tableextension 50305 "API currency" extends "Currency"
{
    fields
    {
        field(50101; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50102; "Custom Exchange Amount"; Decimal)
        {
            Caption = 'Custom Exchange Amount';
            DataClassification = ToBeClassified;
        }
    }
}