tableextension 50121 GKBLocationExt extends Location
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Crm Id"; Text[100])
        {
            Caption = 'Crm Id';
            DataClassification = ToBeClassified;
        }
        field(50102; "D365 City"; Text[50])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(50103; "D365 State"; Text[50])
        {
            Caption = 'State';
            DataClassification = ToBeClassified;
        }
        field(50104; "D365 Country"; Text[50])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
        }
        field(50105; "D365 Postal Code"; Text[50])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
        }
        field(50106; "Address Name"; Text[50])
        {
            Caption = 'Address Name';
            DataClassification = ToBeClassified;
        }
        field(50107; "Address 3"; Text[50])
        {
            Caption = 'Address 3';
            DataClassification = ToBeClassified;
        }
        field(50108; "Adjustment Crm Id"; Text[50])
        {
            Caption = 'Adjustment Crm Id';
            DataClassification = ToBeClassified;
        }
    }
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
    begin
        Content.GetHeaders(ContentHeaders);

        if not ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Add('Content-Type', 'application/json');

        if not ContentHeaders.Contains('Content-Encoding') then
            ContentHeaders.Add('Content-Encoding', 'UTF8');

        json.Add('locationid', Rec.Code);
        json.Add('crmid', Rec."Crm Id");
        json.Add('adjustmentcrmid', Rec."Adjustment Crm Id");
        json.Add('name', Rec.Name);
        json.Add('addressname', Rec."Address Name");
        json.Add('address1', Rec."Address");
        json.Add('address2', Rec."Address 2");
        json.Add('address3', Rec."Address 3");
        json.Add('city', Rec."D365 City");
        json.Add('state', Rec."D365 State");
        json.Add('country', Rec."D365 Country");
        json.Add('postcode', Rec."D365 Postal Code");

        json.WriteTo(jsontext);
        Content.WriteFrom(jsontext);

        IsSuccessful := Client.Post('https://prod-10.australiasoutheast.logic.azure.com:443/workflows/95387ab15f0f45eea5ff5c30359c374a/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=4BB32M0mY73q4Bm7rPlIj7aIB2gKsEDPFUaPANLkcxw', Content, Response);

        if IsSuccessful then begin
            Response.Content().ReadAs(ResponseText);
            responsejson.ReadFrom(ResponseText);
            if responsejson.Contains('crmid') then begin
                responsejson.Get('crmid', tokenvalue);
                tokenstring := tokenvalue.AsValue().AsText();
                Rec."Crm Id" := Format(tokenstring);
                Rec.modify(false);
            end;
            if responsejson.Contains('adjustmentcrmid') then begin
                responsejson.Get('adjustmentcrmid', tokenvalue);
                tokenstring := tokenvalue.AsValue().AsText();
                Rec."Adjustment Crm Id" := Format(tokenstring);
                Rec.modify(false);
            end;

        end;
    end;
}


