codeunit 50126 "Sales Order Posting"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterModifyEvent', '', false, false)]
    local procedure UpdateGSTonSalesLines(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        // Check if the document is an Order and is in Open status
        if (Rec."Document Type" = Rec."Document Type"::Order) and
           (Rec.Status = Rec.Status::Open) and

           ((Rec."GST Prod Posting Group" <> '') or (Rec."GST Prod Posting Group" <> xRec."GST Prod Posting Group")) then begin
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."No.");

            if SalesLine.FindSet() then
                repeat
                    SalesLine.Validate("Gen. Prod. Posting Group", Rec."GST Prod Posting Group");
                    SalesLine.Modify(true);
                until SalesLine.Next() = 0;
        end;
    end;
}