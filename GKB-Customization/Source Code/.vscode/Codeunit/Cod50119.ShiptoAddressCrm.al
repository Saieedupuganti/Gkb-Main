codeunit 50119 "Ship-To Add Crm Management"
{
    procedure UpdateTheRecord()
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
        JObject: JsonObject;
        jsonText: Text;
        tokenValue: JsonToken;
        tokenString: Text;
        Customer: Record Customer;
        ShipToAdd: Record "Ship-to Address";
        MaxRetries: Integer;
        RetryCount: Integer;
        TimeoutMs: Integer;
        ErrorMsg: Text;
    begin


        // Initialize request content and headers
        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
        ContentHeaders.Add('Content-Encoding', 'UTF8');

        ShipToAdd.SetFilter("Customer No.", Customer."No.");
        Message('Couldnt find the Customer');

        //Clear(JObject);
        JObject.Add('customerNo', Customer."CRM ID");

        if ShipToAdd.FindFirst() then begin
            JObject.Add('code', ShipToAdd.Code);
            JObject.Add('crmid', ShipToAdd."Crm Id");
            JObject.Add('name', ShipToAdd.Name);
            JObject.Add('address', ShipToAdd.Address);
            JObject.Add('address2', ShipToAdd."Address 2");
            JObject.Add('address3', ShipToAdd."Address 3");
            JObject.Add('city', ShipToAdd."D365 City");
            JObject.Add('state', ShipToAdd."D365 State");
            JObject.Add('postcode', ShipToAdd."Postal Code");
            JObject.Add('country', ShipToAdd."D365 Country");
            JObject.Add('phone', ShipToAdd."Phone No.");
            JObject.Add('email', ShipToAdd."E-Mail");
        end
        else
        Message('Coudnt find the Ship to address for the customer');

        JObject.WriteTo(JsonText);
        Content.WriteFrom(JsonText);

        IsSuccessful := Client.Post(
            'https://prod-30.australiasoutheast.logic.azure.com:443/workflows/9f3c11f2010d4a9b8bd5fc42a7601768/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=2C7E9P8G3WT18Fi4rP-2nDdXTyGT406DKHQ3cMhN9LI',
            Content, Response);

        if IsSuccessful then begin
            Response.Content().ReadAs(ResponseText);

        end else
            Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);
    end;
}