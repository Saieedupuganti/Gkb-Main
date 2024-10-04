codeunit 50105 "Archive Status"
{
    [EventSubscriber(ObjectType::Table, database::"Purchase Header", 'OnBeforeDeleteEvent', '', false, false)]
    local procedure OnBeforeDeletePurchaseHeader(var Rec: Record "Purchase Header")
    var
        PurchOrderArchive: Record "Purchase Header Archive";
    begin
        PurchOrderArchive.Init();
        PurchOrderArchive."Document Type" := Rec."Document Type";
        PurchOrderArchive."No." := Rec."No.";
        PurchOrderArchive."Entry Type" := 'Deleted'; 

        PurchOrderArchive.Insert();
    end;
}
