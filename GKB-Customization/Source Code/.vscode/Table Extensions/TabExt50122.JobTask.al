tableextension 50122 "JobTaskExtension" extends "Job Task"
{
    fields
    {
        field(50200; "Billing Type"; Option)
        {
            Caption = 'Billing Type';
            DataClassification = CustomerContent;
           OptionMembers = "Charge Up","Quoted","Monthly Billing","Not Chargeable","N/A";
        }

        field(50201; "Contact"; Code[20])
        {
            Caption = 'Contact';
            TableRelation = Contact;
        }

        field(50202; "Fix Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","First Time Fix","First Time Fix With Multiple Bookings","Not a First Time Fix";
        }

        field(50203; "Functional Location"; Code[20])
        {
            Caption = 'Functional Location';
            TableRelation = "Ship-to Address";
        }

        field(50204; "Sales Order"; Code[20])
        {
            Caption = 'Sales Order';
            TableRelation = "Sales Header" WHERE("Document Type" = FILTER(Order));
        }

        // Newly added fields
        field(50205; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
        }

        field(50206; "Work Order Type"; Text[100])
        {
            Caption = 'Work Order Type';
            TableRelation = "GKB Work Order Type";
        }

        field(50207; "Work Order Summary"; Text[100])
        {
            Caption = 'Work Order Summary';
        }
        field(50016; "Parent Task No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "GKB Work Order";
        }
        field(50007; "Case"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50013; "Opportunity"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = Opportunity;
        }
         field(50014; "System Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Cancelled,Completed,"In-Progress",Invoiced,Scheduled,Unscheduled;
            OptionCaption = ' ,Cancelled,Completed,In-Progress,Invoiced,Scheduled,Unscheduled';
        }
        field(50015;"Substatus"; Code[30])
        {
           DataClassification = CustomerContent;
           TableRelation = "GKB Work Order Substatus";
        }
        field(50032; "Customer PO Number"; Text[100])
        {
            Caption = 'Customer PO Number';
            DataClassification = ToBeClassified;
        }
    }
}
