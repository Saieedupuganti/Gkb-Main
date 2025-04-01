
pageextension 50141 ItemVendCatalog extends "Item Vendor Catalog"
{
    layout
    {
        addafter("Vendor Item No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                Caption = 'Vendor Name';
                ApplicationArea = All;
            }
            field("current cost"; Rec."current cost")
            {
                Caption = 'Unit Cost';
                ApplicationArea = All;
            }
        }
    }
}