codeunit 50112 "ReqlineToPo"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Req. Wksh.-Make Order", OnInsertPurchOrderLineOnAfterTransferFromReqLineToPurchLine, '', false, false)]
    local procedure OnAfterTransferFromReqLineToPurchaseLine(var PurchOrderLine: Record "Purchase Line"; RequisitionLine: Record "Requisition Line")
    var
    Purchorder : Record "Purchase Header";
    begin
        if PurchOrderLine."Document Type" = PurchOrderLine."Document Type"::Order then begin
            if RequisitionLine."Shortcut Dimension 1 Code" <> '' then
                PurchOrderLine.Validate("Shortcut Dimension 1 Code", RequisitionLine."Shortcut Dimension 1 Code");

            if RequisitionLine.projectNo <> '' then
                PurchOrderLine."Job No." := RequisitionLine.projectNo;

            if RequisitionLine."Project Task No" <> '' then
                PurchOrderLine."Job Task No." := RequisitionLine."Project Task No";

            
        end;
    end;
}