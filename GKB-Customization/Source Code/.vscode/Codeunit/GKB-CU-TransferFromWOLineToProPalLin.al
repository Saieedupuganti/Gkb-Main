codeunit 50123 "TransferFrmWOLinesToProjPlines"
{
    trigger OnRun()
    begin
        SendDataFromWOLineToProjPlanLines();
    end;
    local procedure SendDataFromWOLineToProjPlanLines();
    var
    WOLine : Record "Work Order Lines";
    //WOLine: Record "Work Order"; // Replace with your table name
    ProjectPlanningLine: Record "Job Planning Line"; // Replace with your target table name
    NextLineNo: Integer;

begin
    WOLine.RESET;
    WOLine.SETRANGE("Work Order No.",ProjectPlanningLine."Job Task No."); // Optional filter
    WOLine.SETRANGE("Project Code",ProjectPlanningLine."Job No.");
    // Iterate through the source records
    IF WOLine.FINDSET THEN BEGIN
        REPEAT
            NextLineNo := GetNextLineNo(WOLine."Project Code", WOLine."Project Task Code");

            // Initialize the target record
            ProjectPlanningLine.INIT;
            ProjectPlanningLine."Line No." := NextLineNo; // Assign new Line No.

            // Map fields from the source table to the target table
            ProjectPlanningLine."Description" := WOLine."Description"; // Example field
            ProjectPlanningLine."Quantity" := WOLine."Estimate Quantity";       // Example field
            ProjectPlanningLine."Unit Price" := WOLine."Unit Cost";   // Example field

            // Validate fields if needed
            ProjectPlanningLine.VALIDATE("Quantity");
            ProjectPlanningLine.VALIDATE("Unit Price");

            // Insert the new record
            ProjectPlanningLine.INSERT;

        UNTIL WOLine.NEXT = 0;
    END;
end;

// Function to get the next Line No. for a specific Job No. and Job Task No.
procedure GetNextLineNo(JobNo: Code[20]; JobTaskNo: Code[20]): Integer;
var
    PlanningLine: Record "Job Planning Line";
begin
    PlanningLine.RESET;
    PlanningLine.SETRANGE("Job No.", JobNo);
    PlanningLine.SETRANGE("Job Task No.", JobTaskNo);
    IF PlanningLine.FINDLAST THEN
        EXIT(PlanningLine."Line No." + 10) // Increment by 10000, adjust as per your requirement
    ELSE
        EXIT(10); // Start from 10000 if no lines exist
end;
}