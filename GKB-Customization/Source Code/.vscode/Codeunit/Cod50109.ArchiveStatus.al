codeunit 50109 "Archive Status"
{
    [EventSubscriber(ObjectType::Table, database::"Purchase Header", 'OnBeforeDeleteEvent', '', false, false)]
    local procedure OnBeforeDeletePurchaseHeader(Rec: Record "Purchase Header")
    var
        PurchOrderArchive: Record "Purchase Header Archive";
        PurchlineArchive: Record "Purchase Line Archive";
        PurchLine: Record "Purchase Line";
    begin
        PurchOrderArchive.Init();  
        PurchOrderArchive."Document Type" := PurchOrderArchive."Document Type"::Order;
        PurchOrderArchive.Validate("Buy-from Vendor No.", rec."Buy-from Vendor No.");
        PurchOrderArchive."Document Date" := rec."Document Date";
        PurchOrderArchive."Document Type" := Rec."Document Type";
        PurchOrderArchive."No." := Rec."No.";
        PurchOrderArchive."Entry Type" := 'Deleted';

        PurchOrderArchive.Insert(true);
        Message('Purchase Archive Created: %1', PurchOrderArchive."No.");

        Purchline.SetRange("Document Type", rec."Document Type"::Order);
        Purchline.SetRange("Document No.", Rec."No.");

        if PurchLine.FindSet() then begin
            Message('Processing Purchase Lines...');
            repeat
                PurchlineArchive.init();
                PurchlineArchive."Document No." := PurchOrderArchive."No.";
                PurchlineArchive."Document Type" := PurchOrderArchive."Document Type"::Order;
                PurchlineArchive."Line No." := PurchLine."Line No.";

                PurchlineArchive.Validate("Buy-from Vendor No.", PurchOrderArchive."Buy-from Vendor No.");
                PurchlineArchive.Validate(Type, PurchLine.Type);
                PurchlineArchive.Validate("No.", PurchLine."No.");
                PurchlineArchive.Validate(Quantity, PurchLine.Quantity);
                PurchlineArchive.Validate("Unit Cost", PurchLine."Unit Cost");

                PurchlineArchive.Insert(true);
            until PurchLine.Next() = 0;
            Message('Purchase order deleted successfully: %1', PurchOrderArchive."No.");
        end else
            Message('No Lines found for the Purchaae Line');

        Rec.Status := rec.Status::Open;
        REC.Modify(true);
    end;
}
