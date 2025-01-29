tableextension 50100 "Customer Ext" extends Customer
{
    fields
    {
        field(50149; "D365 State"; Text[100])
        {
            Caption = 'State';
            DataClassification = ToBeClassified;
        }
        field(50150; "D365 Country"; Text[100])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
        }
        field(50145; "D365 City"; Text[100])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(50146; "D365 PostCode"; Text[100])
        {
            Caption = 'PostCode';
            DataClassification = ToBeClassified;
        }
        field(50101; "Customer Profile"; Option)
        {
            Caption = 'Customer Profile';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Agriculture,Beverages,Buildings,Chemical,Competition,Concrete,Consultants,Education,Engineer Procure Construct,Food,Government Organisation,Health Care,Hotel & Casinos,Laundry & Clean,Manufacturing,Materials Construction & Packaging,Mining and Precious Metals,N/A,OEM Machinery,Oil & Gas,Other,Packaging,Pet Food,Pharma & Biotech,Power Generation,Pulp & Paper,Recycling,Rubber & Pastic,SIG Affiliations,Service Providers,Service Retail,Social Services,Special Outbound Trade Contractors,Specialty Realty,Textiles,Timber And Forestry,Transportation,Utility Creation and Distribution,Vehicle Retail,Water and Waste,Wholesale';
            OptionMembers = " ","Agriculture","Beverages","Buildings","Chemical","Competition","Concrete","Consultants","Education","Engineer Procure Construct","Food","Government Organisation","Health Care","Hotel & Casinos","Laundry & Clean","Manufacturing","Materials Construction & Packaging","Mining and Precious Metals","N/A","OEM Machinery","Oil & Gas","Other","Packaging","Pet Food","Pharma & Biotech","Power Generation","Pulp & Paper","Recycling","Rubber& Pastic","SIG Affiliations","Service Providers","Service Retail","Social Services","Special Outbound Trade Contractors","Specialty Realty","Textiles","Timber And Forestry","Transportation","Utility Creation and Distribution","Vehicle Retail","Water and Waste","Wholesale";
        }
        field(50102; "Supplier account Group"; Option)
        {
            Caption = 'Supplier Account Group';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Accounting,Amenities,Boiler Ancillaries,Boiler Manufacturer,Burner Management,Communication,Competition,Consultants,Credit Cards,Electrical,Employees,Engineering,Equipment Rental,Freight & Transport,Gas Components,Inspection & Certification,IT,Legal,Motor Vehicles,Plumbing,Safety Equipment,Subcontractor,Tooling,Travel,Other,N/A';
            OptionMembers = " ","Accounting","Amenities","Boiler Ancillaries","Boiler Manufacturer","Burner Management","Communication","Competition","Consultants","Credit Cards","Electrical","Employees","Engineering","Equipment Rental","Freight & Transport","Gas Components","Inspection & Certification","IT","Legal","Motor Vehicles","Plumbing","Safety Equipment","Subcontractor","Tooling","Travel","Other","N/A";
        }
        field(50103; "D365 Account ID"; Text[100])
        {
            Caption = 'D365 Account ID';
            DataClassification = ToBeClassified;
        }
        field(50104; "SAP Customer Number"; Text[100])
        {
            Caption = 'SAP Customer Number';
            DataClassification = ToBeClassified;
        }
        field(50105; "Service Agreement"; Option)
        {
            Caption = 'Service Agreement';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Basic,Pro';
            OptionMembers = " ","Basic","Pro";
        }
        field(50106; "Account Contract Manager"; Text[100])
        {
            Caption = 'Account Contract Manager';
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(50107; "Capex From"; Date)
        {
            Caption = 'Capex From';
            DataClassification = ToBeClassified;
        }
        field(50108; "Capex To"; Date)
        {
            Caption = 'Capex To';
            DataClassification = ToBeClassified;
        }
        field(50109; "ABN No."; Text[100])
        {
            Caption = 'ABN No';
            DataClassification = ToBeClassified;
        }
        field(50110; "Customer group"; Option)
        {
            Caption = 'Customer Group';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Platinum,Gold,Silver,Bronze,N/A';
            OptionMembers = " ",Platinum,Gold,Silver,Bronze,"N/A";
        }
        field(50111; "Contact Group"; Option)
        {
            Caption = 'Contact Group';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Competitor,Consultant,Customer,Influencer,Investor,Manufacturer,Partner,Press,Prospect,Reseller,Sub Contractor,Vendor,Others';
            OptionMembers = " ",Competitor,Consultant,Customer,Influencer,Investor,Manufacturer,Partner,Press,Prospect,Reseller,"Sub Contractor",Vendor,Others;
        }
        field(50112; "Credit Hold"; Boolean)
        {
            Caption = 'Credit Hold';
            DataClassification = ToBeClassified;
        }
        field(50113; "Description"; Text[1000])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(50114; "Import Serial No"; Text[200])
        {
            Caption = 'Import Serial No';
        }
        field(50115; "Owner Ship"; Option)
        {
            Caption = 'Owner Ship';
            OptionCaption = ' ,Private,Public,Subsidary,Others';
            OptionMembers = " ",Private,Public,Subsidary,Others;
        }

        field(50117; "Address 3"; Text[100])
        {
            Caption = 'Address 3';
        }
        field(50131; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50135; "Account Contract Manager ID"; Text[100])
        {
            Caption = 'Account Contract Manager ID';
            DataClassification = ToBeClassified;
        }
        field(50137; WEB; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50138; "Contact Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(50500; "Dimension"; Code[20])
        {
            Caption = 'Dimension';
            DataClassification = ToBeClassified;
        }
        field(50501; "Dimension ID"; Text[100])
        {
            Caption = 'Dimension ID';
            DataClassification = ToBeClassified;
        }
        field(50502; "Customer Price Group Id"; Text[100])
        {
            Caption = 'Customer Price Group Id';
            DataClassification = ToBeClassified;
        }
        field(50503; "Custom Contact Id"; Text[100])
        {
            Caption = 'Custom Contact Id';
            DataClassification = ToBeClassified;
        }
        field(50504; Territory; Code[20])
        {
            Caption = 'Territory';
            DataClassification = ToBeClassified;
        }
        field(50505; "Territory Code ID"; Text[100])
        {
            Caption = 'Territory Code ID';
            DataClassification = ToBeClassified;
        }
        field(50506; "Territory Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50133; "Company Contact"; Text[100])
        {
            Caption = 'Company Contact';
            FieldClass = FlowField;
            CalcFormula = Lookup("Contact"."No." WHERE("Name" = FIELD(Name)));
        }
        field(50136; "Address Name"; Text[100])
        {
            Caption = 'Address Name';
            DataClassification = ToBeClassified;
        }
        field(50140; "Owner Id"; Text[100])
        {
            Caption = 'Owner Id';
            DataClassification = ToBeClassified;
        }
        field(50141; "Owner"; Code[30])
        {
            Caption = 'Owner';
            DataClassification = ToBeClassified;
        }
        field(50142; "Currency Code Id"; Text[100])
        {
            Caption = 'Currency Code Id';
            DataClassification = ToBeClassified;
        }
        field(50143; "Parent Account"; Text[100])
        {
            Caption = 'Parent Account';
            DataClassification = ToBeClassified;
        }
        field(50144; "Parent Account CRM ID"; Text[100])
        {
            Caption = 'Parent Account CRM ID';
            DataClassification = ToBeClassified;
        }
    }
    trigger OnAfterModify()
    var
        dimRec: Record "Dimension Value";
        customerRec: Record Customer;
        currencyRec: Record Currency;
        contactRec: Record Contact;
        territoryRec: Record Territory;
        modified: Integer;
    begin

        modified := 0;
        // Check if field has changed and is not empty
        if (Rec."CRM ID" <> '') and (xRec."CRM ID" <> Rec."CRM ID") then begin
            contactRec.SetFilter("CRM ID", Rec."CRM ID");
            if contactRec.FindFirst() then begin
                Rec."Company Contact" := contactRec."No.";
                modified := modified + 1;
            end;
        end;
        if (Rec."Currency Code Id" <> '') and (xRec."Currency Code Id" <> Rec."Currency Code Id") then begin
            currencyRec.SetFilter("CRM ID", Rec."Currency Code Id");
            if currencyRec.FindFirst() then begin
                Rec."Currency Code" := currencyRec.Code;
                modified := modified + 1;
            end;
        end;
        if (Rec."Dimension ID" <> '') and (xRec."Dimension ID" <> Rec."Dimension ID") then begin
            dimRec.SetFilter("CRM ID", Rec."Dimension ID");
            if dimRec.FindFirst() then begin
                Rec.Dimension := dimRec.Code;
                modified := modified + 1;
            end;
        end;
        if (Rec."Territory Code ID" <> '') and (xRec."Territory Code ID" <> Rec."Territory Code ID") then begin
            territoryRec.SetFilter("CRM ID", Rec."Territory Code ID");
            if territoryRec.FindFirst() then begin
                Rec.Territory := territoryRec.Code;
                modified := modified + 1;
            end;
        end;
        if modified > 0 then begin
            Rec.Modify(false);
        end;

    end;

    trigger OnAfterInsert()
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
        contactRec: Record Contact;
        contactid: Text;
        customerRec: Record Customer;
        customerid: Text;
    begin
        // Initialize request content and headers
        RequestContent.WriteFrom('');
        RequestContent.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');

        Client.DefaultRequestHeaders.Add('Accept', 'application/json');

        Clear(contactid);
        Clear(customerid);

        if Rec."No." <> '' then begin
            if customerRec.Get(Rec."No.") then
                if customerRec."CRM ID" <> '' then
                    customerid := '/accounts(' + customerRec."CRM ID" + ')';
        end;

        Clear(JObject);
        JObject.Add('bcid', Rec."No.");
        JObject.Add('crmid', Rec."CRM ID");
        JObject.Add('telephone1', Rec."Phone No.");
        JObject.Add('companycontact', Rec."Company Contact"); // Ensure this is the correct field name

        JObject.WriteTo(JsonText);
        RequestContent.WriteFrom(JsonText);

        IsSuccessful := Client.Post('https://prod-06.australiasoutheast.logic.azure.com:443/workflows/8419dbcb99664b739f1ab25cb78b83c1/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=pEF7rVaGAGNPhvxBo5axltUyLdDFcomOMiGiouvMBvY', RequestContent, Response);

        if IsSuccessful then begin
            Response.Content().ReadAs(ResponseText);
            if ResponseJObject.ReadFrom(ResponseText) then begin
                if ResponseJObject.Contains('crmid') then begin
                    ResponseJObject.Get('crmid', TokenValue);
                    TokenString := TokenValue.AsValue().AsText();
                    Rec."CRM ID" := CopyStr(TokenString, 1, 100);
                    Rec.Modify(false);
                end;
            end;
        end;
    end;

    procedure UpdateCRMAccount()
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
        ResponseText: Text;
        customerJson: JsonObject;
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


        // if not PriceListLine.Get(Rec."Customer Price Group" ) then
        //     Error('Price List Header not found.');

        // if not Territory.Get(Rec."Territory Code") then
        // Error('Territory not found.');

        // if not Dimension.Get(Rec."Global Dimension 1 Code") then
        // Error('Dimension not found.');

        // if not Currency.Get(Rec."Currency Code") then
        // Error('Currency not found.');

        //Validate required records exist
        if Rec."Currency Code" <> '' then
            if not Currency.Get(Rec."Currency Code") then
                Error('Currency not found.');

        if Rec."Contact Code" <> '' then
            if not Contact.Get(Rec."Contact Code") then
                Error('Contact not found.');

        if Rec.Territory <> '' then
            if not Territory.Get(Rec.Territory) then
                Error('Territory not found.');

        // if Rec.Dimension <> '' then
        //     if not Dimension.Get(Rec.Dimension) then
        //         Error('Dimension not found.');


        if Currency."CRM ID" <> '' then
            customerJson.Add('transactioncurrencyid', '/transactioncurrencies(' + Currency."CRM ID" + ')');

        if Contact."CRM ID" <> '' then
            customerJson.Add('primarycontactid', '/contacts(' + Contact."CRM ID" + ')');

        if Territory."CRM ID" <> '' then
            customerJson.Add('territoryid', '/territories(' + Territory."CRM ID" + ')');

        if Dimension."CRM ID" <> '' then
            customerJson.Add('dimensionid', '/dimensions(' + Dimension."CRM ID" + ')');

        if Rec."Capex From" <> 0D then
            customerJson.Add('capexfrom', Format(Rec."Capex From", 0, '<Year4>-<Month,2>-<Day,2>'));
        if Rec."Capex To" <> 0D then
            customerJson.Add('capexto', Format(Rec."Capex To", 0, '<Year4>-<Month,2>-<Day,2>'));

        // Create JSON object
        Clear(customerJson);

        customerJson.Add('bcid', Rec."No.");
        customerJson.Add('crmid', Rec."CRM ID");
        customerJson.Add('d365accountid', Rec."D365 Account ID");
        customerJson.Add('sapCustomerNumber', Rec."SAP Customer Number");
        customerJson.Add('name', Rec.Name);
        customerJson.Add('phoneno', Rec."Phone No.");
        customerJson.Add('emailaddress1', Rec."E-Mail");
        customerJson.Add('web', Rec.WEB);
        customerJson.Add('address', Rec.Address);
        customerJson.Add('address2', Rec."Address 2");
        customerJson.Add('address3', Rec."Address 3");
        customerJson.Add('addressname', Rec."Address Name");
        customerJson.Add('city', Rec."D365 City");
        customerJson.Add('state', Rec."D365 State");
        customerJson.Add('country', Rec."D365 Country");
        customerJson.Add('postCode', Rec."D365 PostCode");
        customerJson.Add('customerProfile', Format(Rec."Customer Profile"));
        customerJson.Add('customerGroup', Format(Rec."Customer group"));
        customerJson.Add('contactGroup', Format(Rec."Contact Group"));
        customerJson.Add('creditHold', Rec."Credit Hold");
        customerJson.Add('creditLimit', Rec."Credit Limit (LCY)");
        customerJson.Add('paymentTerms', Rec."Payment Terms Code");
        customerJson.Add('paymentMethod', Rec."Payment Method Code");
        customerJson.Add('abn', Rec."ABN");
        customerJson.Add('serviceagreement', Format(Rec."Service Agreement"));
        customerJson.Add('description', Rec.Description);
        customerJson.Add('supplieraccountgroup', Format(Rec."Supplier account Group"));
        customerJson.Add('dimension', Rec.Dimension);
        customerJson.Add('dimensionid', Rec."Dimension ID");
        customerJson.Add('customerpricegroup', Rec."Customer Price Group Id");
        customerJson.Add('customcontactid', Rec."Custom Contact Id");
        customerJson.Add('territorycode', Rec.Territory);
        customerJson.Add('territorycodeid', Rec."Territory Code ID");
        customerJson.Add('territoryid', Rec."Territory Id");
        customerJson.Add('currencycodeid', Rec."Currency Code Id");

        customerJson.WriteTo(jsonText);
        Content.WriteFrom(jsonText);

        repeat
            RetryCount += 1;
            Clear(Response);

            IsSuccessful := Client.Post('https://prod-06.australiasoutheast.logic.azure.com:443/workflows/8419dbcb99664b739f1ab25cb78b83c1/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=pEF7rVaGAGNPhvxBo5axltUyLdDFcomOMiGiouvMBvY', Content, Response);

            if IsSuccessful then begin
                Response.Content().ReadAs(ResponseText);

                if ResponseText <> '' then begin
                    if responseJson.ReadFrom(ResponseText) then begin
                        if ParseErrorMessage(ResponseText, ErrorMsg) then
                            Error('API Error: %1', ErrorMsg);

                        if responseJson.Get('crmid', tokenValue) then begin
                            if tokenValue.IsValue then begin
                                tokenString := tokenValue.AsValue().AsText();
                                Rec."CRM ID" := CopyStr(tokenString, 1, MaxStrLen(Rec."CRM ID"));
                                Rec.Modify(false);
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