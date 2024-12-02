codeunit 50200 "VendorNoforNon-Inven"
{

    [EventSubscriber(ObjectType::Table, Database::"requisition line", 'OnAfterCopyFromItem', '', false, false)]
    local procedure OnAfterCopyFromItemHandler(var RequisitionLine: Record "Requisition Line"; Item: Record Item)
    begin
        if Item.Type = Item.Type::Inventory then begin

            RequisitionLine."Vendor No." := Item."Vendor No.";
        end else begin

            RequisitionLine."Vendor No." := '';
        end;
    end;
}