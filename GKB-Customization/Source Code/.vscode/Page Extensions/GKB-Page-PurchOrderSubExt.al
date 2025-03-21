pageextension 50118 PurchOrderSubExt extends "Purchase Order Subform"
{
    layout
    {
        modify("No.")
        {
            trigger OnLookup(var Text: Text): Boolean
            var
                ItemRec: Record Item;
                ItemListPage: Page "Item List";
                PurchaseHeader: Record "Purchase Header";
            begin
                if PurchaseHeader.Get(Rec."Document Type", Rec."Document No.") then begin
                    ItemRec.Reset();
                    ItemRec.SetRange(Blocked, false);
                    if PurchaseHeader."Buy-from Vendor No." <> '' then begin
                        ItemRec.SetRange("Vendor No.", PurchaseHeader."Buy-from Vendor No.");
                    end;

                    ItemListPage.SetTableView(ItemRec);
                    ItemListPage.LookupMode(true);
                    if ItemListPage.RunModal = Action::LookupOK then begin
                        ItemListPage.GetRecord(ItemRec);
                        Text := ItemRec."No.";
                        Rec.Validate("No.", ItemRec."No.");
                        exit(true);
                    end;
                end;
                exit(false);
            end;
        }
        modify("Job Task No.")
        {
            Visible = false;
        }
        addlast(Control1)
        {
            field(VendorCatalogueNo; Rec.VendorCatalogueNo)
            {
                Caption = 'Vendor Catologue No';
                ApplicationArea = all;
            }
        }
    }
}