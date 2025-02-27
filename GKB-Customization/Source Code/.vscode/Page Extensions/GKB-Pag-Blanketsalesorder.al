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
                Visible = false;                 // Remove this field when you see.
            }
            field("Percentage To Invoice"; Rec."Percentage To Invoice")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the percentage of the total amount to be invoiced in the current cycle.';
            }

            field("Invoiced Percentage"; Rec."Invoiced Percentage")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the cumulative percentage of the total amount that has been invoiced.';
                Editable = false;
            }

            field("Remaining Percentage"; Rec."Remaining Percentage")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the percentage of the total amount that remains to be invoiced.';
                Editable = false;
            }

            field("Invoicing Amount"; Rec."Invoicing Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the amount to be invoiced in the current cycle based on the Percentage To Invoice.';
                Editable = false;
            }

            field("Amount Invoiced"; Rec."Amount Invoiced")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the cumulative amount that has been invoiced.';
                Editable = false;
            }

            field("Remaining Amount"; Rec."Remaining Amount")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the amount that remains to be invoiced.';
                Editable = false;
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
                    BlanketOrderToInv: Codeunit "Milestone Invoicing";
                begin
                    BlanketOrderToInv.CreateInvoiceFromBlanketOrder(Rec);
                end;
            }
            action(CreatePercentageInvoice)
            {
                ApplicationArea = All;
                Caption = 'Create Invoice by Percentage';
                ToolTip = 'Creates an invoice based on the specified percentage.';
                Image = NewInvoice;

                trigger OnAction()
                var
                    BlanketOrderToInv: Codeunit "Milestone Invoicing";
                begin
                    BlanketOrderToInv.CreateInvoiceFromBlanketOrder(Rec);
                end;
            }
        }

        // modify(MakeOrder)
        // {
        //     Visible = true;

        //     trigger OnBeforeAction()
        //     begin
        //         MakeOrderAndUpdateQuantities();
        //     end;
        // }
    }

    // local procedure MakeOrderAndUpdateQuantities()
    // var
    //     SalesLine: Record "Sales Line";
    // begin
    //     if Rec."Document Type" <> Rec."Document Type"::"Blanket Order" then
    //         Error('This is not a Blanket Order.');


    //     SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Blanket Order");
    //     SalesLine.SetRange("Document No.", Rec."No.");

    //     if SalesLine.FindSet(True) then begin
    //         repeat

    //             SalesLine."Remaining Quantity" := SalesLine."Remaining Quantity" - SalesLine."Qty. to Ship";
    //             if SalesLine."Remaining Quantity" < 0 then
    //                 SalesLine."Remaining Quantity" := 0;

    //             SalesLine."QuantityShippedtillnow" := SalesLine.Quantity - SalesLine."Remaining Quantity";

    //             SalesLine.Modify();
    //         until SalesLine.Next() = 0;


    //         Message('Order created and quantities updated successfully.');
    //     end else
    //         Error('No sales lines found for the specified Blanket Order.');
    // end;




}
