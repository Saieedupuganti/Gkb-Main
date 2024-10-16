pageextension 50202 MyPageExt extends "Sales Quote"
{
    actions
    {
        addafter("Archive Document")
        {
            action(ConvertToBlanketOrder)
            {
                ApplicationArea = All;
                Caption = 'Convert to Blanket Order';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    BlanketOrder: Record "Sales Header";
                    SalesLine: Record "Sales Line";
                    SalesQuote: Record "Sales Header";
                    NewSalesLine: Record "Sales Line";
                begin
                    if Confirm('Are you sure you want to convert this Sales Quote to a Blanket Order?') then begin
                        // Check if Sales Quote number is valid
                        if Rec."No." = '' then begin
                            Message('No. is empty, cannot retrieve Sales Quote.');
                            exit;
                        end;

                        // Get the current Sales Quote
                        if not SalesQuote.Get(Rec."No.") then begin
                            Message('Sales Quote %1 does not exist.', Rec."No.");
                            exit;
                        end;

                        // Create a new Blanket Order
                        BlanketOrder.Init();
                        BlanketOrder."Document Type" := BlanketOrder."Document Type"::"Blanket Order"; // Ensure correct enumeration
                        BlanketOrder."Sell-to Customer No." := SalesQuote."Sell-to Customer No.";
                        BlanketOrder."Order Date" := Today();
                        BlanketOrder."Due Date" := Today() + 30;
                        BlanketOrder.Insert(true); // Insert the blanket order

                        // Copy lines from the Sales Quote to the Blanket Order
                        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Quote);
                        SalesLine.SetRange("Document No.", SalesQuote."No.");
                        if SalesLine.FindSet() then begin
                            repeat
                                SalesLine.Copy(NewSalesLine);
                                NewSalesLine."Document Type" := BlanketOrder."Document Type";
                                NewSalesLine."Document No." := BlanketOrder."No.";
                                NewSalesLine.Insert();
                            until SalesLine.Next() = 0;
                        end;

                        // Open the new Blanket Order page
                        Page.Run(Page::"Blanket Sales Order", BlanketOrder);
                        Message('Blanket Order %1 created from Quote %2', BlanketOrder."No.", SalesQuote."No.");
                    end;
                end;
            }
        }
    }
}
