tableextension 50155 "Purchase Order Archive" extends "Purchase Header Archive"
{
    fields
    {
        field(1234; "Po Status"; enum "Purch header Archive")
        {
            Caption = 'Po Status';
        }
        field(1235;"Entry Type";Text[100])
        {
            Caption = 'Entry Type';
            DataClassification=ToBeClassified;
        }
        field(50101; "Ordered By"; Text[100])
        {
            Caption = 'Ordered By';
            DataClassification = ToBeClassified;
        }
        field(50102; "Created By"; Text[100])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(50103; "Work Order No"; Text[100])
        {
            Caption = 'Work Order No';
            DataClassification = ToBeClassified;
        }
    }
   
}