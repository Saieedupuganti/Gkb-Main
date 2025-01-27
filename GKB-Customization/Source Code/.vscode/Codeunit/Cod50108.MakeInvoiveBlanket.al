codeunit 50108 BlanketOrderToInvoice
{
    Subtype = Normal;
    Access = Public;

    procedure CreateInvoiceFromBlanketOrder(BlanketOrderRec: Record "Sales Header")
    var
        SalesInvoiceHeader: Record "Sales Header";
        SalesInvoiceLine: Record "Sales Line";
        BlanketOrderLine: Record "Sales Line";
    begin
        // Validate Sell-to Customer No. in the Blanket Order Header
        if BlanketOrderRec."Sell-to Customer No." = '' then
            Error('Sell-to Customer No. is not specified in the Blanket Order.');

        // Initialize new Sales Invoice Header
        SalesInvoiceHeader.Init();
        SalesInvoiceHeader."Document Type" := SalesInvoiceHeader."Document Type"::Invoice;
        SalesInvoiceHeader.Validate("Sell-to Customer No.", BlanketOrderRec."Sell-to Customer No.");
        SalesInvoiceHeader."Order Date" := Today;
        SalesInvoiceHeader.Insert(true);
        Message('Sales Invoice created: %1', SalesInvoiceHeader."No.");

        // Copy Lines from Blanket Order to Sales Invoice
        BlanketOrderLine.SetRange("Document Type", BlanketOrderRec."Document Type");
        BlanketOrderLine.SetRange("Document No.", BlanketOrderRec."No.");
        if BlanketOrderLine.FindSet() then begin
            repeat
                SalesInvoiceLine.Init();
                SalesInvoiceLine."Document No." := SalesInvoiceHeader."No.";
                SalesInvoiceLine."Line No." := SalesInvoiceLine."Line No.";
                SalesInvoiceLine."Document Type" := SalesInvoiceHeader."Document Type"::Invoice;

                SalesInvoiceLine.Validate("Sell-to Customer No.", SalesInvoiceHeader."Sell-to Customer No.");

                // Copy other relevant fields
                SalesInvoiceLine.Validate("Type", BlanketOrderLine."Type");
                SalesInvoiceLine.Validate("No.", BlanketOrderLine."No.");
                SalesInvoiceLine.Validate(Quantity, BlanketOrderLine.Quantity);
                SalesInvoiceLine.Validate("Unit Price", BlanketOrderLine."Unit Price");
                SalesInvoiceLine.Insert(true);
            until BlanketOrderLine.Next() = 0;
        end;

        // No automatic posting, just a message confirming creation
        //Message('Sales Invoice %1 has been created but not posted.', SalesInvoiceHeader."No.");
    end;

//  procedure PostSalesOrderAsInvoice(SalesOrderHeader: Record "Sales Header")
//     var
//         PostSalesOrder: Codeunit "Sales-Post (Yes/No)";
//     begin
//         PostSalesOrder.Run(SalesOrderHeader);
//     end;
}