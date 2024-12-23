tableextension 50250 "ShipToAddExt" extends "Ship-to Address"
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
        }
        field(50102; "Street 3"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}