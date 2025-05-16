
codeunit 50132 "Purchase Order Field Transfer"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchRcptHeaderInsert', '', false, false)]
    local procedure OnAfterPurchRcptHeaderInsert(var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchaseHeader: Record "Purchase Header"; CommitIsSupressed: Boolean; PreviewMode: Boolean)
    begin
        if PurchaseHeader."Ordered By" <> '' then
            PurchRcptHeader.Validate("Ordered By", PurchaseHeader."Ordered By");
        if PurchaseHeader."Created By" <> '' then
            PurchRcptHeader.Validate("Created By", PurchaseHeader."Created By");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchInvHeaderInsert', '', false, false)]
    local procedure OnAfterPurchInvHeaderInsert(var PurchInvHeader: Record "Purch. Inv. Header"; var PurchHeader: Record "Purchase Header"; PreviewMode: Boolean)
    begin
        if PurchHeader."Ordered By" <> '' then
            PurchInvHeader.Validate("Ordered By", PurchHeader."Ordered By");
        if PurchHeader."Created By" <> '' then
            PurchInvHeader.Validate("Created By", PurchHeader."Created By");
    end;
}