codeunit 50107 BlanketOrderToInvoice
{
    Subtype = Normal;
    Access = Public;

    procedure CreateInvoiceFromBlanketOrder(BlanketOrderRec: Record "Sales Header")
    var
        SalesOrderHeader: Record "Sales Header";
        SalesOrderLine: Record "Sales Line";
        BlanketOrderLine: Record "Sales Line";
        //SalesHeaderCopyMgt: Codeunit "Sales Inv. Header - Edit";
    begin
        // Validate Sell-to Customer No. in the Blanket Order Header
        if BlanketOrderRec."Sell-to Customer No." = '' then
            Error('Sell-to Customer No. is not specified in the Blanket Order.');

        // Initialize new Sales Order Header
        SalesOrderHeader.Init();
        SalesOrderHeader."Document Type" := SalesOrderHeader."Document Type"::Order;
        SalesOrderHeader.Validate("Sell-to Customer No.", BlanketOrderRec."Sell-to Customer No.");
        SalesOrderHeader."Order Date" := Today;
        SalesOrderHeader.Insert(true);
        Message('Sales Order created: %1', SalesOrderHeader."No.");

        // Copy Lines from Blanket Order to Sales Order
        BlanketOrderLine.SetRange("Document Type", BlanketOrderRec."Document Type");
        BlanketOrderLine.SetRange("Document No.", BlanketOrderRec."No.");
        if BlanketOrderLine.FindSet() then begin
            repeat
                SalesOrderLine.Init();
                SalesOrderLine."Document No." := SalesOrderHeader."No.";
                SalesOrderLine."Line No." := SalesOrderLine."Line No.";
                SalesOrderLine."Document Type" := SalesOrderHeader."Document Type"::Order;

                
                SalesOrderLine.Validate("Sell-to Customer No.", SalesOrderHeader."Sell-to Customer No.");

                // Copy other relevant fields
                SalesOrderLine.Validate("Type", BlanketOrderLine."Type");
                SalesOrderLine.Validate("No.", BlanketOrderLine."No.");
                SalesOrderLine.Validate(Quantity, BlanketOrderLine.Quantity);
                SalesOrderLine.Validate("Unit Price", BlanketOrderLine."Unit Price");
                SalesOrderLine.Insert(true);
            until BlanketOrderLine.Next() = 0;
        end;

        // Automatically Post the Sales Order as Invoice
        PostSalesOrderAsInvoice(SalesOrderHeader);

        Message('Sales Order %1 has been posted as Invoice.', SalesOrderHeader."No.");
    end;

    procedure PostSalesOrderAsInvoice(SalesOrderHeader: Record "Sales Header")
    var
        PostSalesOrder: Codeunit "Sales-Post (Yes/No)";
    begin
        PostSalesOrder.Run(SalesOrderHeader);
    end;
}
