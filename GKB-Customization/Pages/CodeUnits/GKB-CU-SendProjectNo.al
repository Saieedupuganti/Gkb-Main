codeunit 50100 "ReqlineToPo"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Req. Wksh.-Make Order", OnInsertPurchOrderLineOnAfterTransferFromReqLineToPurchLine, '', false, false)]
    local procedure OnAfterTransferFromReqLineToPurchaseLine(var PurchOrderLine: Record "Purchase Line"; RequisitionLine: Record "Requisition Line")
    begin
        // Check if the fields exist and populate the Job No. field in the Purchase Line
        if RequisitionLine.projectNo <> '' then
            PurchOrderLine."Job No." := RequisitionLine.projectNo;
        if RequisitionLine."Project Task No" <> '' then
            PurchOrderLine."Job Task No." := RequisitionLine."Project Task No";
    end;


}