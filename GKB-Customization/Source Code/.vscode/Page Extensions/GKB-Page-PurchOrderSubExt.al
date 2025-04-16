pageextension 50118 PurchOrderSubExt extends "Purchase Order Subform"
{
    layout
    {
        // modify("No.")
        // {
        //     trigger OnLookup(var Text: Text): Boolean
        //     var
        //         ItemRec: Record Item;
        //         PurchaseHeader: Record "Purchase Header";
        //         ItemListPage: Page "Item List";
        //     begin
        //         if PurchaseHeader.Get(Rec."Document Type", Rec."Document No.") then begin
        //             ItemRec.Reset();
        //             ItemRec.SetRange(Blocked, false);
        //             ItemRec.SetRange(Type, ItemRec.Type::"Non-Inventory");
        //             if ItemRec.FindSet() then
        //                 repeat
        //                     ItemRec.Mark(true);
        //                 until ItemRec.Next() = 0;
        //             ItemRec.SetRange(Type);
        //             if PurchaseHeader."Buy-from Vendor No." <> '' then begin
        //                 ItemRec.SetRange("Vendor No.", PurchaseHeader."Buy-from Vendor No.");
        //                 if ItemRec.FindSet() then
        //                     repeat
        //                         ItemRec.Mark(true);
        //                     until ItemRec.Next() = 0;
        //             end;
        //         end;
        //         ItemRec.MarkedOnly();
        //         ItemListPage.SetTableView(ItemRec);
        //         ItemListPage.LookupMode(true);
        //         if ItemListPage.RunModal = Action::LookupOK then begin
        //             ItemListPage.GetRecord(ItemRec);
        //             Text := ItemRec."No.";
        //             Rec.Validate("No.", ItemRec."No.");
        //             exit(true);
        //         end;
        //         exit(false);
        //     end;
        // }

        modify("No.")
        {
            trigger OnLookup(var Text: Text): Boolean
            var
                FixedAssetRec: Record "Fixed Asset";
                GLAccountRec: Record "G/L Account";
                ResourceRec: Record Resource;
                ItemChargeRec: Record "Item Charge";
                AllocationAccountRec: Record "Allocation Account";
                FixedAssetListPage: Page "Fixed Asset List";
                GLAccountListPage: Page "G/L Account List";
                ResourceListPage: Page "Resource List";
                ItemChargeListPage: Page "Item Charges";
                AllocationAccountListPage: Page "Allocation Account List";
                ItemRec: Record Item;
                ItemList: Page "Item List";
            begin
                case Rec.Type of
                    Rec.Type::"Fixed Asset":
                        begin
                            FixedAssetRec.Reset();
                            FixedAssetRec.SetRange(Blocked, false);

                            FixedAssetListPage.SetTableView(FixedAssetRec);
                            FixedAssetListPage.LookupMode(true);

                            if FixedAssetListPage.RunModal = Action::LookupOK then begin
                                FixedAssetListPage.GetRecord(FixedAssetRec);
                                Text := FixedAssetRec."No.";
                                Rec.Validate("No.", FixedAssetRec."No.");
                                exit(true);
                            end;
                        end;

                    Rec.Type::"G/L Account":
                        begin
                            GLAccountRec.Reset();
                            GLAccountRec.SetRange(Blocked, false);

                            GLAccountListPage.SetTableView(GLAccountRec);
                            GLAccountListPage.LookupMode(true);

                            if GLAccountListPage.RunModal = Action::LookupOK then begin
                                GLAccountListPage.GetRecord(GLAccountRec);
                                Text := GLAccountRec."No.";
                                Rec.Validate("No.", GLAccountRec."No.");
                                exit(true);
                            end;
                        end;

                    Rec.Type::Resource:
                        begin
                            ResourceRec.Reset();
                            ResourceRec.SetRange(Blocked, false);

                            ResourceListPage.SetTableView(ResourceRec);
                            ResourceListPage.LookupMode(true);

                            if ResourceListPage.RunModal = Action::LookupOK then begin
                                ResourceListPage.GetRecord(ResourceRec);
                                Text := ResourceRec."No.";
                                Rec.Validate("No.", ResourceRec."No.");
                                exit(true);
                            end;
                        end;

                    Rec.Type::"Charge (Item)":
                        begin
                            ItemChargeRec.Reset();

                            ItemChargeListPage.SetTableView(ItemChargeRec);
                            ItemChargeListPage.LookupMode(true);

                            if ItemChargeListPage.RunModal = Action::LookupOK then begin
                                ItemChargeListPage.GetRecord(ItemChargeRec);
                                Text := ItemChargeRec."No.";
                                Rec.Validate("No.", ItemChargeRec."No.");
                                exit(true);
                            end;
                        end;
                    Rec.Type::Item:
                        begin
                            ItemRec.Reset();
                            ItemRec.SetRange(Blocked, false);
                            if PurchaseHeader."Buy-from Vendor No." <> '' then begin
                                ItemRec.SetRange("Vendor No.", PurchaseHeader."Buy-from Vendor No.");
                            end;

                            ItemList.SetTableView(ItemRec);
                            ItemList.LookupMode(true);

                            if ItemList.RunModal = Action::LookupOK then begin
                                ItemList.GetRecord(ItemRec);
                                Text := ItemRec."No.";
                                Rec.Validate("No.", ItemRec."No.");
                                exit(true);
                            end;
                        end;
                    Rec.Type::"Allocation Account":
                        begin
                            AllocationAccountRec.Reset();

                            AllocationAccountListPage.SetTableView(AllocationAccountRec);
                            AllocationAccountListPage.LookupMode(true);

                            if AllocationAccountListPage.RunModal = Action::LookupOK then begin
                                AllocationAccountListPage.GetRecord(AllocationAccountRec);
                                Text := AllocationAccountRec."No.";
                                Rec.Validate("No.", AllocationAccountRec."No.");
                                exit(true);
                            end;
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
    var
        PurchaseHeader: Record "Purchase Header";
}
