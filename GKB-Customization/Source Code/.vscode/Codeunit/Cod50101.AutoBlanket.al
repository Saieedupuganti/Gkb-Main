codeunit 50101 "Auto Blanket Sales Posting"
{
    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
        RelatedSalesOrder: Record "Sales Header";
        SalesPost: Codeunit "Sales-Post";
    begin
        Message('1');
        SalesHeader.SetFilter("External Document No.", 'BLNKT-*');

        If SalesHeader.FindSet() then begin
            Message('2');
            repeat
                if IsSalesOrderFullyShipped(SalesHeader."No.") then begin
                    Message(SalesHeader."No.");
                    SalesHeader.Invoice := true;
                    SalesPost.Run(SalesHeader);
                end;
            until SalesHeader.Next() = 0
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Blnkt Sales Ord. to Ord. (Y/N)", 'OnAfterCreateSalesOrder', '', false, false)]
    local procedure OnAfterCreateSalesOrder(var SalesHeader: Record "Sales Header"; var SkipMessage: Boolean)
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        if SalesLine.FindFirst() then begin
            if SalesLine."Blanket Order No." <> '' then begin
                SalesHeader."External Document No." := 'BLNKT-' + SalesLine."Blanket Order No.";
                SalesHeader.Modify();
            end;
        end;
    end;

    local procedure IsSalesOrderFullyShipped(SalesOrderNo: Code[20]): Boolean
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Document No.", SalesOrderNo);

        if SalesLine.FindSet() then begin
            repeat
                if SalesLine."Quantity Shipped" < SalesLine.Quantity then
                    exit(false);
            until SalesLine.Next() = 0;
        end;

        exit(true);
    end;
}