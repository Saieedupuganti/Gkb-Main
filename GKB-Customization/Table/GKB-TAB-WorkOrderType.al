table 50150 "Work Order Type"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Work Order Name"; Text[100])
        {
            DataClassification = ToBeClassified;  
        }
        field(2;Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Open","Closed","In Progress";
            OptionCaption = 'Open,Closed,"In-Progress"';
        }
    }
    
    keys
    {
        key(PK; "Work Order Name")
        {
            Clustered = true;
        }
    }
}