codeunit 50122 "Requisition Line Handler"
{
    [EventSubscriber(ObjectType::Table, Database::"Requisition Line", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeInsertRequisitionLine(var Rec: Record "Requisition Line")
    begin
        if (Rec."Line No." = 0) then
            Rec.Validate("Line No.", GetLastLineNo(Rec));
    end;

    local procedure GetLastLineNo(ReqLine: Record "Requisition Line"): Integer
    var
        RequisitionLine: Record "Requisition Line";
        LastLineNo: Integer;
    begin
        RequisitionLine.Reset();
        RequisitionLine.SetCurrentKey("Worksheet Template Name", "Journal Batch Name", "Line No.");
        RequisitionLine.SetRange("Worksheet Template Name", ReqLine."Worksheet Template Name");
        RequisitionLine.SetRange("Journal Batch Name", ReqLine."Journal Batch Name");

        if RequisitionLine.FindLast() then
            LastLineNo := RequisitionLine."Line No." + 10000
        else
            LastLineNo := 10000;

        exit(LastLineNo);
    end;
}
