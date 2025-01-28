codeunit 50100 "Vendor CRM Integration"
{
    procedure CreateVendorInCRM(VendorRec: Record Vendor): Boolean
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        Response: HttpResponseMessage;
        ResponseText: Text;
        JObject: JsonObject;
        ResponseJson: JsonObject;
        JsonText: Text;
        CRMId: Text;
    begin
        // Validate vendor record before creating
        if not ValidateVendorFields(VendorRec) then
            exit(false);

        JObject := CreateVendorJson(VendorRec);
        JObject.WriteTo(JsonText);

        Content.WriteFrom(JsonText);
        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');

        if not Client.Post('https://prod-06.australiasoutheast.logic.azure.com:443/workflows/040900aee91d4389a420ea2cde1e195a/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=p_lUuXIR8VoTkXY3JYRopM1YwcfgWaoCROZ8i2LNyIA',
            Content, Response) then
            Error('Failed to create vendor in CRM');

        Response.Content().ReadAs(ResponseText);
        if not ResponseJson.ReadFrom(ResponseText) then
            Error('Invalid response from CRM');

        if GetCRMIdFromResponse(ResponseJson, CRMId) then begin
            VendorRec."CRM ID" := CRMId;
            VendorRec.Modify(true);
            exit(true);
        end;

        exit(false);
    end;

    procedure UpdateVendorInCRM(VendorRec: Record Vendor): Boolean
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        Response: HttpResponseMessage;
        ResponseText: Text;
        JObject: JsonObject;
        ResponseJson: JsonObject;
        JsonText: Text;
    begin

        if not ValidateVendorFields(VendorRec) then        
            exit(false);

        if VendorRec."CRM ID" = '' then
            Error('CRM ID is required for update operation');

        JObject := CreateVendorJson(VendorRec);
        JObject.WriteTo(JsonText);

        Content.WriteFrom(JsonText);
        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');

        if not Client.Put('https://prod-06.australiasoutheast.logic.azure.com:443/workflows/040900aee91d4389a420ea2cde1e195a/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=p_lUuXIR8VoTkXY3JYRopM1YwcfgWaoCROZ8i2LNyIA' +
            '/' + VendorRec."CRM Id", Content, Response) then
            Error('Failed to update vendor in CRM');

        Response.Content().ReadAs(ResponseText);
        if not ResponseJson.ReadFrom(ResponseText) then
            Error('Invalid response from CRM');

        exit(true);
    end;

    local procedure CreateVendorJson(VendorRec: Record Vendor): JsonObject
    var
        JObject: JsonObject;
    begin
        JObject.Add('bcid', Format(VendorRec."No."));
        JObject.Add('crmid', VendorRec."CRM ID");
        JObject.Add('name', VendorRec.Name);
        JObject.Add('phoneNo', VendorRec."Phone No.");
        JObject.Add('email', VendorRec."E-Mail");
        JObject.Add('address', VendorRec.Address);
        JObject.Add('address2', VendorRec."Address 2");
        JObject.Add('address3', VendorRec."Address 3");
        JObject.Add('addressName', VendorRec."Address Name");
        JObject.Add('city', VendorRec."D365 City");
        JObject.Add('state', VendorRec."D365 State");
        JObject.Add('country', VendorRec."D365 Country");
        JObject.Add('postCode', VendorRec."D365 Postal Code");
        JObject.Add('customerGroup', Format(VendorRec."Customer group"));
        JObject.Add('primaryContact', VendorRec."Primary Contact No.");
        JObject.Add('creditHold', VendorRec."Credit Hold");
        JObject.Add('creditLimit', VendorRec."Credit Amount (LCY)");
        JObject.Add('currencyCode', VendorRec."Currency Code");
        JObject.Add('paymentTerms', VendorRec."Payment Terms Code");
        JObject.Add('paymentMethod', VendorRec."Payment Method Code");
        JObject.Add('territoryCode', VendorRec."Territory Code");
        JObject.Add('dimension', VendorRec.Dimension);
        JObject.Add('sapCustomerNumber', VendorRec."SAP Vendor Number");
        JObject.Add('abn', VendorRec."ABN No.");
        JObject.Add('web', VendorRec.WEB);
        JObject.Add('description', VendorRec.Description);
        JObject.Add('ownerId', VendorRec."Owner Id");

        exit(JObject);
    end;

    local procedure ValidateVendorFields(VendorRec: Record Vendor): Boolean
    var
        ErrorText: Text;
    begin
        if VendorRec."No." = '' then
            Error('Vendor No. is required');

        if VendorRec.Name = '' then
            Error('Vendor Name is required');

        if VendorRec."Vendor Posting Group" = '' then
            Error('Vendor Posting Group is required');

        if VendorRec."Gen. Bus. Posting Group" = '' then
            Error('Gen. Bus. Posting Group is required');

        exit(true);
    end;

    local procedure GetCRMIdFromResponse(ResponseJson: JsonObject; var CRMId: Text): Boolean
    var
        Token: JsonToken;
    begin
        if ResponseJson.Get('crmid', Token) then begin
            CRMId := Token.AsValue().AsText();
            exit(true);
        end;
        exit(false);
    end;
}