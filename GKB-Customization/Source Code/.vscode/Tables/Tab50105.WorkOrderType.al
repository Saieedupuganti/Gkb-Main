table 50105 "GKB Work Order Type"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Work Order Type Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Open","Closed","In Progress";
            OptionCaption = 'Open,Closed,"In-Progress"';
        }
        field(50105; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Work Order Type Name")
        {
            Clustered = true;
        }
    }
}