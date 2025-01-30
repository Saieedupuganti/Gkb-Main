codeunit 50116 "Req. Worksheet Vendor Update"
{
    
    [EventSubscriber(ObjectType::Table, Database::"Requisition Line", OnAfterInsertEvent, '', false, false)]
    local procedure UpdateVendorNoOnReqLineInsert(var Rec: Record "Requisition Line")
    var
        Item: Record Item;
    begin
        if Rec.Type = Rec.Type::Item then begin
            if Item.Get(Rec."No.") then begin
                Rec."Accept Action Message" := true;
                if Item."Vendor No." <> '' then begin
                    Rec."Vendor No." := Item."Vendor No.";
                    Rec."Vendor Name" := Item."Vendor Item Name";
                    Rec.Modify(false);
                end;
            end;
        end;
    end;

    
    [EventSubscriber(ObjectType::Table, Database::"Requisition Line", 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure UpdateVendorDetailsOnItemChange(var Rec: Record "Requisition Line")
    var
        Item: Record Item;
        Vendor: Record Vendor;
    begin
        if Rec.Type = Rec.Type::Item then begin
            if Item.Get(Rec."No.") then begin
                if Item.Type = Item.Type::Inventory then begin
                    Rec."Vendor No." := Item."Vendor No.";
                    if Vendor.Get(Item."Vendor No.") then
                        Rec."Vendor Name" := Vendor.Name;

                    Rec.Modify(false);
                end
                else begin
                    Rec."Vendor No." := '';
                    Rec."Vendor Name" := '';
                    Rec.Modify(false);
                end;
            end;
        end;
    end;
}
