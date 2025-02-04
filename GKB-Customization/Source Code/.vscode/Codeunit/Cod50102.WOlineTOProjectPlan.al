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
}
