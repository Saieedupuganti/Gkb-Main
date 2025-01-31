// codeunit 50119 "Ship-To Add Crm Management"
// {
//      procedure UpdateTheRecord()
//     var
//         Client: HttpClient;
//         Content: HttpContent;
//         ContentHeaders: HttpHeaders;
//         IsSuccessful: Boolean;
//         Response: HttpResponseMessage;
//         ResponseText: Text;
//         ShipToAddJson: JsonObject;
//         ResponseJson: JsonObject;
//         JsonText: Text;
//         TokenValue: JsonToken;
//         TokenString: Text;
//         CustomerRec: Record Customer;
//         ShipToAdd : Record "Ship-to Address";
//         MaxRetries: Integer;
//         RetryCount: Integer;
//         TimeoutMs: Integer;
//         ErrorMsg: Text;
//     begin
//         MaxRetries := 3;
//         RetryCount := 0;
//         TimeoutMs := 120000;
//         Client.Timeout(TimeoutMs);

//         Content.GetHeaders(ContentHeaders);
//         ContentHeaders.Clear();
//         ContentHeaders.Add('Content-Type', 'application/json');
//         ContentHeaders.Add('Content-Encoding', 'UTF8');

//         if not CustomerRec.Get(ShipToAdd."Customer No.") then
//             Error('Customer not found.');

//         // Validate CRM ID
//         if CustomerRec."CRM ID" = '' then
//             Error('Customer CRM ID is missing.');

//         // Create JSON object
//         Clear(ShipToAddJson);
//         ShipToAddJson.Add('customerNo', CustomerRec."CRM ID");
//         ShipToAddJson.Add('code', ShipToAdd.Code);
//         ShipToAddJson.Add('crmId', ShipToAdd."Crm Id");
//         ShipToAddJson.Add('name', ShipToAdd.Name);
//         ShipToAddJson.Add('address', ShipToAdd.Address);
//         ShipToAddJson.Add('address2', ShipToAdd."Address 2");
//         ShipToAddJson.Add('address3', ShipToAdd."Address 3");
//         ShipToAddJson.Add('city', ShipToAdd."D365 City");
//         ShipToAddJson.Add('state', ShipToAdd."D365 State");
//         ShipToAddJson.Add('postCode', ShipToAdd."Postal Code");
//         ShipToAddJson.Add('country', ShipToAdd."D365 Country");
//         ShipToAddJson.Add('phone', ShipToAdd."Phone No.");
//         ShipToAddJson.Add('email', ShipToAdd."E-Mail");
//         ShipToAddJson.WriteTo(JsonText);
//         Content.WriteFrom(JsonText);

//         repeat
//             RetryCount += 1;
//             Clear(Response);

//             IsSuccessful := Client.Post('https://prod-30.australiasoutheast.logic.azure.com:443/workflows/9f3c11f2010d4a9b8bd5fc42a7601768/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=2C7E9P8G3WT18Fi4rP-2nDdXTyGT406DKHQ3cMhN9LI', Content, Response);

//             if IsSuccessful then begin
//                 Response.Content().ReadAs(ResponseText);

//                 if ResponseText <> '' then begin
//                     if ResponseJson.ReadFrom(ResponseText) then begin
//                         if ParseErrorMessage(ResponseText, ErrorMsg) then
//                             Error('API Error: %1', ErrorMsg);

//                         if ResponseJson.Get('crmId', TokenValue) then begin
//                             if TokenValue.IsValue then begin
//                                 TokenString := TokenValue.AsValue().AsText();
//                                 ShipToAdd."Crm Id" := CopyStr(TokenString, 1, MaxStrLen(ShipToAdd."Crm Id"));
//                                 ShipToAdd.Modify(false);
//                                 exit;codeunit 50118 "Ship-to Address CRM Integration"
// {
//     procedure CreateShipToInCRM(ShipToRec: Record "Ship-to Address"): Boolean
//     var
//         Client: HttpClient;
//         Content: HttpContent;
//         ContentHeaders: HttpHeaders;
//         Response: HttpResponseMessage;
//         ResponseText: Text;
//         JObject: JsonObject;
//         ResponseJson: JsonObject;
//         JsonText: Text;
//         CRMId: Text;
//         MaxRetries: Integer;
//         RetryCount: Integer;
//         TimeoutMs: Integer;
//         ErrorMsg: Text;
//     begin
//         MaxRetries := 3;
//         RetryCount := 0;
//         TimeoutMs := 120000;
//         Client.Timeout(TimeoutMs);

//         // Validate Ship-to Address record before creating
//         if not ValidateShipToFields(ShipToRec) then
//             exit(false);

//         Content.GetHeaders(ContentHeaders);
//         ContentHeaders.Clear();
//         ContentHeaders.Add('Content-Type', 'application/json');
//         ContentHeaders.Add('Content-Encoding', 'UTF8');

//         JObject := CreateShipToJson(ShipToRec);
//         JObject.WriteTo(JsonText);
//         Content.WriteFrom(JsonText);

//         repeat
//             RetryCount += 1;
//             Clear(Response);

//             if Client.Post('https://your-crm-endpoint.com/api/shiptoaddresses', Content, Response) then begin
//                 Response.Content().ReadAs(ResponseText);

//                 if ResponseText <> '' then begin
//                     if ResponseJson.ReadFrom(ResponseText) then begin
//                         if ParseErrorMessage(ResponseText, ErrorMsg) then
//                             Error('API Error: %1', ErrorMsg);

//                         if GetCRMIdFromResponse(ResponseJson, CRMId) then begin
//                             ShipToRec."CRM ID" := CRMId;
//                             ShipToRec.Modify(true);
//                             exit(true);
//                         end;
//                         Error('Response does not contain valid CRM ID. Full response: %1', ResponseText);
//                     end;
//                     Error('Invalid JSON response: %1', ResponseText);
//                 end;
//                 Error('Empty response received from the server.');
//             end else
//                 Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);

//             if RetryCount < MaxRetries then
//                 Sleep(100 * RetryCount);

//         until (RetryCount >= MaxRetries);

//         Error('Failed to create Ship-to Address in CRM after %1 attempts. Last response: %2', MaxRetries, ResponseText);
//     end;

//     procedure UpdateShipToInCRM(ShipToRec: Record "Ship-to Address"): Boolean
//     var
//         Client: HttpClient;
//         Content: HttpContent;
//         ContentHeaders: HttpHeaders;
//         Response: HttpResponseMessage;
//         ResponseText: Text;
//         JObject: JsonObject;
//         ResponseJson: JsonObject;
//         JsonText: Text;
//         MaxRetries: Integer;
//         RetryCount: Integer;
//         TimeoutMs: Integer;
//         ErrorMsg: Text;
//     begin
//         MaxRetries := 3;
//         RetryCount := 0;
//         TimeoutMs := 120000;
//         Client.Timeout(TimeoutMs);

//         if not ValidateShipToFields(ShipToRec) then
//             exit(false);

//         if ShipToRec."CRM ID" = '' then
//             Error('CRM ID is required for update operation');

//         Content.GetHeaders(ContentHeaders);
//         ContentHeaders.Clear();
//         ContentHeaders.Add('Content-Type', 'application/json');
//         ContentHeaders.Add('Content-Encoding', 'UTF8');

//         JObject := CreateShipToJson(ShipToRec);
//         JObject.WriteTo(JsonText);
//         Content.WriteFrom(JsonText);

//         repeat
//             RetryCount += 1;
//             Clear(Response);

//             if Client.Put('https://your-crm-endpoint.com/api/shiptoaddresses/' + ShipToRec."CRM ID", Content, Response) then begin
//                 Response.Content().ReadAs(ResponseText);

//                 if ResponseText <> '' then begin
//                     if ResponseJson.ReadFrom(ResponseText) then begin
//                         if ParseErrorMessage(ResponseText, ErrorMsg) then
//                             Error('API Error: %1', ErrorMsg);
//                         exit(true);
//                     end;
//                     Error('Invalid JSON response: %1', ResponseText);
//                 end;
//                 Error('Empty response received from the server.');
//             end else
//                 Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);

//             if RetryCount < MaxRetries then
//                 Sleep(100 * RetryCount);

//         until (RetryCount >= MaxRetries);

//         Error('Failed to update Ship-to Address in CRM after %1 attempts. Last response: %2', MaxRetries, ResponseText);
//     end;

//     local procedure CreateShipToJson(ShipToRec: Record "Ship-to Address"): JsonObject
//     var
//         JObject: JsonObject;
//     begin
//         Clear(JObject);

//         // Basic Identifiers
//         JObject.Add('bcid', ShipToRec."Code");
//         JObject.Add('crmid', ShipToRec."CRM ID");
//         JObject.Add('name', ShipToRec.Name);
//         JObject.Add('address1_line1', ShipToRec.Address);
//         JObject.Add('address1_line2', ShipToRec."Address 2");
//         JObject.Add('address1_city', ShipToRec.City);
//         JObject.Add('address1_stateorprovince', ShipToRec.County);
//         JObject.Add('address1_country', ShipToRec."Country/Region Code");
//         JObject.Add('address1_postalcode', ShipToRec."Post Code");
//         JObject.Add('phone', ShipToRec."Phone No.");
//         JObject.Add('contact', ShipToRec.Contact);

//         exit(JObject);
//     end;

//     local procedure ValidateShipToFields(ShipToRec: Record "Ship-to Address"): Boolean
//     begin
//         if ShipToRec."Code" = '' then
//             Error('Ship-to Address Code is required');

//         if ShipToRec.Name = '' then
//             Error('Ship-to Address Name is required');

//         exit(true);
//     end;

//     local procedure GetCRMIdFromResponse(ResponseJson: JsonObject; var CRMId: Text): Boolean
//     var
//         Token: JsonToken;
//     begin
//         if ResponseJson.Get('crmid', Token) then begin
//             CRMId := Token.AsValue().AsText();
//             exit(true);
//         end;
//         exit(false);
//     end;

//     local procedure ParseErrorMessage(ResponseText: Text; var ErrorMessage: Text): Boolean
//     var
//         JsonObject: JsonObject;
//         ErrorToken: JsonToken;
//         ErrorObject: JsonObject;
//         MessageToken: JsonToken;
//     begin
//         if JsonObject.ReadFrom(ResponseText) then begin
//             if JsonObject.Get('error', ErrorToken) then begin
//                 if ErrorToken.IsObject then begin
//                     ErrorObject := ErrorToken.AsObject();
//                     if ErrorObject.Get('message', MessageToken) then
// ::contentReference[oaicite:0]{index=0}
 

//                             end;
//                         end;
//                         Error('Response does not contain valid CRM ID. Full response: %1', ResponseText);
//                     end;
//                     Error('Invalid JSON response: %1', ResponseText);
//                 end;
//                 Error('Empty response received from the server.');
//             end else
//                 Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);

//             if RetryCount < MaxRetries then
//                 Sleep(100 * RetryCount);

//         until (RetryCount >= MaxRetries);

//         Error('Failed to update CRM ID after %1 attempts. Last response: %2', MaxRetries, ResponseText);
//     end;

//     local procedure ParseErrorMessage(ResponseText: Text; var ErrorMessage: Text): Boolean
//     var
//         JsonObject: JsonObject;
//         ErrorToken: JsonToken;
//         ErrorObject: JsonObject;
//         MessageToken: JsonToken;
//     begin
//         if JsonObject.ReadFrom(ResponseText) then begin
//             if JsonObject.Get('error', ErrorToken) then begin
//                 if ErrorToken.IsObject then begin
//                     ErrorObject := ErrorToken.AsObject();
//                     if ErrorObject.Get('message', MessageToken) then begin
//                         if MessageToken.IsValue then begin
//                             ErrorMessage := MessageToken.AsValue().AsText();
//                             exit(true);
//                         end;
//                     end;

//                     ErrorObject.WriteTo(ErrorMessage);
//                     exit(true);
//                 end;
//             end;
//         end;
//         ErrorMessage := ResponseText;
//         exit(false);
//     end;
// }