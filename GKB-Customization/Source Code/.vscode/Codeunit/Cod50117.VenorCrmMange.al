codeunit 50117 "Vendor CRM Integration"
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
        MaxRetries: Integer;
        RetryCount: Integer;
        TimeoutMs: Integer;
        ErrorMsg: Text;
    begin
        MaxRetries := 3;
        RetryCount := 0;
        TimeoutMs := 120000;
        Client.Timeout(TimeoutMs);

        // Validate vendor record before creating
        if not ValidateVendorFields(VendorRec) then
            exit(false);

        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
        ContentHeaders.Add('Content-Encoding', 'UTF8');

        JObject := CreateVendorJson(VendorRec);
        JObject.WriteTo(JsonText);
        Content.WriteFrom(JsonText);

        repeat
            RetryCount += 1;
            Clear(Response);

            if Client.Post('https://prod-06.australiasoutheast.logic.azure.com:443/workflows/040900aee91d4389a420ea2cde1e195a/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=p_lUuXIR8VoTkXY3JYRopM1YwcfgWaoCROZ8i2LNyIA',
                Content, Response) then begin
                Response.Content().ReadAs(ResponseText);

                if ResponseText <> '' then begin
                    if ResponseJson.ReadFrom(ResponseText) then begin
                        if ParseErrorMessage(ResponseText, ErrorMsg) then
                            Error('API Error: %1', ErrorMsg);

                        if GetCRMIdFromResponse(ResponseJson, CRMId) then begin
                            VendorRec."CRM ID" := CRMId;
                            VendorRec.Modify(true);
                            exit(true);
                        end;
                        Error('Response does not contain valid CRM ID. Full response: %1', ResponseText);
                    end;
                    Error('Invalid JSON response: %1', ResponseText);
                end;
                Error('Empty response received from the server.');
            end else
                Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);

            if RetryCount < MaxRetries then
                Sleep(100 * RetryCount);

        until (RetryCount >= MaxRetries);

        Error('Failed to create vendor in CRM after %1 attempts. Last response: %2', MaxRetries, ResponseText);
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
        MaxRetries: Integer;
        RetryCount: Integer;
        TimeoutMs: Integer;
        ErrorMsg: Text;
    begin
        MaxRetries := 3;
        RetryCount := 0;
        TimeoutMs := 120000;
        Client.Timeout(TimeoutMs);

        if not ValidateVendorFields(VendorRec) then
            exit(false);

        if VendorRec."CRM ID" = '' then
            Error('CRM ID is required for update operation');

        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
        ContentHeaders.Add('Content-Encoding', 'UTF8');

        JObject := CreateVendorJson(VendorRec);
        JObject.WriteTo(JsonText);
        Content.WriteFrom(JsonText);

        repeat
            RetryCount += 1;
            Clear(Response);

            if Client.Post('https://prod-06.australiasoutheast.logic.azure.com:443/workflows/040900aee91d4389a420ea2cde1e195a/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=p_lUuXIR8VoTkXY3JYRopM1YwcfgWaoCROZ8i2LNyIA',
                Content, Response) then begin
                Response.Content().ReadAs(ResponseText);

                if ResponseText <> '' then begin
                    if ResponseJson.ReadFrom(ResponseText) then begin
                        if ParseErrorMessage(ResponseText, ErrorMsg) then
                            Error('API Error: %1', ErrorMsg);
                        exit(true);
                    end;
                    Error('Invalid JSON response: %1', ResponseText);
                end;
                Error('Empty response received from the server.');
            end else
                Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);

            if RetryCount < MaxRetries then
                Sleep(100 * RetryCount);

        until (RetryCount >= MaxRetries);

        Error('Failed to update vendor in CRM after %1 attempts. Last response: %2', MaxRetries, ResponseText);
    end;

    local procedure CreateVendorJson(VendorRec: Record Vendor): JsonObject
    var
        JObject: JsonObject;
        Currency: Record Currency;
        Contact: Record Contact;
        Territory: Record Territory;
        Dimension: Record "Dimension Value";
        Employee: Record Employee;
    begin
        Clear(JObject);

        // Basic Identifiers
        JObject.Add('bcid', VendorRec."No.");
        JObject.Add('crmid', VendorRec."CRM ID");
        JObject.Add('d365accountid', VendorRec."D365 Account ID");
        JObject.Add('sapvendornumber', VendorRec."SAP Vendor Number");
        JObject.Add('name', VendorRec.Name);
        JObject.Add('telephone1', VendorRec."Phone No.");
        JObject.Add('emailaddress1', VendorRec."E-Mail");
        JObject.Add('websiteurl', VendorRec.WEB);
        JObject.Add('address1_line1', VendorRec.Address);
        JObject.Add('address1_line2', VendorRec."Address 2");
        JObject.Add('address1_line3', VendorRec."Address 3");
        JObject.Add('address1_name', VendorRec."Address Name");
        JObject.Add('address1_city', VendorRec."D365 City");
        JObject.Add('address1_stateorprovince', VendorRec."D365 State");
        JObject.Add('address1_country', VendorRec."D365 Country");
        JObject.Add('address1_postalcode', VendorRec."D365 Postal Code");

        // Related Records with CRM IDs
        if Currency.Get(VendorRec."Currency Code") and (Currency."CRM ID" <> '') then
            JObject.Add('transactioncurrencyid', '/transactioncurrencies(' + Currency."CRM ID" + ')');

        if Contact.Get(VendorRec."Primary Contact No.") and (Contact."CRM ID" <> '') then
            JObject.Add('primarycontactid', '/contacts(' + Contact."CRM ID" + ')');

        if Territory.Get(VendorRec."Territory Code") and (Territory."CRM ID" <> '') then
            JObject.Add('territoryid', '/territories(' + Territory."CRM ID" + ')');

        if Dimension.Get(VendorRec.Dimension) and (Dimension."CRM ID" <> '') then
            JObject.Add('dimensionid', '/dimensions(' + Dimension."CRM ID" + ')');

        JObject.Add('customergroup', Format(VendorRec."Customer group"));
        JObject.Add('contactgroup', Format(VendorRec."Contact Groups"));
        JObject.Add('ownership', Format(VendorRec."Owner Ship"));
        JObject.Add('credithold', VendorRec."Credit Hold");
        JObject.Add('creditlimit', VendorRec."Credit Amount (LCY)");
        JObject.Add('paymenttermscode', VendorRec."Payment Terms Code");
        JObject.Add('paymentmethodcode', VendorRec."Payment Method Code");
        JObject.Add('abn', VendorRec."ABN No.");

        JObject.Add('serviceagreement', Format(VendorRec."Service Agreement"));
        JObject.Add('accountcontractmanager', VendorRec."Account Contract Manager");
        JObject.Add('accountcontractmanagerid', VendorRec."Account Contract Manager ID");

        if VendorRec."Capex From" <> 0D then
            JObject.Add('capexfrom', Format(VendorRec."Capex From", 0, '<Year4>-<Month,2>-<Day,2>'));
        if VendorRec."Capex To" <> 0D then
            JObject.Add('capexto', Format(VendorRec."Capex To", 0, '<Year4>-<Month,2>-<Day,2>'));

        JObject.Add('description', VendorRec.Description);
        JObject.Add('supplieraccountgroup', Format(VendorRec."Supplier account Group"));
        JObject.Add('dimension', VendorRec.Dimension);
        JObject.Add('dimensionid', VendorRec."Dimension ID");
        JObject.Add('territorycode', VendorRec."Territory Code");
        JObject.Add('territorycodeid', VendorRec."Territory Code ID");
        JObject.Add('currencycodeid', VendorRec."Currency Code Id");

        exit(JObject);
    end;

    local procedure ValidateVendorFields(VendorRec: Record Vendor): Boolean
    var
        Currency: Record Currency;
        Contact: Record Contact;
        Territory: Record Territory;
        Dimension: Record "Dimension Value";
        Employee: Record Employee;
    begin
        if VendorRec."No." = '' then
            Error('Vendor No. is required');

        if VendorRec.Name = '' then
            Error('Vendor Name is required');

        if VendorRec."Vendor Posting Group" = '' then
            Error('Vendor Posting Group is required');

        if VendorRec."Gen. Bus. Posting Group" = '' then
            Error('Gen. Bus. Posting Group is required');

        // Validate related records exist and have CRM IDs
        if VendorRec."Currency Code" <> '' then
            if not Currency.Get(VendorRec."Currency Code") then
                Error('Currency not found.');

        if VendorRec."Primary Contact No." <> '' then
            if not Contact.Get(VendorRec."Primary Contact No.") then
                Error('Contact not found.');

        if VendorRec."Territory Code" <> '' then
            if not Territory.Get(VendorRec."Territory Code") then
                Error('Territory not found.');

        // if VendorRec.Dimension <> '' then
        //     if not Dimension.Get(VendorRec.Dimension) then
        //         Error('Dimension not found.');

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

    local procedure ParseErrorMessage(ResponseText: Text; var ErrorMessage: Text): Boolean
    var
        JsonObject: JsonObject;
        ErrorToken: JsonToken;
        ErrorObject: JsonObject;
        MessageToken: JsonToken;
    begin
        if JsonObject.ReadFrom(ResponseText) then begin
            if JsonObject.Get('error', ErrorToken) then begin
                if ErrorToken.IsObject then begin
                    ErrorObject := ErrorToken.AsObject();
                    if ErrorObject.Get('message', MessageToken) then begin
                        if MessageToken.IsValue then begin
                            ErrorMessage := MessageToken.AsValue().AsText();
                            exit(true);
                        end;
                    end;
                    ErrorObject.WriteTo(ErrorMessage);
                    exit(true);
                end;
            end;
        end;
        ErrorMessage := ResponseText;
        exit(false);
    end;
}