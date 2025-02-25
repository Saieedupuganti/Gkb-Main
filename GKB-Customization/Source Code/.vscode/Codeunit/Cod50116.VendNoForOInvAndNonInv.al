codeunit 50116 "Req. Worksheet Vendor Update"
{
    [EventSubscriber(ObjectType::Table, Database::"Requisition Line", OnAfterInsertEvent, '', false, false)]
    local procedure UpdateVendorNoOnReqLineInsert(var Rec: Record "Requisition Line")
    var
        Item: Record Item;
    begin
        if Rec.Type = Rec.Type::Item then begin
            if Item.Get(Rec."No.") then begin
                if Item.Type = Item.Type::Inventory then begin
                    if Item."Vendor No." <> '' then begin
                        Rec."Vendor No." := Item."Vendor No.";
                        GetAndUpdateVendorName(Rec);
                        Rec.Modify(false);
                    end;
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Requisition Line", 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure UpdateVendorDetailsOnItemChange(var Rec: Record "Requisition Line")
    var
        Item: Record Item;
    begin
        if Rec.Type = Rec.Type::Item then begin
            if Item.Get(Rec."No.") then begin
                if Item.Type = Item.Type::Inventory then begin
                    // For Inventory items, get vendor from Item master
                    Rec."Vendor No." := Item."Vendor No.";
                    GetAndUpdateVendorName(Rec);
                end else begin
                    // For Non-Inventory items, clear vendor fields to allow manual entry
                    Rec."Vendor No." := '';
                    Rec."VendorName" := '';
                end;
            end;
        end;
    end;

    local procedure GetAndUpdateVendorName(var Rec: Record "Requisition Line")
    var
        Vendor: Record Vendor;
    begin
        if Rec."Vendor No." <> '' then begin
            if Vendor.Get(Rec."Vendor No.") then
                Rec."VendorName" := Vendor.Name
            else
                Rec."VendorName" := '';
        end else
            Rec."VendorName" := '';
    end;
}
