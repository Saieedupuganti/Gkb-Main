pageextension 50107 "Purchase Order List Ext" extends "Purchase Order List"
{
    layout
    {
        addlast(Control1)
        {
            field("Amount Excl. GST"; PurchHeader."Amount")
            {
                ApplicationArea = All;
                Caption = 'Amount Excl. GST';
                Editable = false; // Make it non-editable for display purposes
            }
        }
    }

    var
        PurchHeader: Record "Purchase Header";

    trigger OnAfterGetRecord()
    begin
        PurchHeader.Get(Rec."Document Type", Rec."No."); // Get the Purchase Header based on Document Type and No.
    end;
}
