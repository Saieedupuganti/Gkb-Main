tableextension 50103 GKBItemExt extends Item
{
    fields
    {
        field(50099; "D365 Product ID"; Code[30])
        {
            Caption = 'D365 Product ID';
            DataClassification = ToBeClassified;
        }
        field(50098; "Vendor 1 Catalogue Number"; Text[100])
        {
            Caption = 'Vendor 1 Catalogue Number';
            DataClassification = ToBeClassified;
        }
        field(50097; "Trade Type"; Option)
        {
            Caption = 'Trade Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Service Engineer Dual Trade,First-Year Apprentice,Second-Year Apprenctice,Third-Year Apprenctice,Fourth-Year Apprenctice';
            OptionMembers = "Service Engineer Dual Trade","First-Year Apprentice","Second-Year Apprenctice","Third-Year Apprenctice","Fourth-Year Apprenctice";
        }
        field(50100; "OBS Item Name"; Text[100])
        {
            Caption = 'OBS Item Name';
            DataClassification = ToBeClassified;
        }
        field(50101; "Vendor Item Name"; Text[100])
        {
            Caption = 'Vendor Item Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No." = FIELD("Vendor No.")));
        }
        field(50111; VendorName; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No." = FIELD("Vendor No.")));
        }
        field(50103; QrCode; Blob)
        {
            Caption = 'Qr Code';
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }
        field(50104; SAPITEMID; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50106; Currency; Code[30])              //lookup
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(50107; "Posting Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Sample1;Sample";
            OptionCaption = 'Sample1,Sample2';
        }
        field(50108; "Vendor Id"; Text[100])   //lookup
        {
            DataClassification = ToBeClassified;
            // TableRelation = Vendor."Dimension ID" WHERE("No." = FIELD("Vendor Id"));
            trigger OnLookup()
            var
                vendor: Record Vendor;
            begin
                vendor.Reset();
                if page.RunModal(page::"Vendor Card", vendor) = Action::LookupOK then
                    "Vendor Id" := vendor."Dimension ID";
            end;
        }
        field(50109; "Product Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ;1;2;3;4";
            OptionCaption = ' ,Sales Inventory,Miscellaneous Charges,Services,Flat Fees';
        }
        field(50110; "Product Structure"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Sample1;Sample";
            OptionCaption = 'Sample1,Sample2';
        }
        field(50102; Status; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Currency Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Custom Vendor Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "Base Unit Of Measure Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50301; "Unit"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(50509; "Vendor Id CRM"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    trigger OnAfterModify()
    var
        Client: HttpClient;
        RequestContent: HttpContent;
        ContentHeaders: HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
        JObject: JsonObject;
        ResponseJObject: JsonObject;
        JsonText: Text;
        TokenValue: JsonToken;
        TokenString: Text;
        uomRec: Record "Unit of Measure";
        unitcrmid: Text;
        unitgroupcrmid: Text;
        vendorRec: Record Vendor;
        vendorid: Text;
        fieldservicetype: Text;
        producttype: Text;
        tradetype: Text;
    begin
        // Initialize request content and headers
        RequestContent.WriteFrom('');
        RequestContent.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');

        Client.DefaultRequestHeaders.Add('Accept', 'application/json');

        Clear(vendorid);
        Clear(unitcrmid);
        Clear(unitgroupcrmid);
        fieldservicetype := Format(Rec.Type);
        producttype := Format(Rec."Product Type");

        if Rec."Vendor No." <> '' then begin
            if vendorRec.Get(Rec."Vendor No.") then
                if vendorRec."CRM ID" <> '' then
                    vendorid := '/accounts(' + vendorRec."CRM ID" + ')';
        end;

        if Rec."Base Unit of Measure" <> '' then begin
            if uomRec.Get(Rec."Base Unit of Measure") then begin
                if uomRec."CRM ID" <> '' then
                    unitcrmid := '/uoms(' + uomRec."CRM ID" + ')';
                if uomRec."Unitgroup CRM ID" <> '' then
                    unitgroupcrmid := '/uomschedules(' + uomRec."Unitgroup CRM ID" + ')';
            end;
        end;

        case fieldservicetype of
            Format(Rec.Type::Inventory):
                fieldservicetype := '690970000';
            Format(Rec.Type::"Non-Inventory"):
                fieldservicetype := '690970001';
            Format(Rec.Type::Service):
                fieldservicetype := '690970002';
            else
                fieldservicetype := '';
        end;

        case tradetype of
            'Service Engineer Dual Trade':
                tradetype := '888880000';
            'First-Year Apprentice':
                tradetype := '888880001';
            'Second-Year Apprenctice':
                tradetype := '888880002';
            'Third-Year Apprenctice':
                tradetype := '888880003';
            'Fourth-Year Apprenctice':
                tradetype := '888880004';
            else
                tradetype := '888880000';
        end;

        Clear(JObject);
        JObject.Add('bcid', Rec."No.");
        JObject.Add('crmid', Rec."CRM ID");
        JObject.Add('defaultunitid', unitcrmid);
        JObject.Add('defaultunitgroupid', unitgroupcrmid);
        JObject.Add('currencyid', Rec."Currency Id");
        JObject.Add('name', Rec.Description);
        JObject.Add('description', Rec.Description);
        JObject.Add('internalproductname', Rec."OBS Item Name");
        JObject.Add('postinggroup', Rec."Posting Group");
        JObject.Add('standardcost', Rec."Standard Cost");
        JObject.Add('tradetype', tradetype);
        JObject.Add('type', fieldservicetype);
        JObject.Add('currentcost', Rec."Unit Cost");
        JObject.Add('vendorcatalogueno', Rec."Vendor 1 Catalogue Number");
        JObject.Add('vendorid', vendorid);

        if (Format(Rec."Product Type") <> '') and (Format(Rec."Product Type") <> '0') then begin
            if Format(Rec."Product Type") = ' ' then
                JObject.Add('producttype', '1')
            else
                JObject.Add('producttype', Format(Rec."Product Type"));
        end else
            JObject.Add('producttype', '1');

        JObject.WriteTo(JsonText);
        RequestContent.WriteFrom(JsonText);

        IsSuccessful := Client.Post('https://prod-28.australiasoutheast.logic.azure.com:443/workflows/7b639aebf03d48b589cb0cb4e242a43e/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=CBcPia0oWMebjYN00WLYwLb4Xr-lnSEztYIePQITywc', RequestContent, Response);

        if IsSuccessful then begin
            Response.Content().ReadAs(ResponseText);
            if ResponseJObject.ReadFrom(ResponseText) then begin
                if ResponseJObject.Contains('crmid') then begin
                    ResponseJObject.Get('crmid', TokenValue);
                    TokenString := TokenValue.AsValue().AsText();
                    Rec."CRM ID" := CopyStr(TokenString, 1, 100);
                    Rec.Modify(false);
                end;
            end;
        end;
    end;

  
}