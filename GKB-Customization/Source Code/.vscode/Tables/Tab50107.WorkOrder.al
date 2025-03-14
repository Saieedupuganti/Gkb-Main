table 50107 "GKB Work Order"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "GKB Work Order List";
    LookupPageId = "GKB Work Order Card";
    fields
    {
        field(50000; "Work Order No."; Text[200])
        {
            DataClassification = CustomerContent;

        }
        field(50001; "Service Account"; Code[200])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer";
        }
        field(50002; "System Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Unscheduled,Scheduled,"In Progress",Completed,Invoiced,Cancelled;
        }
        field(50003; "Substatus"; Text[200])
        {
            DataClassification = CustomerContent;
            TableRelation = "GKB Work Order Substatus";
        }
        field(50004; "Agreement"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(50005; "Billing Account"; Text[200])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(50006; "Billing Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Charge Up","Quoted","Monthly Billing","Not Chargeable","N/A";
        }
        field(50007; "Case"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(50008; "Completed On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Contact"; Text[200])
        {
            DataClassification = CustomerContent;
            TableRelation = Contact;
        }
        field(50010; "Currency"; Text[200])  //Changed from Code to Text.
        {
            DataClassification = CustomerContent;
            TableRelation = "Currency";
        }
        field(50011; "Fix Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","First Time Fix","First Time Fix With Multiple Bookings","Not a First Time Fix";
        }
        field(50012; "Functional Location"; Code[200])
        {
            DataClassification = CustomerContent;
            TableRelation = "Ship-to Address".Code;
        }
        field(50013; "Opportunity"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(50014; "Owner"; Text[200])
        {
            DataClassification = CustomerContent;
            TableRelation = Employee;
        }
        field(50029; "Sales Order"; Code[200])
        {
            DataClassification = CustomerContent;
            Caption = 'Sales Order No.';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(50015; "Owning Business Unit"; Code[200])
        {
            DataClassification = CustomerContent;
            TableRelation = Dimension;
        }
        field(50016; "Parent Work Order"; Code[200])
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
        field(50040; "Shortcut Dimension 1 Code"; Code[200])
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
        field(50025; "Work Order Type"; Text[200])
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
        field(50028; "Job No."; Code[200])
        {
            DataClassification = CustomerContent;
            TableRelation = "Job";
        }
        field(50030; "Project Task No"; Code[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No.";
        }
        field(50105; "CRM ID"; Text[200])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50031; "Job Created"; Boolean)
        {
            Caption = 'job Created';
            DataClassification = ToBeClassified;
        }
        field(50032; "Customer PO Number"; Text[200])
        {
            Caption = 'Customer PO Number';
            DataClassification = ToBeClassified;
        }
        field(50205; "Description 2"; Text[200])
        {
            Caption = 'Description 2';
        }
        field(50206; "Location Code"; Code[200])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
            DataClassification = CustomerContent;
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

    fieldgroups
    {
        fieldgroup(Dropdown; "Work Order No.", "Work Order Type", "Service Account")
        {
        }
    }
}