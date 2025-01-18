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