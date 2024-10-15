pageextension 50300 GKBBlanketSalesOrder extends "Blanket Sales Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
           field("Remaining Quantity";Rec."Remaining Quantity")
           {
                ApplicationArea = All;
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
                Image = Approve; // Changed to a valid image
                trigger OnAction();
                var
                    Percentage: Decimal;
                begin
                    // Get the percentage from the Sales Header record
                    Percentage := RequestPercentageInput();
                    if Percentage <> 0 then
                        UpdateQuantityToShipByPercentage(Percentage);
                end;
            }
        }
    }

    local procedure RequestPercentageInput(): Decimal
    var
        SalesHeader: Record "Sales Header"; // Declare the Sales Header record
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
    begin
        // Ensure we are working with the current Blanket Order
        if Rec."Document Type" <> Rec."Document Type"::"Blanket Order" then
            Error('This is not a Blanket Order.');

        // Find associated Sales Lines
        SalesLine.SetRange("Document Type", SalesLine."Document Type"::"Blanket Order");
        SalesLine.SetRange("Document No.", Rec."Document No.");


        if SalesLine.FindSet() then begin
            repeat
                // Calculate the new Quantity to Ship
                NewQuantityToShip := SalesLine."Quantity" * (Percentage / 100);

                // Update the Quantity to Ship
                SalesLine."Qty. to Ship" := NewQuantityToShip;
                SalesLine.Modify();
            until SalesLine.Next() = 0;

            // Optionally, show a message indicating completion
            Message('Quantities updated successfully by %.2f%%.', Percentage);
        end else
            Error('No sales lines found for the specified Blanket Order.');
    end;
}