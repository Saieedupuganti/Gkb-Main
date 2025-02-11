namespace GKBCustomization.GKBCustomization;

using Microsoft.Projects.Project.Job;
using Microsoft.Sales.Customer;
using Microsoft.Projects.Project.Planning;
using Microsoft.Foundation.NoSeries;

codeunit 50102 "GKB Work Order Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"GKB Work Order Lines", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertWOLns(var Rec: Record "GKB Work Order lines"; RunTrigger: Boolean)
    var
        Job: Code[20];
        JobTask: Code[20];
    begin
        CreateJobTaskLinesFromWOLs(Rec);//, Job, JobTask);
    end;

    // [EventSubscriber(ObjectType::Table, Database::"GKB Work Order", 'OnAfterInsertEvent', '', false, false)]
 
    // local procedure OnAfterInsertWOs(var Rec: Record "GKB Work Order"; RunTrigger: Boolean)
    // var
    // Job: Code[20];
    // JobTask: Code[20];
    // begin
    //    if JobNotExistForWO(Rec) then
    //          CreateJobFromWO(Rec);
    // end;

    local procedure CreateJobTaskLinesFromWOLs(var WOLn: Record "GKB Work Order Lines")
    var
        PlanningLine: Record "Job Planning Line";
    begin
        // WOLn.SetRange(WOLn."Job No.", Job);
        // WOLn.SetRange(WOLn."Work Order No.", JobTask);

        // if WOLn.Find then
        //     repeat
        if WOLn."Line Created" then
            exit;

        // if WOLn."Job No." = '' then
        //     Error('Job No. must be specified for Work Order Line %1', WOLn."Line No.");

        PlanningLine.Init();//Init
        PlanningLine."Line No." := WOLn."Line No.";
        PlanningLine."Job No." := WOLn."Job No.";
        PlanningLine."Job Task No." := WOLn."Work Order No.";
        PlanningLine.Type := WOLn.Type;
        PlanningLine."No." := WOLn.Code;
        PlanningLine.Description := WOLn.Description;
        PlanningLine."Work Type Code" := WOLn.Name;
        PlanningLine.Quantity := WOLn."Estimate Quantity";
        PlanningLine."Unit Price" := WOLn."Unit amount";
        PlanningLine.Insert();//Insert

        WOLn."Line Created" := true;
        WOLn.Modify();
        // until WOLn.Next() = 0;
    end;

    procedure JobNotExistForWO(var WO: Record "GKB Work Order"): Boolean
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

    procedure CreateJobFromWO(WO: Record "GKB Work Order")
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
