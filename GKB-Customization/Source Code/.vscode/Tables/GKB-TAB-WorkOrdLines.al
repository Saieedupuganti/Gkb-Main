table 50151 "Work Order Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(44; "Line No."; Code[30])
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(1000; "Work Order No."; Code[20])
        {
            Caption = 'Work Order No.';
            TableRelation = "Work Order";

        }
        field(2; Code; Code[20])
        {
            Caption = 'Product No.';
            TableRelation = Item;
        }
        field(55; "Name"; Text[200])
        {
            Caption = 'Name';
        }
        field(3; "Unit Code"; Code[20])
        {
            Caption = 'Unit Code';
        }
        field(4; "Line Status"; Option)
        {
            Caption = 'Line Status';
            OptionMembers = Open,Closed;
        }
        field(5; "Estimate Quantity"; Decimal)
        {
            Caption = 'Estimate Quantity';
        }
        field(6; "Quantity to Build"; Decimal)
        {
            Caption = 'Quantity to Build';
        }
        field(7; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
        }
        field(8; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(9; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
        }
        field(10; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';
        }
        field(11; "Unit Amount"; Decimal)
        {
            Caption = 'Unit Amount';
        }
        field(12; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
        }
        field(13; "Project Code"; Code[20])
        {
            Caption = 'Project Code';
        }
        field(14; "Project Task Code"; Code[20])
        {
            Caption = 'Project Task Code';
        }
        field(50105; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(key1; "Line No.", "Work Order No.")
        {
            Clustered = true;
        }
        key(key2; "Project Code", "Project Task Code")
        {

        }
    }
}