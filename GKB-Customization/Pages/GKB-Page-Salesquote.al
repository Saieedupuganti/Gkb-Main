pageextension 50202 "Sales Quote Ext" extends "Sales Quote"
{
  
    actions
    {
        addafter("Archive Document")
        {
            action(ConvertToBlanketOrder)
            {
                Caption = 'Convert to Blanket Sales Order';
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                QuoteToBlanketOrder: Codeunit SalesQteToBlanketOrder;
                begin
                    // Call the procedure to convert Sales Quote to Blanket Sales Order
                    QuoteToBlanketOrder.ConvertQuoteToBlanketOrder(Rec);
                end;
            }
        }
    }
}
