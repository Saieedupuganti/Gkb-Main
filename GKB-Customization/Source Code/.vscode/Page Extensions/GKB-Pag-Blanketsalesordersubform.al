pageextension 50300 GKBBlanketSalesOrder extends "Blanket Sales Order Subform"
{
    layout
    {
        modify(Quantity)
        {
         Editable = Rec."Outstanding Qty. (Base)" = Rec.Quantity;
            trigger OnBeforeValidate()
            begin
                if Rec."Quantity" <> 0 then begin
                    if Rec."Remaining Quantity" = 0 then
                        Rec."Remaining Quantity" := Rec."Quantity";

                end;
            end;
        }
        addafter(Quantity)
        {
            field("Remaining Quantity"; Rec."Remaining Quantity")
            {
                ApplicationArea = All;
                Editable=false;
            }
            field("QuantityShippedtillnow"; Rec."QuantityShippedtillnow")
            {
                ApplicationArea = All;
                Editable=false;
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
                trigger OnAction();
                var
                    Percentage: Decimal;
                begin
                    // Get the percentage from the Sales Header record
                    Percentage := RequestPercentageInput();
                    if Percentage = 0 then
                        Message('Invalid percentage entered. Please try again.')
                    else
                        UpdateQuantityToShipByPercentage(Percentage);
                end;
            }

            // action(MakeOrder)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Make Order';
            //     Image = CreateOrder;
            //     trigger OnAction();
            //     begin
            //         MakeOrderAndUpdateQuantities();
            //     end;
            // }
        }
    
    }

    local procedure RequestPercentageInput(): Decimal
    var
        SalesHeader: Record "Sales Header";
    begin
        // Fetch the corresponding Sales Header based on Document No.
        if SalesHeader.Get(Rec."Document Type", Rec."Document No.") then
            exit(SalesHeader.Percentage) // Return the Percentage from the Sales Header
        else
            Error('Could not find the corresponding Sales Header for this order.');
    end;

    local procedure UpdateQuantityToShipByPercentage(Percentage: Decimal)
    var
        SalesLine: Record "Sales Line";
        NewQuantityToShip: Decimal;
        BaseQuantity: Decimal;
    begin
        if Rec."Document Type" <> Rec."Document Type"::"Blanket Order" then
            Error('This is not a Blanket Order.');

        SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Blanket Order");
        SalesLine.SetRange("Document No.", Rec."Document No.");

        if SalesLine.FindSet(True) then begin
            repeat
                // If it's the first time, use the total quantity; otherwise, use the remaining quantity
                if SalesLine."Remaining Quantity" = 0 then
                    BaseQuantity := SalesLine.Quantity
                else
                    BaseQuantity := SalesLine."Remaining Quantity";

                // Calculate Qty. to Ship based on percentage
                NewQuantityToShip := BaseQuantity * (Percentage / 100);
                SalesLine."Qty. to Ship" := NewQuantityToShip;

                SalesLine.Modify();
            until SalesLine.Next() = 0;

            Message('Quantities updated successfully by %.2f%%.', Percentage);
        end else
            Error('No sales lines found for the specified Blanket Order.');
    end;

    local procedure MakeOrderAndUpdateQuantities()
    var
        SalesLine: Record "Sales Line";
    begin
        if Rec."Document Type" <> Rec."Document Type"::"Blanket Order" then
            Error('This is not a Blanket Order.');

        SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Blanket Order");
        SalesLine.SetRange("Document No.", Rec."Document No.");

        if SalesLine.FindSet(True) then begin
            repeat
                // Subtract Qty to Ship from Remaining Quantity and update the remaining and shipped quantities
                SalesLine."Remaining Quantity" := SalesLine."Remaining Quantity" - SalesLine."Qty. to Ship";
                if SalesLine."Remaining Quantity" < 0 then
                    SalesLine."Remaining Quantity" := 0;

                SalesLine."QuantityShippedtillnow" := SalesLine.Quantity - SalesLine."Remaining Quantity";

                SalesLine.Modify();
            until SalesLine.Next() = 0;

            // Optionally show a message indicating success
            Message('Order created and quantities updated successfully.');
        end else
            Error('No sales lines found for the specified Blanket Order.');
    end;  
}

