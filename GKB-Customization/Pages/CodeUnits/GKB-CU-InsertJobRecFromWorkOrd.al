codeunit 50550 "InsertJobRecordFromWorkOrder"
{
trigger OnRun()
    var
        WO: Record "Work Order"; // Work Order
    begin
        // Filter Work Orders where "Job Created" is false
        WO.SetRange("Job Created", false);
        if WO.IsEmpty then
            exit;

        if WO.FindSet() then
            repeat
                // Check and create Job and Job Task if not already existing
                if JobNotExistForWO(WO) then
                    CreateJobFromWO(WO); // Create Job and Task line
            until WO.Next() = 0;
    end;

    local procedure JobNotExistForWO(var WO: Record "Work Order"): Boolean
    var
        Job: Record Job;
        JobTask: Record "Job Task";
    begin
        // Filter Job records based on "Service Account" and "Work Order Type"
        Job.SetRange("Service Account", WO."Service Account");
        Job.SetRange("Work Order Type", WO."Work Order Type");

        if not Job.FindFirst() then
            exit(true); // No Job exists for this WO, proceed to create one

        // Check if a Job Task exists for the specific Job and Work Order Number
        JobTask.SetRange("Job No.", Job."No.");
        JobTask.SetRange("Job Task No.", JobTask."Job Task No.");
        if not JobTask.FindFirst() then begin
            // No Job Task exists, create one
            JobTask.Init();
            JobTask."Job No." := Job."No.";
            JobTask."Job Task No." := WO."Work Order Number"; // Link Work Order Number
            JobTask.Description := WO."Topic"; // Use Work Order Topic
            JobTask.Insert();

            // Update WO fields from Job and Task
            if WO."Project No" = '' then
                WO."Project No" := Job."No.";
            WO."Project Task No" := JobTask."Job Task No.";
            WO."Job Created" := true;
            WO.Modify();
        end;

        // If Job and Job Task exist, no need to create a new Job
        exit(false);
    end;

    local procedure CreateJobFromWO(WO: Record "Work Order")
    var
        Job: Record Job;
        JobTask: Record "Job Task";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        // Create Job from WO fields if it does not already exist
        Job.Init();
        Job."No." := NoSeriesMgt.GetNextNo('JOB', 0D, true);
        Job.Description := WO."Service Account" + ' - ' + WO."Work Order Type";
        Job."Service Account" := WO."Service Account";
        Job."Work Order Type" := WO."Work Order Type";
        Job.Insert();

        // Create Job Task for the new Job
        JobTask.Init();
        JobTask."Job No." := Job."No.";
        JobTask."Job Task No." := WO."Work Order Number"; // Link Work Order Number
        JobTask.Description := WO."Topic"; // Use Work Order Topic
        JobTask.Insert();

        // Update WO fields with Job and Task information
        if WO."Project No" = '' then
            WO."Project No" := Job."No.";
        WO."Project Task No" := JobTask."Job Task No.";
        WO."Job Created" := true;
        WO.Modify();
    end;

}