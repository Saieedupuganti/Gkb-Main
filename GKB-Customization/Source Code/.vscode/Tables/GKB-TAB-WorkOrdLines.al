table 50151 "Work Order Lines"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(44; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(1000; "Work Order No."; Code[30])
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
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(key2; "Project Code", "Project Task Code")
        {

        }
    }
    trigger OnInsert()
    begin
        if ("Project code" <> '') and ("Project Task code" <> '') then
            LinkToProjectPlanningLines();
    end;

    procedure LinkToProjectPlanningLines()
    var
        ProjectPlanningLine: Record "job Planning Line";
    begin
        // Set filters to locate the corresponding Project Planning Line
        ProjectPlanningLine.SetRange("job No.", Rec."Project code");
        ProjectPlanningLine.SetRange("job Task No.", Rec."Project Task code");

        // Check if the Project Planning Line exists
        if ProjectPlanningLine.FindFirst() then begin
            // Create a new line in Project Planning Lines
            ProjectPlanningLine.Init();
            ProjectPlanningLine."job No." := Rec."Project code";
            ProjectPlanningLine."job Task No." := Rec."Project Task code";
            // Set other fields as necessary
            ProjectPlanningLine.Insert();
        end else
            Error('Project Planning Line not found for Project No. %1 and Project Task No. %2', Rec."Project code", Rec."Project Task code");
    end;
}

