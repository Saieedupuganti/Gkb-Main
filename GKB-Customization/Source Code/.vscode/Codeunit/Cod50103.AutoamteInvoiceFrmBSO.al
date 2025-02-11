codeunit 50103 "AutomateInvoiceFrmBSO"
{
    Subtype = Normal;
    Access = Public;

    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
        EarlierPstngDt: Date;
    begin
        EarlierPstngDt := CalcDate('3D', Today);

        //SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Blanket Order");
        SalesHeader.SetRange("Document Type", 4);
        //SalesHeader.SetRange("No.", '1009'); 
        SalesHeader.SetRange("Posting Date", EarlierPstngDt);
        SalesHeader.SetRange(Status,SalesHeader.Status::Open);
       
        if SalesHeader.FindSet() then
            repeat
                CreateInvoiceFromBlnktOrderBsdOnPstngDt(SalesHeader);
            until SalesHeader.Next() = 0;
        Error('there is nothing to process');
    end;

    local procedure CreateInvoiceFromBlnktOrderBsdOnPstngDt(BlnktSalesHeader: Record "Sales Header")
    var
        BlanketOrderLine: Record "Sales Line";
        SaleInvHeader: Record "Sales Header";
        SaleInvLine: Record "Sales Line";
        LineNo: Integer;
    begin
        if BlnktSalesHeader."Sell-to Customer No." = '' then
            Error('Customer No. is not specified in the Blanket Order %1', BlnktSalesHeader."No.");

        SaleInvHeader.Init();
        SaleInvHeader."Document Type" := SaleInvHeader."Document Type"::Invoice;
        SaleInvHeader.Validate("Sell-to Customer No.", BlnktSalesHeader."Sell-to Customer No.");
        SaleInvHeader."Order Date" := Today;
        SaleInvHeader."Posting Date" := BlnktSalesHeader."Posting Date";
        SaleInvHeader."Document Date" := Today;
        SaleInvHeader.Insert(true);

        BlanketOrderLine.SetRange("Document Type", BlnktSalesHeader."Document Type");
        BlanketOrderLine.SetRange("Document No.", BlnktSalesHeader."No.");

        if BlanketOrderLine.FindSet() then begin
            repeat
                if BlanketOrderLine.Quantity > 0 then begin
                    SaleInvLine.Init();
                    SaleInvLine."Document Type" := SaleInvHeader."Document Type"::Invoice;
                    SaleInvLine."Document No." := SaleInvHeader."No.";
                    SaleInvLine.Validate("Sell-to Customer No.", SaleInvHeader."Sell-to Customer No.");
                    SaleInvLine.Validate(Type, BlanketOrderLine.Type);
                    SaleInvLine.Validate("No.", BlanketOrderLine."No.");
                    SaleInvLine.Validate(Quantity, BlanketOrderLine.Quantity);
                    SaleInvLine.Validate("Unit Price", BlanketOrderLine."Unit Price");
                    SaleInvLine."Blanket Order No." := BlnktSalesHeader."No.";
                    SaleInvLine."Blanket Order Line No." := BlanketOrderLine."Line No.";

                    SaleInvLine.Insert(true);
                end;
            until BlanketOrderLine.Next() = 0;
        end;

        Message('Sales Invoice %1 created from Blanket Order %2', SaleInvHeader."No.", BlnktSalesHeader."No.");
    end;
}