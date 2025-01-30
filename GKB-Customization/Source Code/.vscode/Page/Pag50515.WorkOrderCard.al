page 50515 "GKB Work Order Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "GKB Work Order";
    Caption = 'Work Order Card';
    AboutTitle = 'Work Order Card';
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Work Order Number"; rec."Work Order No.")
                {
                    ApplicationArea = All;
                    Caption = 'Work Order Number';
                    ShowMandatory = true;
                }
                field("Service Account"; rec."Service Account")
                {
                    ApplicationArea = All;
                    Caption = 'Service Account';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field("Work Order Type"; rec."Work Order Type")
                {
                    ApplicationArea = All;
                    Caption = 'Work Order Type';
                    ShowMandatory = true;
                    NotBlank = true;
                }
                field("System Status"; Rec."System Status")
                {
                    ApplicationArea = All;
                    Caption = 'System Status';
                }
                field("CRM ID"; Rec."CRM ID")
                {
                    ApplicationArea = all;
                }
                field("Substatus"; Rec.Substatus)
                {
                    ApplicationArea = All;
                    Caption = 'Substatus';
                }
                field("Agreement"; rec.Agreement)
                {
                    ApplicationArea = All;
                    Caption = 'Agreement';
                }
                field("Project No"; Rec."Job No.")
                {
                    ApplicationArea = all;
                    Caption = 'Project No.';
                }
                field("Project Task No"; Rec."Project Task No")
                {
                    ApplicationArea = all;
                    Caption = 'Project Task No.';
                }
                field("Billing Account"; Rec."Billing Account")
                {
                    ApplicationArea = All;
                    Caption = 'Billing Account';
                }
                field("Customer PO Number"; Rec."Customer PO Number")
                {
                    ApplicationArea = all;
                }
                field("Billing Type"; rec."Billing Type")
                {
                    ApplicationArea = All;
                    Caption = 'Billing Type';
                }
                field("Case"; rec."Case")
                {
                    ApplicationArea = All;
                    Caption = 'Case';
                }
                field("Job Created"; Rec."Job Created")
                {
                    ApplicationArea = all;
                    Caption = 'Job Created';
                }
                field("Completed On"; rec."Completed On")
                {
                    ApplicationArea = All;
                    Caption = 'Completed On';
                }
                field("Contact"; rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact';
                }
                field("Currency"; rec.Currency)
                {
                    ApplicationArea = All;
                    Caption = 'Currency';
                }
            }
            part("Lines"; "Work Order Lines ListPart")
            {
                ApplicationArea = basic, suite;
                SubPageLink = "Work Order No." = FIELD("Work Order No.");
            }
            group(Billing)
            {
                field("Fix Type"; rec."Fix Type")
                {
                    ApplicationArea = All;
                    Caption = 'Fix Type';
                }
                field("Functional Location"; rec."Functional Location")
                {
                    ApplicationArea = All;
                    Caption = 'Functional Location';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {

                    ApplicationArea = all;
                }
                field("Opportunity"; rec.Opportunity)
                {
                    ApplicationArea = All;
                    Caption = 'Opportunity';
                }
                field("Owner"; rec.Owner)
                {
                    ApplicationArea = All;
                    Caption = 'Owner';
                }
                field("Owning Business Unit"; rec."Owning Business Unit")
                {
                    ApplicationArea = All;
                    Caption = 'Owning Business Unit';
                    Visible = false;
                }
                field("Parent Work Order"; rec."Parent Work Order")
                {
                    ApplicationArea = All;
                    Caption = 'Parent Work Order';
                }
                field("Taxable"; rec.Taxable)
                {
                    ApplicationArea = All;
                    Caption = 'Taxable';
                }
                field("Time Window Start"; rec."Time Window Start")
                {
                    ApplicationArea = All;
                    Caption = 'Time Window Start';
                }
                field("Time Window End"; rec."Time Window End")
                {
                    ApplicationArea = All;
                    Caption = 'Time Window End';
                }
                field("Topic"; rec.Topic)
                {
                    ApplicationArea = All;
                    Caption = 'Topic';
                    ShowMandatory = true;
                }
                field("Work Description"; rec."Work Description")
                {
                    ApplicationArea = All;
                    Caption = 'Work Description';
                }
                field("Work Location"; rec."Work Location")
                {
                    ApplicationArea = All;
                    Caption = 'Work Location';
                }
                field("Work Order Summary"; rec."Work Order Summary")
                {
                    ApplicationArea = All;
                    Caption = 'Work Order Summary';
                }
                field("Status"; rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }
            }
        }
        area(FactBoxes)
        {
            part("Attachments"; "Document Attachment FactBox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
            }
        }
    }
    // trigger OnOpenPage()
    // var
    //     WO: Record "GKB Work Order";
    // begin

    //     // Filter Work Orders where "Job Created" is false
    //     WO.SetRange("Job Created", false);
    //     if WO.IsEmpty then
    //         exit;

    //     if WO.FindSet() then
    //         repeat
    //             if JobNotExistForWO(WO) then
    //                 CreateJobFromWO(WO);
    //         until WO.Next() = 0;
    // end;

    // local procedure JobNotExistForWO(var WO: Record "GKB Work Order"): Boolean
    // var
    //     Job: Record Job;
    //     JobTask: Record "Job Task";
    // begin
    //     job.Reset();
    //     Job.SetRange("Service Account", WO."Service Account");
    //     Job.SetRange("Work Order Type", WO."Work Order Type");

    //     if not Job.FindFirst() then
    //         exit(true);
    //     JobTask.Reset();
    //     JobTask.SetRange("Job No.", Job."No.");
    //     JobTask.SetRange("Job Task No.", JobTask."Job Task No.");
    //     if not JobTask.FindFirst() then begin
    //         JobTask.Init();
    //         JobTask."Job No." := Job."No.";
    //         JobTask."Job Task No." := WO."Work Order No.";
    //         JobTask.Description := WO."Topic";
    //         JobTask.Insert();

    //         if WO."Job No." = '' then
    //             WO."Job No." := Job."No.";
    //         WO."Project Task No" := JobTask."Job Task No.";
    //         WO."Job Created" := true;
    //         WO.Modify();
    //         Message('Job Task Updated %1 to Job %2', WO."Work Order No.", WO."Job No.");
    //     end;

    //     exit(false);
    // end;

    // local procedure CreateJobFromWO(WO: Record "GKB Work Order")
    // var
    //     Job: Record Job;
    //     JobTask: Record "Job Task";
    //     NoSeriesMgt: Codeunit "No. Series";
    // begin
    //     Job.Init();
    //     Job."No." := NoSeriesMgt.GetNextNo('JOB', 0D, true);
    //     Job.Description := WO."Service Account" + ' - ' + WO."Work Order Type";
    //     Job."Service Account" := WO."Service Account";
    //     Job."Work Order Type" := WO."Work Order Type";
    //     Job."Bill-to Customer No." := WO."Service Account";
    //     Job.Insert();
    //     Message('Job card created with no %1', Job."No.");

    //     // Create Job Task for the new Job
    //     JobTask.Init();
    //     JobTask."Job No." := Job."No.";
    //     JobTask."Job Task No." := WO."Work Order No.";
    //     JobTask.Description := WO."Topic";
    //     JobTask.Insert();

    //     if WO."Job No." = '' then
    //         WO."Job No." := Job."No.";
    //     WO."Project Task No" := JobTask."Job Task No.";
    //     WO."Job Created" := true;
    //     WO.Modify();
    // end;
}