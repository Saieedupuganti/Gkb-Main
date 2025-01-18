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
        JObject.Add('bcid', VendorRec."No.");
        JObject.Add('crmid', VendorRec."CRM Id");
        JObject.Add('PrimaryContact', VendorRec."Primary Contact No.");
        JObject.Add('PhoneNo', VendorRec."Phone No.");
        JObject.Add('D365AccountID', VendorRec."D365 Account ID");
        JObject.Add('ABN', VendorRec.ABN);
        JObject.Add('Address', VendorRec.Address);
        JObject.Add('Address2', VendorRec."Address 2");
        JObject.Add('Address3', VendorRec."Address 3");
        JObject.Add('Addressname', VendorRec."Address Name");
        JObject.Add('CapexFrom', VendorRec."Capex From");
        JObject.Add('CapexTo', VendorRec."Capex To");
        JObject.Add('ContactGroup', VendorRec."Contact Groups");
        JObject.Add('CreditHold', VendorRec."Credit Hold");
        JObject.Add('CreditLimitLCY', VendorRec."Capex From");
        JObject.Add('County', VendorRec."Capex To");
        JObject.Add('CurrencyCode', VendorRec."Currency Code");
        JObject.Add('Customergroup', VendorRec."Customer Group");
        JObject.Add('CustomerProfile', VendorRec."Vendor Profile");
        JObject.Add('PaymentMethodCode', VendorRec."Payment Method Code");
        JObject.Add('PaymentTermsCode', VendorRec."Payment Terms Code");
        JObject.Add('city', VendorRec."D365 City");
        JObject.Add('Description', VendorRec.Description);
        JObject.Add('ServiceAgreement', VendorRec."Service Agreement");
        JObject.Add('EMail', VendorRec."E-Mail");
        JObject.Add('FaxNo', VendorRec."Fax No.");
        JObject.Add('TerritoryCode', VendorRec."Territory Code");
        JObject.Add('Name', VendorRec.Name);
        JObject.Add('PostCode', VendorRec."D365 Postal Code");
        JObject.Add('SAPCustomerNumber', VendorRec."SAP Vendor Number");
        JObject.Add('DimensionId', VendorRec."Dimension ID");
        JObject.Add('TerritoryCodeID', VendorRec."Territory Code Id");
        JObject.Add('ownerid', VendorRec."Owner Id");
        JObject.Add('supplieraccountgroup', VendorRec."Supplier account Group");
        JObject.Add('WEB', VendorRec.WEB);
        JObject.Add('PrivacyBlocked', VendorRec."Privacy Blocked");
        JObject.Add('Blockpaymenttolerance', VendorRec."Block Payment Tolerance");

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