pageextension 50149 GKBItemExt extends "Item Card"
{
    layout
    {
        modify("Manufacturer Code")
        {
            Caption = 'Manufacturer Name';

        }
        addafter("Manufacturer Code")
        {
            field("Manufacturer Part Name"; Rec."Manufacturer Part Name")
            {
                ApplicationArea = All;
                Caption = 'Manufacturer Part Name';
            }
            field("Manufacturer Part No."; Rec."Manufacturer Part No.")
            {
                ApplicationArea = All;
                Caption = 'Manufacturer Part No.';

            }
        }
        addlast(InventoryGrp)
        {
            field("Item Availability By Location"; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'Item Availability By Location';
                DrillDown = true;
                Editable = false;
                trigger OnDrillDown()
                var
                    ItemAvailabilityPage: Page "Item Availability by Location";
                    ItemFilter: Record Item;
                begin
                    ItemFilter.SetRange("No.", Rec."No.");
                    ItemAvailabilityPage.SetTableView(ItemFilter);
                    ItemAvailabilityPage.Run();
                end;
            }
        }
        addafter(Description)
        {
            field("D365 Item Description"; Rec."D365 Item Description")
            {
                ApplicationArea = All;
                multiline = true;
                Caption = 'OBS Product Description';
            }
            field("Product Type"; Rec."Product Type")
            {
                ApplicationArea = All;
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
                    Caption = 'Item Number';
                }
                field(OBSItemName; Rec."OBS Item Name")                    //custom
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = all;
                    Caption = 'Currency';
                }
                field(Row; Rec.Row)
                {
                    ApplicationArea = all;
                    Caption = 'Row';
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
        addfirst(factboxes)
        {
            part(QRFactbox; "Item QR Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
            }
        }
        addlast("D365 Custom Fields")
        {
            field("OBS Item Name"; Rec."OBS Item Name")
            {
                ApplicationArea = All;
                ToolTip = 'OBS Item Name';
            }
        }
    }
    actions
    {
        addlast(navigation)
        {
            action(UpadateCRM)
            {
                Caption = 'Update To CRM';
                ApplicationArea = All;
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Update this to CRM';

                trigger OnAction()
                var
                    ItemUpadateToCrm: Codeunit "Update to Crm Mngmt";
                begin
                    ItemUpadateToCrm.UpadateItemToCRM(Rec);
                    Message('Record Updated to CRM Successfully');
                end;
            }
        }

        addafter(ApplyTemplate)
        {
            action(CustomerCardBarCode)
            {
                Caption = 'Item QR Code';
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                Image = Report;

                trigger OnAction()
                var
                    RepItemQRCode: Report Item_QRCode;
                begin
                    RepItemQRCode.AssignItemData(Rec."No.", Rec.Description);
                    RepItemQRCode.Run();
                end;
            }
        }

        // Jathin's code starts here
        addafter(ApplyTemplate)
        {
            action("Update Sales Price")
            {
                ApplicationArea = All;
                Caption = 'Update Sales Price', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = UpdateXML;

                trigger OnAction()
                var
                    PriceListHeader_lRec: Record "Price List Header";
                    PriceListLine_lRec: Record "Price List Line";
                    PriceListLine_lRec1: Record "Price List Line";
                    PriceListLine_lRec2: Record "Price List Line";
                    GetUnitPrice: Codeunit "Create Order helper";
                    LineNo: Integer;
                begin
                    PriceListHeader_lRec.Reset();
                    if PriceListHeader_lRec.FindSet() then begin
                        repeat
                            PriceListLine_lRec.Reset();
                            PriceListLine_lRec.SetRange("Price List Code", PriceListHeader_lRec.Code);
                            PriceListLine_lRec.SetRange("Asset Type", PriceListLine_lRec."Asset Type"::Item);
                            PriceListLine_lRec.SetRange("Product No.", Rec."No.");
                            if not PriceListLine_lRec.FindFirst() then begin
                                Clear(LineNo);
                                PriceListLine_lRec1.Reset();
                                PriceListLine_lRec1.SetRange("Price List Code", PriceListHeader_lRec.Code);
                                if PriceListLine_lRec1.FindLast() then
                                    LineNo := PriceListLine_lRec1."Line No." + 10000
                                else
                                    LineNo := 10000;
                                PriceListLine_lRec2.Reset();
                                PriceListLine_lRec2.Init();
                                PriceListLine_lRec2.Validate("Price List Code", PriceListHeader_lRec.Code);
                                PriceListLine_lRec2.Validate("Line No.", LineNo);
                                PriceListLine_lRec2.Insert(true);
                                PriceListLine_lRec2.Validate("Asset Type", PriceListLine_lRec2."Asset Type"::Item);
                                PriceListLine_lRec2.Validate("Product No.", Rec."No.");
                                PriceListLine_lRec2.Validate("Unit Price", GetUnitPrice.GetPercentageValue(PriceListHeader_lRec, Rec));
                                PriceListLine_lRec2.Modify(true);
                            end;
                        until PriceListHeader_lRec.Next() = 0;
                        Message('Price List Updated Successfully');
                    end;
                end;
            }
        }
        // Jathin's code ends here

    }

    trigger OnOpenPage()
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        URL: Text;
        InS: InStream;
        OutS: OutStream;
    begin
        if Rec."No." = '' then
            exit;
        if not Rec.QRCode.HasValue then begin
            URL := 'http://api.qrserver.com/v1/create-qr-code/?data=' + Rec."No." + ' ' + Rec.Description + '&size=200x200';
            if Client.Get(URL, Response) then begin
                if Response.IsSuccessStatusCode() then begin
                    Response.Content.ReadAs(InS);
                    Rec.QRCode.CreateOutStream(OutS);
                    CopyStream(OutS, InS);
                    Rec.Modify();
                end;
            end;
        end;
    end;
}

page 50400 "Item QR Factbox"
{
    PageType = CardPart;
    SourceTable = Item;
    Caption = 'Item QR Code';

    layout
    {
        area(Content)
        {
            field(QRCode; Rec.QRCode)
            {
                ApplicationArea = All;
                ShowCaption = false;
                ToolTip = 'Shows QR code for the item';
            }
        }
    }
}