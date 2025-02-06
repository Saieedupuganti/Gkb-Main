tableextension 50122 "JobTaskExtension" extends "Job Task"
{
    fields
    {
        field(50200; "Billing Type"; Option)
        {
            Caption = 'Billing Type';
            OptionMembers = " ",Hai;
        }

        field(50201; "Contact"; Code[20])
        {
            Caption = 'Contact';
            TableRelation = Contact;
        }

        field(50202; "Fix Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Repair,Replace,Other;
            OptionCaption = ' ,Repair,Replace,Other';
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
    }
}
