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
                field("D365 Product ID"; Rec."D365 Product ID")          //Custom
                {
                    ApplicationArea = all;
                    Caption = 'D365 Product Id';
                }
                field("Vendor 1 Catalogue Number"; Rec."Vendor 1 Catalogue Number")          //custom
                {
                    ApplicationArea = all;
                }
                field("Vendor Id"; Rec."Vendor Id")                   //custom
                {
                    Caption = 'Vendor Id';
                    ApplicationArea = all;
                }
               field(Tradetype; Rec."Trade Type")                         //custom
                {
                    ApplicationArea = all;
                    Caption = 'Trade Type';
                }
                field(SAPITEMID; Rec.SAPITEMID)                  //custom
                {
                    ApplicationArea = all;
                    Caption = 'SAP ITEM ID';
                }
                field(OBSItemName; Rec."OBS Item Name")                    //custom
                {
                    ApplicationArea = all;
                    Caption = 'OBSItemName';
                    Visible = false;
                }
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
                // field(GrossWeight; Rec."Gross Weight")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Gross Weight';
                // }
                // field(Inventor; Rec."Inventory")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Inventory';
                // }
                // field(No; Rec."No.")
                // {
                //     ApplicationArea = all;
                //     Caption = 'No .';
                // }
                
                // field(StandardCost; Rec."Standard Cost")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Standard Cost';
                // }
                
                // field(Types; Rec.Type)
                // {
                //     ApplicationArea = all;
                //     Caption = 'Type';
                // }
                // field(UnitCost; Rec."Unit Cost")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Unit Cost';
                // }
                // field(UnitPrice; Rec."Unit Price")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Unit Price';
                // }
                // field(UnitVolume; Rec."Unit Volume")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Unit Volume';
                // }
                // field(Vendor1CatalogueNumber; Rec."Vendor 1 Catalogue Number")
                // {
                //     ApplicationArea = all;
                //     Caption = 'Vendor 1 Catalogue Number';
                // }

            }
        }

        addafter("Vendor Item No.")
        {

            field("Vendor Item Name"; Rec."Vendor Item Name")
            {
                Caption = 'Vendor Name';
                ApplicationArea = All;
            }
        }
        modify("Vendor Item No.")
        {
            ToolTip = 'SAP Vendor Item No.';
        }
    }
}