codeunit 50120 "Contact Crm Management"
{
    procedure UpadeToCrm(Contact: Record Contact)
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
        JObject: JsonObject;
        JsonText: Text;
        Customer: Record Customer;
        Vendor: Record Vendor;
    begin
        // Initialize request content and headers
        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
        ContentHeaders.Add('Content-Encoding', 'UTF8');

        Customer.SetFilter(Name, Contact."Company Name");
        if Customer.FindFirst() then begin
            Contact."Company Name Crm" := Customer."CRM ID";
        end else begin
            Vendor.SetFilter(Name, Contact."Company Name");
            if Vendor.FindFirst() then begin
                Contact."Company Name Crm" := Vendor."CRM ID";
            end else begin
                Error('No matching customer or vendor found for the company name.');
            end;
        end;

        Contact.Modify();
        // if not Customer.Get(Contact."CRM ID") then
        //     Error('Customer not found.');

        // if Customer."Crm Id" = '' then
        //     Error('Customer CRM ID is missing.');

        JObject.Add('crmid', Contact."Crm Id");
        JObject.Add('companycrmid', Contact."Company Name Crm");
        JObject.Add('description', Contact.Description);
        JObject.Add('firstname', Contact."First Name");
        JObject.Add('middlemame', Contact."Middle Name");
        JObject.Add('Surname', Contact.Surname);
        JObject.Add('addressname', Contact."Address Name");
        JObject.Add('address', Contact.Address);
        JObject.Add('address2', Contact."Address 2");
        JObject.Add('address3', Contact."Address 3");
        JObject.Add('city', Contact.City);
        JObject.Add('state', Contact."D365 State");
        JObject.Add('county', Contact.County);
        JObject.Add('country', Contact."D365 Country");
        JObject.Add('postCode', Contact."Post Code");
        JObject.Add('currencycrmid', Contact."Currency CRM ID");
        JObject.Add('faxno', Contact."Fax No.");
        JObject.Add('name', Contact.Name);
        JObject.Add('jobtitle', Contact."Job Title");
        JObject.Add('phoneno', Contact."Phone No.");
        JObject.Add('email', Contact."E-Mail");
        JObject.Add('mobilephoneno', Contact."Mobile Phone No.");
        JObject.Add('dimension', Contact.Dimension);
        JObject.Add('dimensionid', Contact."Dimension ID");
        JObject.Add('emailgroupcode', Contact."E-Mail Group Code");

        JObject.WriteTo(JsonText);
        Content.WriteFrom(JsonText);

        IsSuccessful := Client.Post(
            'https://prod-08.australiasoutheast.logic.azure.com:443/workflows/0eed1ce8d1754740895faf0421f02596/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=HIqZ0Gb2XRtPbBBovHxiypoCwyhJfWL4h59KS1SJfmE',
            Content, Response);

        if IsSuccessful then begin
            Response.Content().ReadAs(ResponseText);
        end else
            Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);
    end;
}