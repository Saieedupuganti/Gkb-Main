table 50150 "Work Order Type"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Work Order Name"; Text[100])
        {
            DataClassification = ToBeClassified;  
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