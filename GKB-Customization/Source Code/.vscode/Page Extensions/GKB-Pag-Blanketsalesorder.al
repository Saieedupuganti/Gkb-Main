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
                Visible = false;
            }
            field("Work Order Type"; Rec."Work Order Type")
            {
                ApplicationArea = All;
                Caption = 'Work Order Type';
            }
            field("Customer PO Number"; Rec."Customer PO Number")
            {
                ApplicationArea = All;
                Caption = 'Customer PO Number';
            }
            field("Billing Type"; Rec."Billing Type")
            {
                ApplicationArea = All;
                Caption = 'Billing Type';
            }
            field(Quote; Rec.Quote)
            {
                ApplicationArea = All;
                Caption = 'Quote';
            }
            field("CRM ID"; Rec."CRM ID")
            {
                ApplicationArea = All;
                Caption = 'CRM ID';
            }
            field("Sales Name"; Rec."Sales Name")
            {
                ApplicationArea = All;
                Caption = 'Name';
            }
        }
        addafter(General)
        {
            group("Milestone Details")
            {
                field("Percentage To Invoice"; Rec."Percentage To Invoice")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the % of the total amount to be invoiced in the current cycle.';
                }

                field("Invoiced Percentage"; Rec."Invoiced Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the cumulative % of the total amount that has been invoiced.';
                    Editable = false;
                }

                field("Remaining Percentage"; Rec."Remaining Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the % of the total amount that remains to be invoiced.';
                    Editable = false;
                }

                field("Invoicing Amount"; Rec."Invoicing Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount to be invoiced in the current cycle based on the % To Invoice.';
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
        }
        modify(MakeOrder)
        {
            trigger OnBeforeAction()
            var
                BlanketSalesOrderLine: Record "Sales Line";
            begin
                BlanketSalesOrderLine.SetRange("Document Type", BlanketSalesOrderLine."Document Type"::"Blanket Order");
                BlanketSalesOrderLine.SetRange("Document No.", Rec."No.");

                if BlanketSalesOrderLine.FindSet() then
                    repeat
                        if BlanketSalesOrderLine."Shortcut Dimension 1 Code" = '' then
                            Error('Shortcut Dimension Code cannot be empty in Blanket Sales Order Line %1', BlanketSalesOrderLine."Line No.");
                    until BlanketSalesOrderLine.Next() = 0;
            end;
        }
    }

}
