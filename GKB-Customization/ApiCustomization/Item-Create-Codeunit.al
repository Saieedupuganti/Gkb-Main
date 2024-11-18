tableextension 50210 "Item Creation Power Automate" extends Item
{
    fields
    {

    }


    var
        myInt: Integer;

    trigger OnAfterDelete()
    var
        HttpClient: HttpClient;
        HttpContent: HttpContent;
        Response: HttpResponseMessage;
        JsonObject: JsonObject;
        JsonField: Text;
        ContentType: Text;
        PowerAutomateURL: Text;
        ContentHeaders: HttpHeaders;
        ResponseText: Text;
        RequestHeaders: HttpHeaders;
    begin
        HttpContent.GetHeaders(ContentHeaders);


        if not ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Add('Content-Type', 'application/json');

        if not ContentHeaders.Contains('Content-Encoding') then
            ContentHeaders.Add('Content-Encoding', 'UTF8');

        HttpContent.GetHeaders(RequestHeaders);
        RequestHeaders.Add('Accept', 'application/json');
        RequestHeaders.Add('Accept-Encoding', 'utf-8');
        RequestHeaders.Add('Connection', 'Keep-alive');

        PowerAutomateURL := 'https://prod-28.australiasoutheast.logic.azure.com:443/workflows/7b639aebf03d48b589cb0cb4e242a43e/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=CBcPia0oWMebjYN00WLYwLb4Xr-lnSEztYIePQITywc';

        JsonObject.Add('no', Rec."No.");
        JsonObject.Add('description', Description);
        JsonObject.Add('unitprice', "Unit Price");

        JsonObject.WriteTo(JsonField);
        Message(Format(JsonObject));
        Message(JsonField);
        HttpContent.WriteFrom(JsonField);
        // Message(HttpContent);
        ContentType := 'application/json';

        // Send the HTTP POST request
        if HttpClient.Post(PowerAutomateURL, HttpContent, Response) then begin
            Response.Content().ReadAs(ResponseText);
            Message(ResponseText);
        end else begin
            Message('Error');
        end;
    end;

    trigger OnAfterModify()
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
        json: JsonObject;
        responsejson: JsonObject;
        jsontext: Text;
        tokenvalue: JsonToken;
        tokenstring: Text;
        uomRec:Record "Unit of Measure";
        unitcrmid:Text;
        unitgroupcrmid:Text;
        vendorRec:Record Vendor;
        vendorid:Text;
    begin
        Content.GetHeaders(ContentHeaders);

        if not ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Add('Content-Type', 'application/json');

        if not ContentHeaders.Contains('Content-Encoding') then
            ContentHeaders.Add('Content-Encoding', 'UTF8');

        // assume that the json parameter contains the following data
        // json.Add('defaultunit', Rec."Base Unit of Measure");
        vendorid:='';
        unitcrmid:='';
        unitgroupcrmid:='';
        vendorRec.SetFilter("No.",Rec."Vendor No.");
        if vendorRec.FindFirst() then begin
            vendorid:=vendorRec."CRM ID";
        end;
        uomRec.SetFilter(Code,Rec."Base Unit of Measure");
        if uomRec.FindFirst() then begin
            unitcrmid:=uomRec."CRM ID";
            unitgroupcrmid:=uomRec."Unitgroup CRM ID";
        end;
        json.Add('bcid', Rec."No.");
        json.Add('crmid', Rec."CRM ID");
        json.Add('defaultunitid', unitcrmid);
        json.Add('defaultunitgroupid', unitgroupcrmid);
        json.Add('currencyid', Rec."Currency Id");
        json.Add('name', Rec.Description);
        json.Add('description', Rec.Description);
        json.Add('sapno', Rec."No.");
        json.Add('internalproductname', Rec."OBS Item Name");
        json.Add('postinggroup', Rec."Posting Group");
        json.Add('standardcost', Rec."Standard Cost");
        json.Add('tradetype', Rec."Trade Type");
        json.Add('type', Format(Rec.Type));
        json.Add('currentcost', Rec."Unit Cost");
        json.Add('vendorcatalogueno', Rec."Vendor 1 Catalogue Number");
        json.Add('vendorid', vendorid);
        json.Add('producttype', Rec."Product Type");
        // json.Add('purchasename', Rec."Purchasing Code");
        json.WriteTo(jsontext);
        Content.WriteFrom(jsontext);
        Message(jsontext);

        IsSuccessful := Client.Post('https://prod-28.australiasoutheast.logic.azure.com:443/workflows/7b639aebf03d48b589cb0cb4e242a43e/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=CBcPia0oWMebjYN00WLYwLb4Xr-lnSEztYIePQITywc', Content, Response);


        Response.Content().ReadAs(ResponseText);
        Message(ResponseText);
        responsejson.ReadFrom(ResponseText);
        responsejson.Get('crmid',tokenvalue);
        tokenstring:=tokenvalue.AsValue().AsText();

        Rec."CRM ID":=Format(tokenstring);
        Rec.modify(false);
        
    end;


}

pageextension 50303 "Item Ext" extends "Item Card"
{
    
    layout
    {
        addafter("D365 Product ID")
        {
            field("CRM ID"; Rec."CRM ID")
            {
                Caption = 'CRM ID';
                ApplicationArea = All;
            }
            field("UOM"; Rec."Base Unit of Measure")
            {
                Caption = 'Base Unit of Measure';
                ApplicationArea = All;
                TableRelation="Unit of Measure".Code;
            }
        }
    }
}