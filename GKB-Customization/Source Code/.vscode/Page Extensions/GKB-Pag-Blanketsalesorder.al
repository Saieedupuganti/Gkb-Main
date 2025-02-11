pageextension 50101 GKBBlanketSalesOrdereader extends "Blanket Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field("Percentage"; Rec.Percentage)
            {
                ApplicationArea = All;
                Caption = 'Percentage to Update';
            }
        }
        addafter("Order Date")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addafter("Archi&ve Document")
        {
            action("Create Invoice")
            {
                Caption = 'Make Invoice';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = CreateDocument;

                trigger OnAction()
                var
                    BlanketToInvoice: Codeunit BlanketOrderToInvoice;
                begin
                    BlanketToInvoice.CreateInvoiceFromBlanketOrder(Rec);
                end;
            }
        }

        modify(MakeOrder)
        {
            Visible = true;

            trigger OnBeforeAction()
            begin
                MakeOrderAndUpdateQuantities();
                // RestrictModifyQtyAfterAction()

            end;
        }
    }

    local procedure MakeOrderAndUpdateQuantities()
    var
        SalesLine: Record "Sales Line";
    begin
        if Rec."Document Type" <> Rec."Document Type"::"Blanket Order" then
            Error('This is not a Blanket Order.');


        SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Blanket Order");
        SalesLine.SetRange("Document No.", Rec."No.");

        if SalesLine.FindSet(True) then begin
            repeat

                SalesLine."Remaining Quantity" := SalesLine."Remaining Quantity" - SalesLine."Qty. to Ship";
                if SalesLine."Remaining Quantity" < 0 then
                    SalesLine."Remaining Quantity" := 0;

                SalesLine."QuantityShippedtillnow" := SalesLine.Quantity - SalesLine."Remaining Quantity";

                SalesLine.Modify();
            until SalesLine.Next() = 0;


            Message('Order created and quantities updated successfully.');
        end else
            Error('No sales lines found for the specified Blanket Order.');
    end;
    // local procedure RestrictModifyQtyAfterAction()
    // var 
    // SalesLine : Record "Sales Line";
    // begin
    //     SalesLine.SalesOrderCreated := true;
    //     SalesLine.modify(true);
    // end;

}
