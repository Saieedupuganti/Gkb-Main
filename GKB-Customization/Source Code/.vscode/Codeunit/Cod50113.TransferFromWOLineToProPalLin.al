codeunit 50113 "TransferFrmWOLinesToProjPlines"
{
//     trigger OnRun()
//     begin
//         SendDataFromWOLineToProjPlanLines();
//     end;
//     local procedure SendDataFromWOLineToProjPlanLines();
//     var
//     WOLine : Record "Work Order Lines";
//     ProjectPlanningLine: Record "Job Planning Line"; 
//     NextLineNo: Integer;

// begin
//     WOLine.RESET;
//     WOLine.SETRANGE("Project Code",ProjectPlanningLine."Job No.");
//     WOLine.SETRANGE("Project Task Code",ProjectPlanningLine."Job Task No.");
//     // Iterate through the source records
//     IF WOLine.FINDSET THEN BEGIN
//         REPEAT
//             NextLineNo := GetNextLineNo(WOLine."Project Code", WOLine."Project Task Code");

//             ProjectPlanningLine.INIT;
//             ProjectPlanningLine."Line No." := NextLineNo; 
//             ProjectPlanningLine."Description" := WOLine."Description"; 
//             ProjectPlanningLine.VALIDATE("Quantity",WOLine."Estimate Quantity");
//             ProjectPlanningLine.VALIDATE("Unit Price",WOLine."Unit Cost");  

//             ProjectPlanningLine.INSERT(true);

//         UNTIL WOLine.NEXT = 0;
//     END;
// end;

// procedure GetNextLineNo(JobNo: Code[20]; JobTaskNo: Code[20]): Integer;
// var
//     PlanningLine: Record "Job Planning Line";
// begin
//     PlanningLine.RESET;
//     PlanningLine.SETRANGE("Job No.", JobNo);
//     PlanningLine.SETRANGE("Job Task No.", JobTaskNo);
//     IF PlanningLine.FINDLAST THEN
//         EXIT(PlanningLine."Line No." + 10) 
//     ELSE
//         EXIT(10); 
// end;
}