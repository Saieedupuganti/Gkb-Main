table 50502 "Work Order1"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "GKB Work Order List";
    LookupPageId = "GKB Work Order Card";

    fields
    {
        field(50000; "Work Order Number"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50001; "Service Account"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer"; // Replace with the related table if different
        }
        field(50002; "System Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Cancelled,Completed,"In-Progress",Invoiced,Scheduled,Unscheduled;
            OptionCaption = ' ,Cancelled,Completed,In-Progress,Invoiced,Scheduled,Unscheduled';
        }
        field(50003; "Substatus"; Text[100])
        {
            DataClassification = CustomerContent;
            //TableRelation = "Substatus Table"; // Replace with the related table
        }
        field(50004; "Agreement"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Billing Account"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer; // Replace with the related table if different
        }
        field(50006; "Billing Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",ChargeUp,Quoted;
            OptionCaption = ' ,ChargeUp,Quoted';
        }
        field(50007; "Case"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Completed On"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(50009; "Contact"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Contact;
        }
        field(50010; "Currency"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Currency";
        }
        field(50011; "Fix Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Repair,Replace,Other;
            OptionCaption = ' ,Repair,Replace,Other';
        }
        field(50012; "Functional Location"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Ship-to Address"; // Replace with the related table
        }
        field(50013; "Opportunity"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50014; "Owner"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Sales Order Entity Buffer"; // Replace with the related table
        }
        field(50029; "Sales Order"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Sales Header"; // Replace with the related table
        }
        field(50015; "Owning Business Unit"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Dimension; // Replace with the related table
        }
        field(50016; "Parent Work Order"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "GKB Work Order";
        }
        field(50018; "Taxable"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Yes,No;
        }
        field(50019; "Time Window Start"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(50020; "Time Window End"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(50021; "Topic"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50023; "Work Description"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50024; "Work Location"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Onsite,Remote;
            OptionCaption = ' ,Onsite,Remote';
        }
        field(50025; "Work Order Type"; Text[100])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Work Order"; // Replace with the related table
        }
        field(50026; "Work Order Summary"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50027; "Status"; Option)
        {
            DataClassification = CustomerContent;

            OptionMembers = Active,InActive;
            OptionCaption = 'Active,InActive';
        }
        field(50028; "Project No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Job Task"; // Replace with the related table
        }
        field(50030; "Project Task No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No.";
        }

    }

    keys
    {
        key(PK1; "Work Order Number")
        {
            Clustered = true;
        }
        key(PK2; "Work Order Type")
        {
        }
    }
}
