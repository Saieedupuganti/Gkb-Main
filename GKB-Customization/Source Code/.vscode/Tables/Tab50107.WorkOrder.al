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

    trigger OnInsert()
    var
        WO: Record "GKB Work Order";
    begin

        // Filter Work Orders where "Job Created" is false
        WO.SetRange("Job Created", false);
        if WO.IsEmpty then
            exit;

        if WO.FindSet() then
            repeat
                if JobNotExistForWO(WO) then
                    CreateJobFromWO(WO);
            until WO.Next() = 0;
    end;

    local procedure JobNotExistForWO(var WO: Record "GKB Work Order"): Boolean
    var
        Job: Record Job;
        JobTask: Record "Job Task";
    begin
        job.Reset();
        Job.SetRange("Service Account", WO."Service Account");
        Job.SetRange("Work Order Type", WO."Work Order Type");

        if not Job.FindFirst() then
            exit(true);
        JobTask.Reset();
        JobTask.SetRange("Job No.", Job."No.");
        JobTask.SetRange("Job Task No.", JobTask."Job Task No.");
        if not JobTask.FindFirst() then begin
            JobTask.Init();
            JobTask."Job No." := Job."No.";
            JobTask."Job Task No." := WO."Work Order No.";
            JobTask.Description := WO."Topic";
            JobTask.Insert();

            if WO."Job No." = '' then
                WO."Job No." := Job."No.";
            WO."Project Task No" := JobTask."Job Task No.";
            WO."Job Created" := true;
            WO.Modify();
            Message('Job Task Updated %1 to Job %2', WO."Work Order No.", WO."Job No.");
        end;

        exit(false);
    end;

    local procedure CreateJobFromWO(WO: Record "GKB Work Order")
    var
        Job: Record Job;
        JobTask: Record "Job Task";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        Job.Init();
        Job."No." := NoSeriesMgt.GetNextNo('JOB', 0D, true);
        Job.Description := WO."Service Account" + ' - ' + WO."Work Order Type";
        Job."Service Account" := WO."Service Account";
        Job."Work Order Type" := WO."Work Order Type";
        Job."Bill-to Customer No." := WO."Service Account";
        Job.Insert();
        Message('Job card created with no %1', Job."No.");

        // Create Job Task for the new Job
        JobTask.Init();
        JobTask."Job No." := Job."No.";
        JobTask."Job Task No." := WO."Work Order No.";
        JobTask.Description := WO."Topic";
        JobTask.Insert();

        if WO."Job No." = '' then
            WO."Job No." := Job."No.";
        WO."Project Task No" := JobTask."Job Task No.";
        WO."Job Created" := true;
        WO.Modify();
    end;
}

