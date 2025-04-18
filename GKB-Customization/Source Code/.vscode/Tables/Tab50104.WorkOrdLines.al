table 50104 "GKB Work Order Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(44; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(1000; "Work Order No."; Code[200])
        {
            Caption = 'Work Order No.';
            TableRelation = "GKB Work Order";
        }
        field(2; Code; Code[200])
        {
            Caption = 'Product No.';
            TableRelation = Item;
        }
        field(55; "Name"; Text[200])
        {
            Caption = 'Name';

        }
        field(3; "Unit Code"; Code[200])
        {
            Caption = 'Unit Code';
            TableRelation = "Unit of Measure";
        }
        field(4; "Line Status"; Option)
        {
            Caption = 'Line Status';
            OptionMembers = " ",Open,Closed;
        }
        field(5; "Estimate Quantity"; Decimal)
        {
            Caption = 'Estimate Quantity';
        }
        field(6; "Quantity to Build"; Decimal)
        {
            Caption = 'Quantity to Build';
        }
        field(7; "Location Code"; Code[200])
        {
            Caption = 'Location Code';
        }
        field(8; Description; Text[250])
        {
            Caption = 'Name';
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
        field(13; "Job No."; Code[200])
        {
            Caption = 'Project No';
        }
        field(50105; "CRM ID"; Text[200])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50115; "Line Created"; Boolean)
        {
            Caption = 'Line Created';
            DataClassification = ToBeClassified;
        }
        field(50116; "Line Type"; Enum "Job Line Type")
        {
            Caption = 'Line Type';
        }
        field(50117; Type; Enum "GKB Job Journal Line Type")
        {
            Caption = 'Type';
        }
        field(50118;"Work Start Time";Date)
        {
            Caption = 'Work Start Date';
        }
        field(50119;"Work End Time";Date)
        {
            Caption = 'Work Start Date';
        }

        field(50000; "Service Duration"; Decimal)
        {
            Caption = 'Service Duration';
            ToolTip = 'Stores the duration of the service provided';
            DataClassification = ToBeClassified;
        }

        field(50001; "Total Cost of Service"; Decimal)
        {
            Caption = 'Total Cost of Service';
            ToolTip = 'Stores the total cost of the service';
            DataClassification = ToBeClassified;
            ObsoleteState = Removed;
        }
    }
    keys
    {
        key(key1; "Job No.", "Work Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
