table 50152 "Work Order Substatus"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(3; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(1; "System Substatus"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Unscheduled,Scheduled,"In Progress",Completed,Invoiced,Canceled;
            OptionCaption = ' ,Unscheduled, Scheduled, "In Progress", Completed, Invoiced, Canceled';
        }
        field(2; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Active,InActive;
            OptionCaption = 'Active,InActive';
        }
        field(50105; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Name")
        {
            Clustered = true;
        }
    }
}