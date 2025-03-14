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

    [EventSubscriber(ObjectType::Table, Database::"GKB Work Order", 'OnAfterInsertEvent', '', false, false)]

    local procedure OnAfterInsertWOs(var Rec: Record "GKB Work Order"; RunTrigger: Boolean)
    var
        Job: Code[20];
        JobTask: Code[20];
    begin
        if Rec."Job Created" then
            exit;
        if (Rec."Topic" <> '') and
           (Rec."Work Order Type" <> '') and
           (Rec."Work Order No." <> '') and
           (Rec."Service Account" <> '') then begin
            // if JobNotExistForWO(Rec) then
            CreateJobFromWO(Rec);
        end;
    end;

    local procedure CreateJobTaskLinesFromWOLs(var WOLn: Record "GKB Work Order Lines")
    var
        PlanningLine: Record "Job Planning Line";
    begin
        if WOLn."Line Created" then
            exit;

        PlanningLine.Init();//Init
        PlanningLine."Line No." := WOLn."Line No.";
        PlanningLine."Job No." := WOLn."Job No.";
        PlanningLine."Job Task No." := WOLn."Work Order No.";
        case WOLn.Type of
            WOLn.Type::Resource:
                PlanningLine.Type := PlanningLine.Type::Resource;
            WOLn.Type::Item:
                PlanningLine.Type := PlanningLine.Type::Item;
            WOLn.Type::"G/L Account":
                PlanningLine.Type := PlanningLine.Type::"G/L Account";
            else
                exit;
        end;
        PlanningLine."No." := WOLn.Code;
        PlanningLine.Description := WOLn.Description;
        PlanningLine.Quantity := WOLn."Quantity to Build";
        PlanningLine.Validate("Unit Cost", WOLn."Unit Cost");
        PlanningLine.Validate("Unit Price", WOLn."Unit amount");
        PlanningLine."Service Duration" := WOLn."Service Duration";
        PlanningLine."Location Code" := WOLn."Location Code";
        //PlanningLine."Line Type" := PlanningLine."Line Type"::"Both Budget and Billable";      // Have to Create a Description field in both Job Plaing amnd Work Order lines
        PlanningLine.Insert();//Insert

        WOLn."Line Created" := true;
        WOLn.Modify();
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
            JobTask.Validate("Job No.", Job."No.");
            JobTask.Validate("Job Task No.", WO."Work Order No.");
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
        //Job."No." := NoSeriesMgt.GetNextNo('JOB', 0D, true);
        //Job.Description := WO."Service Account" + ' - ' + WO."Work Order Type";
        Job."No." := WO."Work Order No.";
        Job.Description := WO."Topic";
        Job."Service Account" := WO."Service Account";
        Job."Work Order Type" := WO."Work Order Type";
        Job.Validate("Sell-to Customer No.", WO."Service Account");
        Job."Bill-to Customer No." := WO."Service Account";
        case WO."System Status" of
            WO."System Status"::" ":
                Job."System Status" := Job."System Status"::" ";
            WO."System Status"::Unscheduled:
                Job."System Status" := Job."System Status"::Unscheduled;
            WO."System Status"::Scheduled:
                Job."System Status" := Job."System Status"::Scheduled;
            WO."System Status"::"In Progress":
                Job."System Status" := job."System Status"::"In Progress";
            WO."System Status"::Completed:
                Job."System Status" := Job."System Status"::Completed;
            WO."System Status"::Invoiced:
                Job."System Status" := Job."System Status"::Invoiced;
            WO."System Status"::Cancelled:
                Job."System Status" := Job."System Status"::Cancelled;
            else
                exit;
        end;
        Job."Sales Order" := WO."Sales Order";
        Job."Starting Date" := WO."Time Window Start";
        Job."Ending Date" := WO."Time Window End";
        case WO."Billing Type" of
            WO."Billing Type"::" ":
                Job."Billing Type" := Job."Billing Type"::" ";
            WO."Billing Type"::"Charge Up":
                Job."Billing Type" := Job."Billing Type"::"Charge Up";
            WO."Billing Type"::"Quoted":
                Job."Billing Type" := Job."Billing Type"::"Quoted";
            WO."Billing Type"::"Monthly Billing":
                Job."Billing Type" := Job."Billing Type"::"Monthly Billing";
            WO."Billing Type"::"Not Chargeable":
                Job."Billing Type" := Job."Billing Type"::"Not Chargeable";
            WO."Billing Type"::"N/A":
                Job."Billing Type" := Job."Billing Type"::"N/A";
            else
                exit;
        end;
        Job."Customer PO Number" := WO."Customer PO Number";
        Job."Substatus" := WO.Substatus;

        Job.Insert();
        Message('Job card created with no %1', Job."No.");

        // Create Job Task for the new Job
        JobTask.Init();
        JobTask."Job No." := Job."No.";
        JobTask."Job Task No." := WO."Work Order No.";
        JobTask.Validate("Sell-to Customer No.", WO."Service Account");
        JobTask."Bill-to Customer No." := WO."Service Account";
        JobTask.Description := WO."Topic";
        JobTask."Fix Type" := WO."Fix Type";
        JobTask."Functional Location" := WO."Functional Location";
        JobTask."Global Dimension 1 Code" := WO."Shortcut Dimension 1 Code";
        JobTask.Opportunity := WO."Opportunity";
        JobTask."Parent Task No." := WO."Parent Work Order";
        JobTask."Start Date" := WO."Time Window Start";
        JobTask."End Date" := WO."Time Window End";
        JobTask."Work Order Type" := WO."Work Order Type";
        case WO."Billing Type" of
            WO."Billing Type"::" ":
                JobTask."Billing Type" := JobTask."Billing Type"::" ";
            WO."Billing Type"::"Charge Up":
                JobTask."Billing Type" := JobTask."Billing Type"::"Charge Up";
            WO."Billing Type"::"Quoted":
                JobTask."Billing Type" := JobTask."Billing Type"::"Quoted";
            WO."Billing Type"::"Monthly Billing":
                JobTask."Billing Type" := JobTask."Billing Type"::"Monthly Billing";
            WO."Billing Type"::"Not Chargeable":
                JobTask."Billing Type" := JobTask."Billing Type"::"Not Chargeable";
            WO."Billing Type"::"N/A":
                JobTask."Billing Type" := JobTask."Billing Type"::"N/A";
            else
                exit;
        end;
        JobTask."Description 2" := WO."Description 2";
        JobTask.Substatus := WO.Substatus;
        case WO."System Status" of
            WO."System Status"::" ":
                JobTask."System Status" := JobTask."System Status"::" ";
            WO."System Status"::Unscheduled:
                JobTask."System Status" := JobTask."System Status"::Unscheduled;
            WO."System Status"::Scheduled:
                JobTask."System Status" := JobTask."System Status"::Scheduled;
            WO."System Status"::"In Progress":
                JobTask."System Status" := job."System Status"::"In Progress";
            WO."System Status"::Completed:
                JobTask."System Status" := JobTask."System Status"::Completed;
            WO."System Status"::Invoiced:
                JobTask."System Status" := JobTask."System Status"::Invoiced;
            WO."System Status"::Cancelled:
                JobTask."System Status" := JobTask."System Status"::Cancelled;
            else
                exit;
        end;
        // JobTask."Sales Order" := WO."Sales Order";
        JobTask."Customer PO Number" := WO."Customer PO Number";
        JobTask."Work Order Summary" := WO."Work Order Summary";
        JobTask.Insert();

        if WO."Job No." = '' then
            WO.Validate("Job No.", Job."No.");                     //Modified
        WO."Project Task No" := JobTask."Job Task No.";
        WO."Job Created" := true;
        WO.Modify();
    end;


    // Code for when modification occurs.
    [EventSubscriber(ObjectType::Table, Database::"GKB Work Order", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyWO(var Rec: Record "GKB Work Order"; var xRec: Record "GKB Work Order"; RunTrigger: Boolean)
    begin
        if not RunTrigger then
            exit;

        if Rec."Job Created" and (Rec."Job No." <> '') then
            UpdateJobFromWO(Rec, xRec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"GKB Work Order Lines", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyWOLns(var Rec: Record "GKB Work Order Lines"; var xRec: Record "GKB Work Order Lines"; RunTrigger: Boolean)
    begin
        if not RunTrigger then
            exit;

        if Rec."Line Created" and (Rec."Job No." <> '') then
            UpdateJobPlanningLineFromWOLn(Rec, xRec);
    end;

    local procedure UpdateJobFromWO(var WO: Record "GKB Work Order"; var xWO: Record "GKB Work Order")
    var
        Job: Record Job;
        JobTask: Record "Job Task";
    begin
        // Update Job Header
        if not Job.Get(WO."Job No.") then
            exit;

        if WO.topic <> xWO.Topic then
            Job.Description := WO."Topic";

        if WO."Service Account" <> xWO."Service Account" then
            Job.Validate("Sell-to Customer No.", WO."Service Account");

        if WO."System Status" <> xWO."System Status" then
            case WO."System Status" of
                WO."System Status"::" ":
                    Job."System Status" := Job."System Status"::" ";
                WO."System Status"::Unscheduled:
                    Job."System Status" := Job."System Status"::Unscheduled;
                WO."System Status"::Scheduled:
                    Job."System Status" := Job."System Status"::Scheduled;
                WO."System Status"::"In Progress":
                    Job."System Status" := job."System Status"::"In Progress";
                WO."System Status"::Completed:
                    Job."System Status" := Job."System Status"::Completed;
                WO."System Status"::Invoiced:
                    Job."System Status" := Job."System Status"::Invoiced;
                WO."System Status"::Cancelled:
                    Job."System Status" := Job."System Status"::Cancelled;
            end;

        if (WO."Sales Order" <> xWO."Sales Order") then
            Job."Sales Order" := WO."Sales Order";

        if (WO."Time Window Start" <> xWO."Time Window Start") then
            Job."Starting Date" := WO."Time Window Start";

        if (WO."Time Window End" <> xWO."Time Window End") then
            Job."Ending Date" := WO."Time Window End";

        if WO."Billing Type" <> xWO."Billing Type" then
            case WO."Billing Type" of
                WO."Billing Type"::" ":
                    Job."Billing Type" := Job."Billing Type"::" ";
                WO."Billing Type"::"Charge Up":
                    Job."Billing Type" := Job."Billing Type"::"Charge Up";
                WO."Billing Type"::"Quoted":
                    Job."Billing Type" := Job."Billing Type"::"Quoted";
                WO."Billing Type"::"Monthly Billing":
                    Job."Billing Type" := Job."Billing Type"::"Monthly Billing";
                WO."Billing Type"::"Not Chargeable":
                    Job."Billing Type" := Job."Billing Type"::"Not Chargeable";
                WO."Billing Type"::"N/A":
                    Job."Billing Type" := Job."Billing Type"::"N/A";
            end;

        if (WO."Customer PO Number" <> xWO."Customer PO Number") then
            Job."Customer PO Number" := WO."Customer PO Number";

        if (WO.Substatus <> xWO.Substatus) then
            Job."Substatus" := WO.Substatus;

        // Modify the job with updated values
        Job.Modify();

        // Update Job Task
        if not JobTask.Get(WO."Job No.", WO."Work Order No.") then
            exit;

        // Update Job Task fields that may have changed
        if (WO."Topic" <> xWO."Topic") then
            JobTask.Description := WO."Topic";

        if (WO."Service Account" <> xWO."Service Account") then
            JobTask.Validate("Sell-to Customer No.", WO."Service Account");

        if (WO."Fix Type" <> xWO."Fix Type") then
            JobTask."Fix Type" := WO."Fix Type";

        if (WO."Functional Location" <> xWO."Functional Location") then
            JobTask."Functional Location" := WO."Functional Location";

        if (WO."Shortcut Dimension 1 Code" <> xWO."Shortcut Dimension 1 Code") then
            JobTask."Global Dimension 1 Code" := WO."Shortcut Dimension 1 Code";

        if (WO."Opportunity" <> xWO."Opportunity") then
            JobTask.Opportunity := WO."Opportunity";

        if (WO."Parent Work Order" <> xWO."Parent Work Order") then
            JobTask."Parent Task No." := WO."Parent Work Order";

        if (WO."Time Window Start" <> xWO."Time Window Start") then
            JobTask."Start Date" := WO."Time Window Start";

        if (WO."Time Window End" <> xWO."Time Window End") then
            JobTask."End Date" := WO."Time Window End";

        if (WO."Billing Type" <> xWO."Billing Type") then
            case WO."Billing Type" of
                WO."Billing Type"::" ":
                    JobTask."Billing Type" := JobTask."Billing Type"::" ";
                WO."Billing Type"::"Charge Up":
                    JobTask."Billing Type" := JobTask."Billing Type"::"Charge Up";
                WO."Billing Type"::"Quoted":
                    JobTask."Billing Type" := JobTask."Billing Type"::"Quoted";
                WO."Billing Type"::"Monthly Billing":
                    JobTask."Billing Type" := JobTask."Billing Type"::"Monthly Billing";
                WO."Billing Type"::"Not Chargeable":
                    JobTask."Billing Type" := JobTask."Billing Type"::"Not Chargeable";
                WO."Billing Type"::"N/A":
                    JobTask."Billing Type" := JobTask."Billing Type"::"N/A";
            end;

        if (WO."Description 2" <> xWO."Description 2") then
            JobTask."Description 2" := WO."Description 2";

        if (WO.Substatus <> xWO.Substatus) then
            JobTask.Substatus := WO.Substatus;

        if (WO."System Status" <> xWO."System Status") then
            case WO."System Status" of
                WO."System Status"::" ":
                    JobTask."System Status" := JobTask."System Status"::" ";
                WO."System Status"::Unscheduled:
                    JobTask."System Status" := JobTask."System Status"::Unscheduled;
                WO."System Status"::Scheduled:
                    JobTask."System Status" := JobTask."System Status"::Scheduled;
                WO."System Status"::"In Progress":
                    JobTask."System Status" := JobTask."System Status"::"In-Progress";
                WO."System Status"::Completed:
                    JobTask."System Status" := JobTask."System Status"::Completed;
                WO."System Status"::Invoiced:
                    JobTask."System Status" := JobTask."System Status"::Invoiced;
                WO."System Status"::Cancelled:
                    JobTask."System Status" := JobTask."System Status"::Cancelled;
            end;

        if (WO."Customer PO Number" <> xWO."Customer PO Number") then
            JobTask."Customer PO Number" := WO."Customer PO Number";

        if (WO."Work Order Summary" <> xWO."Work Order Summary") then
            JobTask."Work Order Summary" := WO."Work Order Summary";

        // Modify the job task with updated values
        JobTask.Modify();
    end;

    local procedure UpdateJobPlanningLineFromWOLn(var WOLn: Record "GKB Work Order Lines"; var xWOLn: Record "GKB Work Order Lines")
    var
        PlanningLine: Record "Job Planning Line";
    begin
        PlanningLine.Reset();
        PlanningLine.SetRange("Job No.", WOLn."Job No.");
        PlanningLine.SetRange("Job Task No.", WOLn."Work Order No.");
        PlanningLine.SetRange("Line No.", WOLn."Line No.");

        if not PlanningLine.FindFirst() then
            exit;

        if (WOLn.Type <> xWOLn.Type) then
            case WOLn.Type of
                WOLn.Type::Resource:
                    PlanningLine.Type := PlanningLine.Type::Resource;
                WOLn.Type::Item:
                    PlanningLine.Type := PlanningLine.Type::Item;
                WOLn.Type::"G/L Account":
                    PlanningLine.Type := PlanningLine.Type::"G/L Account";
            end;

        if (WOLn.Code <> xWOLn.Code) then
            PlanningLine."No." := WOLn.Code;

        if (WOLn.Description <> xWOLn.Description) then
            PlanningLine.Description := WOLn.Description;

        if (WOLn."Quantity to Build" <> xWOLn."Quantity to Build") then
            PlanningLine.Quantity := WOLn."Quantity to Build";

        if (WOLn."Unit Cost" <> xWOLn."Unit Cost") then
            PlanningLine.Validate("Unit Cost", WOLn."Unit Cost");

        if (WOLn."Unit amount" <> xWOLn."Unit amount") then
            PlanningLine.Validate("Unit Price", WOLn."Unit amount");

        if (WOLn."Location Code" <> xWOLn."Location Code") then
            PlanningLine."Location Code" := WOLn."Location Code";

        // Modify the planning line with updated values
        PlanningLine.Modify();
    end;
}