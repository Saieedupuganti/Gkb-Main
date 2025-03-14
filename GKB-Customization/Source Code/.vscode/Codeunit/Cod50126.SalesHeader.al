codeunit 50126 "Sales Order Posting"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterModifyEvent', '', false, false)]
    local procedure UpdateGSTonSalesLines(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    Var
        SalesLine: Record "Sales Line";
    begin
        if (rec."GST Prod Posting Group" <> '') or (rec."GST Prod Posting Group" <> xRec."GST Prod Posting Group") then
            SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        if SalesLine.FindSet() then
            repeat
                SalesLine.Validate("VAT Prod. Posting Group", Rec."GST Prod Posting Group");
                SalesLine.Modify();
            until SalesLine.Next() = 0;
    end;
}