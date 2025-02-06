codeunit 50117 "Vendor CRM Integration"
{
    procedure UpdateCRMAccount(Vendor: Record Vendor)
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
        vendorJson: JsonObject;
        responseJson: JsonObject;
        jsonText: Text;
        tokenValue: JsonToken;
        tokenString: Text;
        MaxRetries: Integer;
        RetryCount: Integer;
        TimeoutMs: Integer;
        ErrorMsg: Text;
        Currency: Record Currency;
        Contact: Record Contact;
        PriceListLine: Record "Price List line";
        Territory: Record Territory;
        Dimension: Record "Dimension Value";
    begin
        MaxRetries := 3;
        RetryCount := 0;
        TimeoutMs := 120000;
        Client.Timeout(TimeoutMs);

        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
        ContentHeaders.Add('Content-Encoding', 'UTF8');

        // if not Currency.Get(Vendor."Currency Code") then
        // Error('Currency not found.');


        Contact.SetFilter("No.", vendor."Primary Contact No.");
        if Contact.FindFirst then begin
            vendorJson.Add('primarycontactid', Contact."CRM ID");
        end;

        Dimension.SetFilter(Code, vendor.Dimension);
        if Dimension.FindFirst then begin
            vendorJson.Add('dimensionid', Dimension."CRM ID");
        end;

        Currency.SetFilter(Code, vendor."Currency Code");
        if Currency.FindFirst then begin
            vendorJson.Add('currencyid', Currency."CRM ID");
        end;

        Territory.SetFilter(Code, vendor."Territory Code");
        if Territory.FindFirst then begin
            vendorJson.Add('territoryid', Territory."CRM ID");
        end;


        Clear(vendorJson);

        vendorJson.Add('bcid', Vendor."No.");
        vendorJson.Add('crmid', Vendor."CRM ID");
        vendorJson.Add('d365accountid', Vendor."D365 Account ID");
        vendorJson.Add('sapcustomernumber', Vendor."SAP Vendor Number");
        vendorJson.Add('name', Vendor.Name);
        vendorJson.Add('primarycontact', Vendor."Primary Contact No.");
        vendorJson.Add('phoneno', Vendor."Phone No.");
        vendorJson.Add('emailaddress', Vendor."E-Mail");
        vendorJson.Add('web', Vendor.WEB);
        vendorJson.Add('address', Vendor.Address);
        vendorJson.Add('address2', Vendor."Address 2");
        vendorJson.Add('address3', Vendor."Address 3");
        vendorJson.Add('addressname', Vendor."Address Name");
        vendorJson.Add('city', Vendor."D365 City");
        vendorJson.Add('state', Vendor."D365 State");
        vendorJson.Add('country', Vendor."D365 Country");
        vendorJson.Add('postcode', Vendor."D365 Postal Code");
        vendorJson.Add('customerprofile', Format(Vendor."Vendor Profile"));
        vendorJson.Add('customergroup', Format(Vendor."Customer group"));
        vendorJson.Add('contactgroup', Format(Vendor."Contact Groups"));
        vendorJson.Add('credithold', Vendor."Credit Hold");
        vendorJson.Add('creditlimit', Vendor."Credit Amount (LCY)");
        vendorJson.Add('paymentterms', Vendor."Payment Terms Code");
        vendorJson.Add('paymentmethod', Vendor."Payment Method Code");
        vendorJson.Add('abn', Vendor."ABN");
        vendorJson.Add('faxno', Vendor."Fax No.");
        vendorJson.Add('capexfrom', Vendor."Capex From");
        vendorJson.Add('capexto', Vendor."Capex To");
        vendorJson.Add('serviceagreement', Format(Vendor."Service Agreement"));
        vendorJson.Add('description', Vendor.Description);
        vendorJson.Add('supplieraccountgroup', Format(Vendor."Supplier account Group"));
        vendorJson.Add('customcontactid', Vendor."Custom Contact Id");
        vendorJson.Add('companycontact', Vendor."Company Conatct");

        vendorJson.WriteTo(jsonText);
        Content.WriteFrom(jsonText);

        repeat
            RetryCount += 1;
            Clear(Response);

            IsSuccessful := Client.Post('https://prod-06.australiasoutheast.logic.azure.com:443/workflows/040900aee91d4389a420ea2cde1e195a/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=p_lUuXIR8VoTkXY3JYRopM1YwcfgWaoCROZ8i2LNyIA', Content, Response);

            if IsSuccessful then begin
                Response.Content().ReadAs(ResponseText);

                if ResponseText <> '' then begin
                    if responseJson.ReadFrom(ResponseText) then begin
                        if ParseErrorMessage(ResponseText, ErrorMsg) then
                            Error('API Error: %1', ErrorMsg);

                        if responseJson.Get('crmid', tokenValue) then begin
                            if tokenValue.IsValue then begin
                                tokenString := tokenValue.AsValue().AsText();
                                Vendor."CRM ID" := CopyStr(tokenString, 1, MaxStrLen(Vendor."CRM ID"));
                                Vendor.Modify(false);
                                exit;
                            end;
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

        Error('Failed to update CRM ID after %1 attempts. Last response: %2', MaxRetries, ResponseText);
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