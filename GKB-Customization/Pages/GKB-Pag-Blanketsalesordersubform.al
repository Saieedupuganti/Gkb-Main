pageextension 50300 GKBBlanketSalesOrder extends "Blanket Sales Order Subform"
{
    layout
    {
        modify(Quantity)
        {
            trigger OnBeforeValidate()
            begin
                // Set Remaining Quantity equal to Quantity if Quantity is updated
                if Rec."Quantity" <> 0 then begin
                    Rec."Remaining Quantity" := Rec."Quantity";
                end else begin
                    Rec."Remaining Quantity" := 0; // Reset Remaining Quantity if Quantity is 0
                end;
            end;
        }

        addafter(Quantity)
        {
            field("Remaining Quantity"; Rec."Remaining Quantity")
            {
                ApplicationArea = All;
            }

            field("QuantityShipped"; Rec."Quantity Shipped")
            {
                ApplicationArea = All;
                Caption = 'Quantity Shipped';
            }

            
        }
    }

    actions
    {
        addlast(processing)
        {
            action(UpdateQuantities)
            {
                ApplicationArea = All;
                Caption = 'Update Quantities';
                Image = Approve;

                trigger OnAction()
                begin
                    UpdateQuantities();
                end;
            }
        }
    }

    local procedure UpdateQuantities()
    var
        QuantityToShip: Decimal;
    begin
        // Validate if Qty. to Ship is entered
        if Rec."Qty. to Ship" <= 0 then begin
            Message('Please enter a valid quantity to ship.');
            exit;
        end;

        // Ensure that the Remaining Quantity is sufficient for the Qty. to Ship
        if Rec."Remaining Quantity" < Rec."Qty. to Ship" then begin
            Error('The quantity to ship exceeds the remaining quantity.');
        end;

        // Update Remaining Quantity by subtracting Qty. to Ship
        Rec."Remaining Quantity" := Rec."Remaining Quantity" - Rec."Qty. to Ship";

        // Update Quantity Shipped by adding Qty. to Ship
        Rec."Quantity Shipped" := Rec."Quantity Shipped" + Rec."Qty. to Ship";

        // Reset Qty. to Ship after updating
        Rec."Qty. to Ship" := 0;

        Rec.Modify();
        Message('Quantities updated successfully. Remaining Quantity: %1, Quantity Shipped: %2', Rec."Remaining Quantity", Rec."Quantity Shipped");
    end;
}
