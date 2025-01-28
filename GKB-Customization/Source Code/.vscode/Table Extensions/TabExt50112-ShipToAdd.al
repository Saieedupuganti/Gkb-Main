tableextension 50112 "ShipToAddExt" extends "Ship-to Address"
{
    fields
    {
        field(50100; "Owning Business Unit"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50101; "Postal Code"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Postal Code';
        }
        field(50102; "Address 3"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
         field(50149; "D365 State"; Text[100])
        {
            Caption = 'State';
            DataClassification = ToBeClassified;
        }
        field(50150; "D365 Country"; Text[100])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
        }
        field(50145; "D365 City"; Text[100])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(50103;"Crm Id";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
}