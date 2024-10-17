codeunit 50106 SalesQteToBlanketOrder
{
    Subtype = Normal;
    Access = Public;

    procedure ConvertQuoteToBlanketOrder(SalesQuoteRec: Record "Sales Header")
    var
        BlanketOrderHeader: Record "Sales Header";
        BlanketOrderLine: Record "Sales Line";
        SalesQuoteLine: Record "Sales Line";
    begin
        // Check if the Sales Quote has a Sell-to Customer No.
        if SalesQuoteRec."Sell-to Customer No." = '' then
            Error('Sell-to Customer No. is not specified on the Sales Quote.');

        // Initialize new Blanket Sales Order Header
        //Message('Starting the process of converting Sales Quote to Blanket Order.');

        BlanketOrderHeader.Init();
        BlanketOrderHeader."Document Type" := BlanketOrderHeader."Document Type"::"Blanket Order";
        BlanketOrderHeader.Validate("Sell-to Customer No.", SalesQuoteRec."Sell-to Customer No.");
        BlanketOrderHeader."Order Date" := SalesQuoteRec."Document Date";
        BlanketOrderHeader.Insert(true); // Insert the new Blanket Sales Order
        Message('Blanket Order Header created: %1', BlanketOrderHeader."No.");

        // Copy Sales Quote Lines to Blanket Sales Order Lines
        SalesQuoteLine.SetRange("Document Type", SalesQuoteRec."Document Type"::Quote);
        SalesQuoteLine.SetRange("Document No.", SalesQuoteRec."No.");

        if SalesQuoteLine.FindSet() then begin
            Message('Processing Sales Quote Lines...');
            repeat
                BlanketOrderLine.Init();
                BlanketOrderLine."Document No." := BlanketOrderHeader."No.";
                BlanketOrderLine."Document Type" := BlanketOrderHeader."Document Type"::"Blanket Order";
                BlanketOrderLine."Line No." := SalesQuoteLine."Line No.";

                // Ensure the Sell-to Customer No. is inherited for the line
                BlanketOrderLine.Validate("Sell-to Customer No.", BlanketOrderHeader."Sell-to Customer No.");

                BlanketOrderLine.Validate("Type", SalesQuoteLine."Type");
                BlanketOrderLine.Validate("No.", SalesQuoteLine."No.");
                BlanketOrderLine.Validate(Quantity, SalesQuoteLine.Quantity);
                BlanketOrderLine.Validate("Unit Price", SalesQuoteLine."Unit Price");

                // Insert the Blanket Sales Order Line
                BlanketOrderLine.Insert(true);
            until SalesQuoteLine.Next() = 0;
            Message('Blanket Sales Order created successfully: %1', BlanketOrderHeader."No.");
        end else
            Message('No lines found for the Sales Quote.');

        // Optionally update the status of Sales Quote or take other actions
        SalesQuoteRec.Status := SalesQuoteRec.Status::Open;
        SalesQuoteRec.Modify();
    end;
}
