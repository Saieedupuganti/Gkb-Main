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
        field(1000; "Work Order No."; Code[30])
        {
            Caption = 'Work Order No.';
            TableRelation = "GKB Work Order";
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
        field(13; "Job No."; Code[20])
        {
            Caption = 'Project Code';
        }
        field(50105; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(500115; "Line Created"; Boolean)
        {
            Caption = 'Line Created';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {

        key(key1; "Job No.", "Work Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        WOL: Record "GKB Work Order Lines";
    begin
        // WOL.SetRange("Line Created", false);
        // if WOL.IsEmpty then
        //     PlanningLine."Job No." := "Job No.";
        // PlanningLine."Job Task No." := "Work Order No.";
        // exit;

        // if WOL.FindSet() then
        //     repeat
        //         InsertWorkOrderLineToPlanningLine(WOL);
        //     until WOL.Next() = 0;
    end;

    procedure InsertWorkOrderLineToPlanningLine(Var WOL: Record "GKB Work Order Lines");
    var

        WorkOrderLine: Record "GKB Work Order Lines";
        JobTask: Record "Job Task";
    begin
        JobTask.SetRange("Job No.", "Job No.");
        JobTask.SetRange("Job Task No.", "Work Order No.");
        if not JobTask.FindFirst() then
            exit;
        PlanningLine.SetRange("Job No.", "Job No.");
        PlanningLine.SetRange("Job Task No.", "Work Order No.");
        if PlanningLine.FindFirst() then
            Error('A planning line with the same Project No. and Task No. already exists.');

        PlanningLine.Init();
        PlanningLine."Job No." := "Job No.";
        PlanningLine."Job Task No." := "Work Order No.";
        PlanningLine."Line Type" := PlanningLine."Line Type"::"Billable";
        PlanningLine.Description := Description;
        PlanningLine."Work Type Code" := Name;
        PlanningLine.Quantity := "Estimate Quantity";
        PlanningLine."Unit Price" := "Unit amount";
        PlanningLine.Insert();

        WOL."Line Created" := true;
        WOL.Modify();
        Message('Work order line is inserted to %1', PlanningLine."Job Task No.");
    end;

    var
        PlanningLine: Record "Job Planning Line";
}

