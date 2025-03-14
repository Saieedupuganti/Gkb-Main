tableextension 50122 "JobTaskExtension" extends "Job Task"
{
    fields
    {
        field(50200; "Billing Type"; Option)
        {
            Caption = 'Billing Type';
            DataClassification = CustomerContent;
            OptionMembers = " ","Charge Up","Quoted","Monthly Billing","Not Chargeable","N/A";
        }

        field(50201; "Contact"; Code[200])
        {
            Caption = 'Contact';
            TableRelation = Contact;
        }

        field(50202; "Fix Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","First Time Fix","First Time Fix With Multiple Bookings","Not a First Time Fix";
        }

        field(50203; "Functional Location"; Code[200])
        {
            Caption = 'Functional Location';
            TableRelation = "Ship-to Address".Name;
            ValidateTableRelation = false;
        }
        // Newly added fields
        field(50205; "Description 2"; Text[200])
        {
            Caption = 'Description 2';
        }

        field(50206; "Work Order Type"; Text[200])
        {
            Caption = 'Work Order Type';
            TableRelation = "GKB Work Order Type";
        }

        field(50207; "Work Order Summary"; Text[200])
        {
            Caption = 'Work Order Summary';
        }
        field(50016; "Parent Task No."; Code[200])
        {
            DataClassification = CustomerContent;
            TableRelation = "GKB Work Order";
        }
        field(50007; "Case"; Text[200])
        {
            DataClassification = CustomerContent;
        }
        field(50013; "Opportunity"; Text[200])
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
        field(50015; "Substatus"; Code[200])
        {
            DataClassification = CustomerContent;
            TableRelation = "GKB Work Order Substatus";
        }
        field(50032; "Customer PO Number"; Text[200])
        {
            Caption = 'Customer PO Number';
            DataClassification = ToBeClassified;
        }
        field(50033;"GST Posting Group"; Code[50])
        {
            Caption = 'GST Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";
        }
    }
}
