namespace GKBCustomization.GKBCustomization;

using Microsoft.Projects.Project.Job;
using Microsoft.Projects.Project.Planning;
using Microsoft.Foundation.NoSeries;

codeunit 50101 "GKB Work Order Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"GKB Work Order Lines", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertWOLns(var Rec: Record "GKB Work Order lines"; RunTrigger: Boolean)
    begin
        CreateJobTaskLinesFromWOLs(Rec);
    end;

    // local procedure CreateJobTaskFromWO(var WO: Record "GKB Work Order")
    // var
    //     Job: Record Job;
    //     JobTask: Record "Job Task";
    //     NoSeriesMgt: Codeunit "No. Series";
    //     JobNo: Code[20];
    // begin
    //     if WO."Job No." = '' then begin
    //         Job.Init();
    //         Job."No." := NoSeriesMgt.GetNextNo('JOB', 0D, true);
    //         Job.Description := WO."Service Account" + ' - ' + WO."Work Order Type";
    //         Job."Service Account" := WO."Service Account";
    //         Job."Work Order Type" := WO."Work Order Type";
    //         Job.Insert();
    //         JobNo := Job."No.";
    //     end else
    //         JobNo := WO."Job No.";

    //     // Create Job Task for the new Job
    //     JobTask.Init();
    //     JobTask."Job No." := JobNo;
    //     JobTask."Job Task No." := WO."Work Order No.";
    //     JobTask.Description := WO."Topic";
    //     JobTask.Insert();

    //     //Update WO fields with Job and Job task information
    //     WO."Job No." := JobNo;
    //     WO."Project Task No" := JobTask."Job Task No.";
    // end;

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
            PlanningLine.Type := WOLn.Type;
            PlanningLine."No." := WOLn.Code;
            PlanningLine.Description := WOLn.Description;
            PlanningLine."Work Type Code" := WOLn.Name;
            PlanningLine.Quantity := WOLn."Estimate Quantity";
            PlanningLine."Unit Price" := WOLn."Unit amount";
            PlanningLine.Insert();
        end;

        WOLn."Line Created" := true;
    end;
}
