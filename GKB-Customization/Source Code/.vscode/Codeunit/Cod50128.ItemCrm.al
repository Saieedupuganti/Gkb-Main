codeunit 50128 "Update to Crm Mngmt"
{
    procedure UpadateItemToCRM(Item: Record Item)
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
        RequestContent.WriteFrom('');
        RequestContent.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');

        Client.DefaultRequestHeaders.Add('Accept', 'application/json');

        Clear(vendorid);
        Clear(unitcrmid);
        Clear(unitgroupcrmid);
        fieldservicetype := Format(Item.Type);
        producttype := Format(Item."Product Type");

        if Item."Vendor No." <> '' then begin
            if vendorRec.Get(Item."Vendor No.") then
                if vendorRec."CRM ID" <> '' then
                    vendorid := '/accounts(' + vendorRec."CRM ID" + ')';
        end;

        if Item."Base Unit of Measure" <> '' then begin
            if uomRec.Get(Item."Base Unit of Measure") then begin
                if uomRec."CRM ID" <> '' then
                    unitcrmid := '/uoms(' + uomRec."CRM ID" + ')';
                if uomRec."Unitgroup CRM ID" <> '' then
                    unitgroupcrmid := '/uomschedules(' + uomRec."Unitgroup CRM ID" + ')';
            end;
        end;

        case fieldservicetype of
            Format(Item.Type::Inventory):
                fieldservicetype := '690970000';
            Format(Item.Type::"Non-Inventory"):
                fieldservicetype := '690970001';
            Format(Item.Type::Service):
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
        JObject.Add('bcid', Item."No.");
        JObject.Add('crmid', Item."CRM ID");
        JObject.Add('defaultunitid', unitcrmid);
        JObject.Add('d365productid', Item."D365 Product Id");
        JObject.Add('defaultunitgroupid', unitgroupcrmid);
        JObject.Add('currencyid', Item."Currency Id");
        JObject.Add('description', Item.Description);
        JObject.Add('customerproductname', Item."OBS Item Name");
        JObject.Add('postinggroup', Item."Posting Group");
        JObject.Add('standardcost', Item."Standard Cost");
        JObject.Add('tradetype', tradetype);
        JObject.Add('type', fieldservicetype);
        JObject.Add('currentcost', Item."Unit Cost");
        JObject.Add('vendorcatalogueno', Item."Vendor 1 Catalogue Number");
        JObject.Add('vendorid', vendorid);
        JObject.Add('obsproductdescription', Item."D365 Item Description");
        JObject.Add('sapitemnumber', Item.SAPITEMID);

        if (Format(Item."Product Type") <> '') and (Format(Item."Product Type") <> '0') then begin
            if Format(Item."Product Type") = ' ' then
                JObject.Add('producttype', '1')
            else
                JObject.Add('producttype', Format(Item."Product Type"));
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
                    Item."CRM ID" := CopyStr(TokenString, 1, 100);
                    Item.Modify(false);
                end;

                if ResponseJObject.Contains('d365productid') then begin
                    ResponseJObject.Get('d365productid', TokenValue);
                    TokenString := TokenValue.AsValue().AsText();
                    Item."D365 Product Id" := CopyStr(TokenString, 1, 100);
                    Item.Modify(false);
                end;

                if ResponseJObject.Contains('sapitemnumber') then begin
                    ResponseJObject.Get('sapitemnumber', TokenValue);
                    TokenString := TokenValue.AsValue().AsText();
                    Item."SAPITEMID" := CopyStr(TokenString, 1, 100);
                    Item.Modify(false);
                end;

            end;
        end;
    end;
}