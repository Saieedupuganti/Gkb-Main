namespace GKBCustomization.GKBCustomization;
using Microsoft.Projects.Project.Job;
using Microsoft.Projects.Project.Planning;
using Microsoft.Foundation.NoSeries;

codeunit 50101 "GKB Job Management"
{
    // [EventSubscriber(ObjectType::Table, Database::"GKB Work Order", 'OnAfterInsertEvent', '', false, false)]
    // local procedure OnAfterInsertWO(var Rec: Record "GKB Work Order"; RunTrigger: Boolean)
    // begin
    //     ProcessWorkOrder(Rec);
    // end;

    [EventSubscriber(ObjectType::Table, Database::"GKB Work Order Lines", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertWOLns(var Rec: Record "GKB Work Order lines"; RunTrigger: Boolean)
    begin
        CreateJobTaskLinesFromWOLs(Rec);
    end;
    procedure ProcessWorkOrder(var WO: Record "GKB Work Order")
    begin
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
        Job.SetRange("Service Account", WO."Service Account");
        Job.SetRange("Work Order Type", WO."Work Order Type");

        if not Job.FindFirst() then
            exit(true);
        JobTask.SetRange("Job No.", Job."No.");
        JobTask.SetRange("Job Task No.", WO."Work Order No.");
        if not JobTask.FindFirst() then begin
            JobTask.Init();
            JobTask."Job No." := Job."No.";
            JobTask."Job Task No." := WO."Work Order No.";
            JobTask.Description := WO."Topic";
            JobTask.Insert();

            // Update WO fields from Job and Task
            if WO."Job No." = '' then
                WO."Job No." := Job."No.";
            WO."Project Task No" := JobTask."Job Task No.";
            WO."Job Created" := true;
            WO.Modify();
            Message('Job Task Updated %1 to Job %2', WO."Work Order No.", WO."Job No.");
        end else begin
            // Update existing Job Task
            JobTask.Description := WO."Topic";
            JobTask.Modify();
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
        Job.Insert();
        Message('Job card created with no %1', Job."No.");

        // Check if Job Task already exists
        JobTask.SetRange("Job No.", Job."No.");
        JobTask.SetRange("Job Task No.", WO."Work Order No.");
        if not JobTask.FindFirst() then begin
            // Create Job Task for the new Job
            JobTask.Init();
            JobTask."Job No." := Job."No.";
            JobTask."Job Task No." := WO."Work Order No.";
            JobTask.Description := WO."Topic";
            JobTask.Insert();
        end else begin
            // Update existing Job Task
            JobTask.Description := WO."Topic";
            JobTask.Modify();
        end;

        if WO."Job No." = '' then
            WO."Job No." := Job."No.";
        WO."Project Task No" := JobTask."Job Task No.";
        WO."Job Created" := true;
        WO.Modify();
    end;

    local procedure CreateJobTaskLinesFromWOLs(var WOLn: Record "GKB Work Order Lines")
    var
        PlanningLine: Record "Job Planning Line";
    begin
        if WOLn."Line Created" then
            exit;

        if not PlanningLine.Get(WOLn."Job No.", WOLn."Work Order No.", WOLn."Line No.") then begin
            PlanningLine.Init();
            PlanningLine."Line No." := WOLn."Line No.";
            PlanningLine."Job No." := WOLn."Job No.";
            PlanningLine."Job Task No." := WOLn."Work Order No.";
            PlanningLine."Line Type" := PlanningLine."Line Type"::"Billable";
            PlanningLine.Description := WOLn.Description;
            PlanningLine."Work Type Code" := WOLn.Name;
            PlanningLine.Quantity := WOLn."Estimate Quantity";
            PlanningLine."Unit Price" := WOLn."Unit amount";
            PlanningLine.Insert();
        end;

        WOLn."Line Created" := true;
        WOLn.Modify(false);
    end;
}