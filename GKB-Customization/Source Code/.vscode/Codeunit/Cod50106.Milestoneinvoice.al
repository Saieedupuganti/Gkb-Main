codeunit 50106 "Milestone Invoicing"
{
    Subtype = Normal;
    Access = Public;
    procedure CreateInvoiceFromBlanketOrder(var BlanketOrderRec: Record "Sales Header")
    var
        SalesInvoiceHeader: Record "Sales Header";
        SalesInvoiceLine: Record "Sales Line";
        LineNo: Integer;
        InvoiceDescription: Text;
        TotalAmount: Decimal;
        SalesLine: Record "Sales Line";
        CurrentInvoicePercentage: Decimal;
    begin
        if BlanketOrderRec."Sell-to Customer No." = '' then
            Error('Sell-to Customer No. is not specified in the Blanket Order.');

        if BlanketOrderRec."Percentage To Invoice" = 0 then
            Error('Percentage To Invoice must be greater than 0.');

        if BlanketOrderRec."Invoicing Amount" = 0 then
            Error('Invoicing Amount must be greater than 0.');

        if BlanketOrderRec."Shortcut Dimension 1 Code" = '' then
            Error('Shortcut Dimension Code cannot be empty in Blanket Sales Order Header %1', BlanketOrderRec."No.");

        CurrentInvoicePercentage := BlanketOrderRec."Percentage To Invoice";

        SalesInvoiceHeader.Init();
        SalesInvoiceHeader."Document Type" := SalesInvoiceHeader."Document Type"::Invoice;
        SalesInvoiceHeader.Insert(true);

        SalesInvoiceHeader.Validate("Sell-to Customer No.", BlanketOrderRec."Sell-to Customer No.");
        SalesInvoiceHeader."Order Date" := Today;
        SalesInvoiceHeader."Your Reference" := BlanketOrderRec."No.";
        SalesInvoiceHeader."Customer PO Number" := BlanketOrderRec."Customer PO Number";

        // Assign the dimension code AFTER inserting the Sales Invoice Header
        SalesInvoiceHeader.Validate("Shortcut Dimension 1 Code", BlanketOrderRec."Shortcut Dimension 1 Code");
        SalesInvoiceHeader.Modify(true);

        LineNo := 10000;
        SalesInvoiceLine.Init();
        SalesInvoiceLine."Document Type" := SalesInvoiceHeader."Document Type";
        SalesInvoiceLine."Document No." := SalesInvoiceHeader."No.";
        SalesInvoiceLine."Line No." := LineNo;
        SalesInvoiceLine.Type := SalesInvoiceLine.Type::Item;
        SalesInvoiceLine.Validate("No.", '99999');

        InvoiceDescription := StrSubstNo('Invoice generated with percent %1% and amount %2',
                                      BlanketOrderRec."Percentage To Invoice",
                                      BlanketOrderRec."Invoicing Amount");

        SalesInvoiceLine.Description := InvoiceDescription;
        SalesInvoiceLine.Validate(Quantity, 1);
        SalesInvoiceLine.Validate("Unit Price", BlanketOrderRec."Invoicing Amount");
        SalesInvoiceLine.Insert(true);

        TotalAmount := 0;
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", BlanketOrderRec."Document Type");
        SalesLine.SetRange("Document No.", BlanketOrderRec."No.");
        if SalesLine.FindSet() then begin
            repeat
                TotalAmount += SalesLine.Amount;
            until SalesLine.Next() = 0;
        end;

        BlanketOrderRec."Invoiced Percentage" := BlanketOrderRec."Invoiced Percentage" + CurrentInvoicePercentage;
        BlanketOrderRec."Remaining Percentage" := 100 - BlanketOrderRec."Invoiced Percentage";
        BlanketOrderRec."Amount Invoiced" := Round((BlanketOrderRec."Invoiced Percentage" / 100) * TotalAmount, 0.01);
        BlanketOrderRec."Remaining Amount" := Round((BlanketOrderRec."Remaining Percentage" / 100) * TotalAmount, 0.01);

        BlanketOrderRec."Percentage To Invoice" := 0;
        BlanketOrderRec."Invoicing Amount" := 0;

        BlanketOrderRec.Modify(true);

        Message('Sales Invoice %1 created successfully.', SalesInvoiceHeader."No.");
    end;
}
