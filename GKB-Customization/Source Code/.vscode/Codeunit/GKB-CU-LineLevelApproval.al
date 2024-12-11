// codeunit 50120 "Line Approval Logic"
// {
//     procedure RequestLineApproval(DocumentType: Integer; DocumentNo: Code[20])
//     var
//         LineApproval: Record "Purchase Line";
//     begin
//         LineApproval.SetRange("Document Type", DocumentType);
//         LineApproval.SetRange("Document No.", DocumentNo);
//         LineApproval.SetRange("Approval Status", LineApproval."Approval Status"::Pending);

//         if LineApproval.FindSet() then begin
//             repeat
//                 NotifyApprover(LineApproval."Approver ID", LineApproval."Document No.", LineApproval."Line No.");
//             until LineApproval.Next() = 0;
//         end;
//     end;

//     procedure ApproveLine(DocumentType: Integer; DocumentNo: Code[20]; LineNo: Integer)
//     var
//         LineApproval: Record "Purchase Line";
//     begin
//         if LineApproval.Get(DocumentType, DocumentNo, LineNo) then begin
//             LineApproval."Approval Status" := LineApproval."Approval Status"::Approved;
//             LineApproval.Modify();
//             CheckAllLinesApproved(DocumentType, DocumentNo);
//         end;
//     end;

//     procedure RejectLine(DocumentType: Integer; DocumentNo: Code[20]; LineNo: Integer)
//     var
//         LineApproval: Record "Purchase Line";
//     begin
//         if LineApproval.Get(DocumentType, DocumentNo, LineNo) then begin
//             LineApproval."Approval Status" := LineApproval."Approval Status"::Rejected;
//             LineApproval.Modify();
//         end;
//     end;

//     procedure CheckAllLinesApproved(DocumentType: Integer; DocumentNo: Code[20])
//     var
//         LineApproval: Record "Purchase Line";
//     begin
//         LineApproval.SetRange("Document Type", DocumentType);
//         LineApproval.SetRange("Document No.", DocumentNo);
//         LineApproval.SetRange("Approval Status", LineApproval."Approval Status"::Pending);

//         if not LineApproval.FindFirst() then
//             MarkHeaderApproved(DocumentType, DocumentNo);
//     end;

//     local procedure MarkHeaderApproved(DocumentType: Integer; DocumentNo: Code[20])
//     var
//         PurchaseHeader: Record "Purchase Header";
//     begin
//         if PurchaseHeader.Get(DocumentType, DocumentNo) then begin
//             PurchaseHeader.Status := PurchaseHeader.Status::Released;
//             PurchaseHeader.Modify();
//         end;
//     end;

//     local procedure NotifyApprover(ApproverID: Code[50]; DocumentNo: Code[20]; LineNo: Integer)
//     begin
//         // Logic to notify approver (e.g., sending an email or notification)
//     end;
// }