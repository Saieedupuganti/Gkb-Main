codeunit 50122 "Requisition Line Handler"
{
    [EventSubscriber(ObjectType::Table, Database::"Requisition Line", 'OnBeforePLInsert', '', false, false)]
    local procedure GetNextLineNo()
    var
        ReqLine: Record "Requisition Line";
        WorkSheetTemplateName: Code[20];
        WorksheetBatchName: Code[20];
        NextLineNo: Integer;
    begin
        ReqLine.SetRange("Worksheet Template Name", WorkSheetTemplateName);
        ReqLine.SetRange("Journal Batch Name", WorksheetBatchName);

        if ReqLine.FindLast() then
            NextLineNo := ReqLine."Line No.";

        NextLineNo += 10000;
    end;
}