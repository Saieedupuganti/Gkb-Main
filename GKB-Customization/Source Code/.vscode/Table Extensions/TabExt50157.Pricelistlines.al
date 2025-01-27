tableextension 50157 "PurchPrclistLine" extends "Price List Line"
{
    fields
    {
        field(50000; "Crm Id"; Text[100])
        {
            Caption = 'Crm Id';
            DataClassification = ToBeClassified;
        }
    }

    trigger OnAfterInsert()
    begin
        if ("Product No." = '') and ("Unit Price" = 0) then
            exit;
        UpdateTheRecord();
    end;

    trigger OnAfterModify()
    begin
        if (xRec."Product No." <> Rec."Product No.") or (xRec."Unit Price" <> Rec."Unit Price") then begin
            UpdateTheRecord();
        end;
    end;

    procedure UpdateTheRecord()
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
        priceListJson: JsonObject;
        responseJson: JsonObject;
        jsonText: Text;
        tokenValue: JsonToken;
        tokenString: Text;
        productRec: Record Item;
        uomRec: Record "Unit of Measure";
        priceListRec: Record "Price List Header";
        MaxRetries: Integer;
        RetryCount: Integer;
        TimeoutMs: Integer;
        ErrorMsg: Text;
    begin
        // Initialize retry parameters
        MaxRetries := 3;
        RetryCount := 0;
        TimeoutMs := 120000; // 120 seconds timeout

        // Set timeout for the HTTP client
        Client.Timeout(TimeoutMs);

        // Set Content Headers
        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
        ContentHeaders.Add('Content-Encoding', 'UTF8');

        // Validate required records
        if not priceListRec.Get(Rec."Price List Code") then
            Error('Price List Header not found.');

        if not productRec.Get(Rec."Product No.") then
            Error('Product not found.');

        if not uomRec.Get(Rec."Unit of Measure Code Lookup") then
            Error('Unit of Measure not found.');

        // Validate CRM IDs
        if priceListRec."Crm Id" = '' then
            Error('Price List CRM ID is missing.');
        if productRec."CRM ID" = '' then
            Error('Product CRM ID is missing.');
        // if uomRec."CRM ID" = '' then
        //     Error('Unit of Measure CRM ID is missing.');
        // if uomRec."Unitgroup CRM ID" = '' then
        //     Error('Unit Group CRM ID is missing.');

        // Create JSON object
        Clear(priceListJson);
        priceListJson.Add('pricelistcrmid', priceListRec."Crm Id");
        priceListJson.Add('pricelistitembcid', Rec."Line No.");
        priceListJson.Add('pricelistitemcrmid', Rec."Crm Id");
        priceListJson.Add('productcrmid', productRec."CRM ID");
        priceListJson.Add('unitcrmid', uomRec."CRM ID");
        priceListJson.Add('amount', Rec."Unit Price");
        priceListJson.Add('unitid', '/uoms(' + uomRec."CRM ID" + ')');
        priceListJson.Add('unitgroupid', '/uomschedules(' + uomRec."Unitgroup CRM ID" + ')');
        priceListJson.Add('productid', '/items(' + productRec."CRM ID" + ')');
        priceListJson.Add('pricelistid', '/priceLists(' + priceListRec."Crm Id" + ')');
        priceListJson.WriteTo(jsonText);
        Content.WriteFrom(jsonText);

        // Log the request payload
       // Message('Request Payload: %1', jsonText);

        // Retry logic for HTTP request
        repeat
            RetryCount += 1;
            Clear(Response);

            IsSuccessful := Client.Post('https://prod-22.australiasoutheast.logic.azure.com:443/workflows/423a3871dc6945ad9eec35a4ccc8beaf/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=lZydJkUzJLHfE23U33ruB7_1FhZZxwDm6nT5Ezjif6g', Content, Response);

            if IsSuccessful then begin
                Response.Content().ReadAs(ResponseText);
               // Message('Response: %1', ResponseText);  // Log the full response

                if ResponseText <> '' then begin
                    if responseJson.ReadFrom(ResponseText) then begin
                        // Check for error object in response
                        if ParseErrorMessage(ResponseText, ErrorMsg) then
                            Error('API Error: %1', ErrorMsg);

                        // Process successful response
                        if responseJson.Get('pricelistitemcrmid', tokenValue) then begin
                            if tokenValue.IsValue then begin
                                tokenString := tokenValue.AsValue().AsText();
                                Rec."Crm Id" := CopyStr(tokenString, 1, MaxStrLen(Rec."Crm Id"));
                                Rec.Modify(false);
                                exit; // Success - exit the retry loop
                            end;
                        end;
                        Error('Response does not contain valid pricelistitemcrmid. Full response: %1', ResponseText);
                    end;
                    Error('Invalid JSON response: %1', ResponseText);
                end;
                Error('Empty response received from the server.');
            end else
                Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);

            if RetryCount < MaxRetries then
                Sleep(100 * RetryCount); // Exponential backoff

        until (RetryCount >= MaxRetries);

        // If we get here, all retries failed
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
                    // If we can't get the message, try to get the entire error object as text
                    ErrorObject.WriteTo(ErrorMessage);
                    exit(true);
                end;
            end;
        end;
        ErrorMessage := ResponseText;  // Return the entire response if we can't parse it
        exit(false);
    end;
}