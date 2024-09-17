using Microsoft.Inventory.Item.Catalog;

pageextension 50141 ItemVendCatalog extends "Item Vendor Catalog"
{
    layout
    {
        addafter("Vendor Item No.")
        {
            field("current cost"; Rec."current cost")
            {
                Caption = 'Current Cost';
                ApplicationArea = All;

            }
            field("Vendor Name"; Rec."Vendor Name")
            {
                Caption = 'Vendor Name';
                ApplicationArea = All;
            }
        }
    }
}