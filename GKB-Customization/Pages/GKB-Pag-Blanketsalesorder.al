pageextension 50101 GKBBlanketSalesOrdereader extends "Blanket Sales Order"
{
    layout
    {
        addafter(Status) // Adds the new field after the 'Status' field
        {
            field("Percentage"; Rec.Percentage)
            {
                ApplicationArea = All;
                Caption = 'Percentage to Update';
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
    }
}