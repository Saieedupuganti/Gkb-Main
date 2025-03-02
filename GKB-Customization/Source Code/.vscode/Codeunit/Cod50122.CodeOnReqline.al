codeunit 50122 "Requisition Line Handler"
{
    // Code to Check Alternate Vendor for Item
    [EventSubscriber(ObjectType::Table, Database::"Requisition Line", 'OnAfterInsertEvent', '', false, false)]
    local procedure CheckAlternateVendorsOnAfterInsertPurchaseLine(var Rec: Record "Requisition Line")
    begin
        if Rec.Type = Rec.Type::Item then
            SetAlternateVendorField(Rec);
    end;

    local procedure SetAlternateVendorField(var ReqLine: Record "Requisition Line")
    var
        ItemVendor: Record "Item Vendor";
        VendorCount: Integer;
    begin
        if ReqLine."No." = '' then
            exit;

        ItemVendor.Reset();
        ItemVendor.SetRange("Item No.", ReqLine."No.");
        VendorCount := ItemVendor.Count;

        if VendorCount > 1 then begin
            ReqLine."Alternate Vendor For Item" := true;
            ReqLine.Modify();
        end;
    end;

    // Auto incerement Line No. in Requisition Line while inserting the record from the other system.
    // Line line no will be incremented only manually inserted records in BC.
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

    [EventSubscriber(ObjectType::Table, Database::"Requisition Line", 'OnAfterValidateEvent', 'Location Code', false, false)]
    local procedure UpdateItemAvailabilityOnLocationChange(var Rec: Record "Requisition Line"; var xRec: Record "Requisition Line")
    begin
        if Rec.Type = Rec.Type::Item then
            UpdateItemAvailabilityByLocation(Rec);
    end;

    local procedure UpdateItemAvailabilityByLocation(var ReqLine: Record "Requisition Line")
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalQuantity: Decimal;
    begin
        if (ReqLine."No." = '') or (ReqLine."Location Code" = '') then
            exit;
        TotalQuantity := 0;
        ItemLedgerEntry.SetFilter("Item No.", ReqLine."No.");
        ItemLedgerEntry.SetFilter("Location Code", ReqLine."Location Code");
        Message('item availability checking');
        if ItemLedgerEntry.FindSet() then
            repeat
                TotalQuantity += ItemLedgerEntry.Quantity;
            until ItemLedgerEntry.Next() = 0;
        Message('Item Availability By Location %1', TotalQuantity);
        ReqLine."Item Availability By Location" := TotalQuantity;

        ReqLine.Modify();
    end;
}
