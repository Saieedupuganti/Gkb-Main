pageextension 50149 GKBItemExt extends "Item Card"
{
    layout
    {
        addafter("Attached Documents")
        {
            part(qrcode; "Qr Code")
            {
                ApplicationArea = all;
                // Caption = 'Qr Code';
                SubPageLink = "No." = field("No.");
            }
        }
        addafter(Item)
        {
            group("D365 Custom Fields")
            {
                field("OBS Item Name"; Rec."OBS Item Name")
                {
                    Caption = 'OBS Item Name';
                    ApplicationArea = All;
                }
                field("D365 Product ID"; Rec."D365 Product ID")
                {
                    ApplicationArea = all;
                    Caption = 'D365 Product Id';
                }
                field("Vendor 1 Catalogue Number"; Rec."Vendor 1 Catalogue Number")
                {
                    ApplicationArea = all;
                }
                field("Trade Type"; Rec."Trade Type")
                {
                    ApplicationArea = all;
                }
                field(SAPITEMID; Rec.SAPITEMID)
                {
                    ApplicationArea = all;
                    Caption = 'SAP ITEM ID';
                }
<<<<<<< HEAD
                field(BaseUnitofMeasure; Rec."Base Unit of Measure")
                {
                    ApplicationArea = all;
                    Caption = 'Base Unit of Measure';
                }
                field(D365ProductID; Rec."D365 Product ID")
                {
                    ApplicationArea = all;
                    Caption = 'D365 Product Id';
                    Visible = false;
                }
                field(Description1; Rec."Description")
                {
                    ApplicationArea = all;
                    Caption = 'Description';
                }
                field(Description2; Rec."Description 2")
                {
                    ApplicationArea = all;
                    Caption = 'Description 2';
                }
                field(GrossWeight; Rec."Gross Weight")
=======
                // field(BaseUnitofMeasure;Rec."Base Unit of Measure")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Base Unit of Measure';
                //     Visible=false;
                // }
                // field(Description1;Rec."Description")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Description';
                //     Visible=false;
                // }
                field(GrossWeight;Rec."Gross Weight")
>>>>>>> 3517c8b09945ebf0ebb25efff9553e31aaf9dbf0
                {
                    ApplicationArea = all;
                    Caption = 'Gross Weight';
                }
                field(Inventor; Rec."Inventory")
                {
                    ApplicationArea = all;
                    Caption = 'Inventory';
                }
                field(No; Rec."No.")
                {
                    ApplicationArea = all;
                    Caption = 'No .';
                }
                field(OBSItemName; Rec."OBS Item Name")
                {
                    ApplicationArea = all;
                    Caption = 'OBSItemName';
                    Visible=false;
                }
                field(StandardCost; Rec."Standard Cost")
                {
                    ApplicationArea = all;
                    Caption = 'Standard Cost';
                }
                field(Tradetype; Rec."Trade Type")
                {
                    ApplicationArea = all;
                    Caption = 'Trade Type';
                }
                field(Types; Rec.Type)
                {
                    ApplicationArea = all;
                    Caption = 'Type';
                }
                field(UnitCost; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    Caption = 'Unit Cost';
                }
                field(UnitPrice; Rec."Unit Price")
                {
                    ApplicationArea = all;
                    Caption = 'Unit Price';
                }
                field(UnitVolume; Rec."Unit Volume")
                {
                    ApplicationArea = all;
                    Caption = 'Unit Volume';
                }
                field(Vendor1CatalogueNumber; Rec."Vendor 1 Catalogue Number")
                {
                    ApplicationArea = all;
                    Caption = 'Vendor 1 Catalogue Number';
                }

            }
        }

        addafter("Vendor Item No.")
        {
            field("Vendor Item Name"; Rec."Vendor Item Name")
            {
                Caption = 'Vendor Item Name';
                ApplicationArea = All;
            }
        }
    }
}