codeunit 50106 "Milestone Invoicing"
{
    Subtype = Normal;
    Access = Public;

    procedure CreateInvoiceFromBlanketOrder(BlanketOrderRec: Record "Sales Header")
    var
        SalesInvoiceHeader: Record "Sales Header";
        SalesInvoiceLine: Record "Sales Line";
        LineNo: Integer;
        InvoiceDescription: Text;
    begin
        // Validate required fields
        if BlanketOrderRec."Sell-to Customer No." = '' then
            Error('Sell-to Customer No. is not specified in the Blanket Order.');

        if BlanketOrderRec."Percentage To Invoice" = 0 then
            Error('Percentage To Invoice must be greater than 0.');

        if BlanketOrderRec."Invoicing Amount" = 0 then
            Error('Invoicing Amount must be greater than 0.');

        // Initialize Sales Invoice Header
        SalesInvoiceHeader.Init();
        SalesInvoiceHeader."Document Type" := SalesInvoiceHeader."Document Type"::Invoice;
        SalesInvoiceHeader.Insert(true);

        // Set values for Sales Invoice Header
        SalesInvoiceHeader.Validate("Sell-to Customer No.", BlanketOrderRec."Sell-to Customer No.");
        SalesInvoiceHeader."Order Date" := Today;
        SalesInvoiceHeader."Your Reference" := BlanketOrderRec."No."; // Reference to blanket order
        SalesInvoiceHeader.Modify(true);

        // Set up line number
        LineNo := 10000;

        // Create Invoice Line
        SalesInvoiceLine.Init();
        SalesInvoiceLine."Document Type" := SalesInvoiceHeader."Document Type";
        SalesInvoiceLine."Document No." := SalesInvoiceHeader."No.";
        SalesInvoiceLine."Line No." := LineNo;
        SalesInvoiceLine.Type := SalesInvoiceLine.Type::Item;
        SalesInvoiceLine.Validate("No.", '99999');

        // Create description with percentage and amount
        InvoiceDescription := StrSubstNo('Invoice generated with percent %1% and amount %2',
                                      BlanketOrderRec."Percentage To Invoice",
                                      BlanketOrderRec."Invoicing Amount");

        SalesInvoiceLine.Description := InvoiceDescription;
        SalesInvoiceLine.Validate(Quantity, 1);
        SalesInvoiceLine.Validate("Unit Price", BlanketOrderRec."Invoicing Amount");
        SalesInvoiceLine.Insert(true);

        // // Update the percentages and amounts in the blanket order
        // BlanketOrderRec."Invoiced Percentage" := BlanketOrderRec."Invoiced Percentage" + BlanketOrderRec."Percentage To Invoice";
        // BlanketOrderRec."Amount Invoiced" := BlanketOrderRec."Amount Invoiced" + BlanketOrderRec."Invoicing Amount";

        // // Calculate remaining values
        // BlanketOrderRec."Remaining Percentage" := 100 - BlanketOrderRec."Invoiced Percentage";
        // BlanketOrderRec."Remaining Amount" := CalculateTotalAmount(BlanketOrderRec) - BlanketOrderRec."Amount Invoiced";

        // Clear the percentage to invoice and invoicing amount
        BlanketOrderRec."Percentage To Invoice" := 0;
        BlanketOrderRec."Invoicing Amount" := 0;

        // Save changes to blanket order
        BlanketOrderRec.Modify(true);

        Message('Sales Invoice %1 created successfully.', SalesInvoiceHeader."No.");
    end;

    // procedure PercentUpdate(var Rec: Record "Sales Header")
    // var
    //     TotalAmount: Decimal;
    // begin
    //     if Rec."Document Type" <> Rec."Document Type"::"Blanket Order" then
    //         exit;

    //     // Calculate total amount
    //     TotalAmount := CalculateTotalAmount(Rec);

    //     // Validate percentage doesn't exceed 100%
    //     if (Rec."Invoiced Percentage" + Rec."Percentage To Invoice") > 100 then
    //         Error('Total invoiced percentage cannot exceed 100%%.');

    //     // Calculate invoicing amount based on percentage
    //     Rec."Invoicing Amount" := Round((Rec."Percentage To Invoice" / 100) * TotalAmount, 0.01);

    //     // Update projected values (these will be fully updated after invoice is created)
    //     Rec."Remaining Percentage" := 100 - (Rec."Invoiced Percentage" + Rec."Percentage To Invoice");
    //     Rec."Remaining Amount" := TotalAmount - (Rec."Amount Invoiced" + Rec."Invoicing Amount");

    //     Rec.Modify(true);
    // end;

    local procedure CalculateTotalAmount(SalesHeader: Record "Sales Header"): Decimal
    var
        SalesLine: Record "Sales Line";
        TotalAmount: Decimal;
    begin
        TotalAmount := 0;

        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        if SalesLine.FindSet() then begin
            repeat
                TotalAmount += SalesLine."Amount Including VAT";
            until SalesLine.Next() = 0;
        end;

        exit(TotalAmount);
    end;
}