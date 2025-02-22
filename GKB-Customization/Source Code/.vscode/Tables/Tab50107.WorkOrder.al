table 50107 "GKB Work Order"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "GKB Work Order List";
    LookupPageId = "GKB Work Order Card";
    

    fields
    {
        field(50000; "Work Order No."; Text[50])
        {
            DataClassification = CustomerContent;
            
        }
        field(50001; "Service Account"; Code[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer";
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
            //TableRelation = "Substatus Table"; 
        }
        field(50004; "Agreement"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Billing Account"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
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
        field(50008; "Completed On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Contact"; Text[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Contact;
        }
        field(50010; "Currency"; Text[20])  //Changed from Code to Text.
        {
            DataClassification = CustomerContent;
            TableRelation = "Currency";
        }
        field(50011; "Fix Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Repair,Replace,Other;
            OptionCaption = ' ,Repair,Replace,Other';
        }
        field(50012; "Functional Location"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Ship-to Address".Code;
        }
        field(50013; "Opportunity"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = Opportunity;
        }
        field(50014; "Owner"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = Employee;
        }
        field(50029; "Sales Order"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Sales Header";
        }
        field(50015; "Owning Business Unit"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Dimension;
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
        field(50019; "Time Window Start"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50020; "Time Window End"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50021; "Topic"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50040; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Obrien_Business unit Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));
        }
        field(50023; "Work Description"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50024; "Work Location"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Onsite,Remote;
            OptionCaption = ' ,Onsite,Remote';
        }
        field(50025; "Work Order Type"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "GKB Work Order Type";
        }
        field(50026; "Work Order Summary"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(50027; "Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Active,InActive;
            OptionCaption = 'Active,InActive';
        }
        field(50028; "Job No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Job";
        }
        field(50030; "Project Task No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No.";
        }
        field(50105; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50031; "Job Created"; Boolean)
        {
            Caption = 'job Created';
            DataClassification = ToBeClassified;
        }
        field(50032; "Customer PO Number"; Text[100])
        {
            Caption = 'Customer PO Number';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK1; "Work Order No.")
        {
            Clustered = true;
        }
        key(PK2; "Work Order Type")
        {
        }
    }
}