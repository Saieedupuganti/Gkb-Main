page 50312 "API Items"
{
    PageType = API;
    Caption = 'API Item';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'Item';
    EntitySetName = 'Item';
    SourceTable = Item;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field(code; Rec."No.")
                {
                    Caption = 'no';
                }
                field("BaseUnitofMeasure"; Rec."Base Unit of Measure")   //lookup
                {
                    Caption = 'Base Unit Of Measure';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Name';
                }
                field("Description2"; Rec."Description 2")
                {
                    Caption = 'Description';
                }
                field("No"; Rec."No.")
                {
                    Caption = 'No';
                }
                field("OBSItemName"; Rec."OBS Item Name")
                {
                    Caption = 'OBS Item Name';
                }
                field("StandardCost"; Rec."Standard Cost")
                {
                    Caption = 'Standard Cost';
                }
                field("TradeType"; Rec."Trade Type")
                {
                    Caption = 'Trade Type';
                }
                field(Type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field("UnitCost"; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field("UnitPrice"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field("Vendor1CatalogueNumber"; Rec."Vendor 1 Catalogue Number")
                {
                    Caption = 'Vendor Catalogue Number';
                }
                field(Currency; Rec.Currency)
                {
                    Caption = 'Currency';
                }
                field("CurrencyId"; Rec."Currency Id")
                {
                    Caption = 'Currency Id';
                }
                field("VendorId"; Rec."Vendor Id")
                {
                    Caption = 'Vendor Id';
                }
                field("CustomVendorId"; Rec."Custom Vendor Id")
                {
                    Caption = 'Custom Vendor Id';
                }
                field("ProductType"; Rec."Product Type")
                {
                    Caption = 'Product Type';
                }
                field("ProductStructure"; Rec."Product Structure")
                {
                    Caption = 'Product Structure';
                }
                field(Status; Rec.Status)
                {
                    Caption = 'Status';
                }
            }
        }
    }
}