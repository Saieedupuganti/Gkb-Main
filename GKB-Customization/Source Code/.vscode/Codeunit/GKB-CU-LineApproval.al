// codeunit 50109 "Workflow Line Approval Handler"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Management", 'OnApproveWorkflowStepInstance', '', false, false)]
//     local procedure OnApproveWorkflowStepInstance(WorkflowStepInstance: Record "Workflow Step Instance")
//     var
//         ApprovalLogic: Codeunit "Line Approval Logic";
//     begin
//         if WorkflowStepInstance."Table ID" = DATABASE::"Purchase Line" then
//             ApprovalLogic.ApproveLine(WorkflowStepInstance."Table ID", WorkflowStepInstance."Document No.", WorkflowStepInstance."Line No.");
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Management", 'OnRejectWorkflowStepInstance', '', false, false)]
//     local procedure OnRejectWorkflowStepInstance(WorkflowStepInstance: Record "Workflow Step Instance")
//     var
//         ApprovalLogic: Codeunit "Line Approval Logic";
//     begin
//         if WorkflowStepInstance."Table ID" = DATABASE::"Purchase Line" then
//             ApprovalLogic.RejectLine(WorkflowStepInstance."Table ID", WorkflowStepInstance."Document No.", WorkflowStepInstance."Line No.");
//     end;
// }