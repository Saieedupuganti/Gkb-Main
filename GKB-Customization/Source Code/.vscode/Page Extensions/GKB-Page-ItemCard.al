pageextension 50149 GKBItemExt extends "Item Card"
{
    layout
    {
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
                    Caption = 'Sap Item Id';
                }
                field(OBSItemName; Rec."OBS Item Name")                    //custom
                {
                    ApplicationArea = all;
                    Caption = 'OBS ItemName';
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
        addfirst(factboxes)
        {
            part(QRFactbox; "Item QR Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
    actions
    {
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
                    ItemQRCode: Report Item_QRCode;
                begin
                    //ItemQRCode.AssignBarcodeURL(Rec."No.", Rec.Description, GetUrl(ClientType::Current, CompanyName, ObjectType::Page, Page::"Customer Card", Rec));
                    ItemQRCode.Run();
                end;
            }
        }
    }
    // var
    //     GenerateQR: Label 'Generate QR Code';

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