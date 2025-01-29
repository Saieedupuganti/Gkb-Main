// codeunit 50133 "Inventory Update Subscribers"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', false, false)]
//     local procedure OnAfterPostSalesLine(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; PreviewMode: Boolean)
//     begin
//         if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
//             UpdateInventoryRecord(SalesLine."No.", SalesLine."Unit of Measure Code", SalesLine."Location Code", SalesLine."Quantity Shipped", 'Sales');
//         end;
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchLine', '', false, false)]
//     local procedure OnAfterPostPurchLine(var PurchHeader: Record "Purchase Header"; var PurchLine: Record "Purchase Line"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; PreviewMode: Boolean)
//     begin
//         if PurchHeader."Document Type" = PurchHeader."Document Type"::Order then begin
//             UpdateInventoryRecord(PurchLine."No.", PurchLine."Unit of Measure Code", PurchLine."Location Code", PurchLine."Quantity Received", 'Purchase');
//         end;
//     end;

//     local procedure UpdateInventoryRecord(ItemNo: Code[20]; UOMCode: Code[10]; LocationCode: Code[10]; Quantity: Decimal; TransactionType: Text[10])
//     var
//         Client: HttpClient;
//         Content: HttpContent;
//         ContentHeaders: HttpHeaders;
//         IsSuccessful: Boolean;
//         Response: HttpResponseMessage;
//         ResponseText: Text;
//         inventoryJson: JsonObject;
//         responseJson: JsonObject;
//         jsonText: Text;
//         tokenValue: JsonToken;
//         tokenString: Text;
//         MaxRetries: Integer;
//         RetryCount: Integer;
//         TimeoutMs: Integer;
//         ErrorMsg: Text;
//         Item: Record Item;
//         UnitOfMeasure: Record "Unit of Measure";
//         Location: Record Location;
//         InventoryAdjustment: Record "Item Journal Line";
//     begin
//         // Validate records exist
//         if not Item.Get(ItemNo) then
//             Error('Item %1 not found.', ItemNo);
//         if not UnitOfMeasure.Get(UOMCode) then
//             Error('Unit of Measure %1 not found.', UOMCode);
//         if not Location.Get(LocationCode) then
//             Error('Location %1 not found.', LocationCode);

//         // Validate CRM IDs exist
//         if Item."CRM ID" = '' then
//             Error('Product CRM ID is missing for item %1.', ItemNo);
//         if UnitOfMeasure."CRM ID" = '' then
//             Error('Unit CRM ID is missing for UOM %1.', UOMCode);
//         if Location."CRM ID" = '' then
//             Error('Warehouse CRM ID is missing for location %1.', LocationCode);

//         // Create temporary adjustment record to get Adjustment ID
//         InventoryAdjustment.Init();
//         InventoryAdjustment."Journal Template Name" := 'ITEM';
//         InventoryAdjustment."Journal Batch Name" := 'DEFAULT';
//         InventoryAdjustment."Line No." := 10000;
//         InventoryAdjustment."Posting Date" := Today;
//         InventoryAdjustment."Document No." := Format(CreateGuid());
//         InventoryAdjustment."CRM ID" := Format(CreateGuid()); // Assuming you have this field

//         MaxRetries := 3;
//         RetryCount := 0;
//         TimeoutMs := 120000;
//         Client.Timeout(TimeoutMs);

//         Content.GetHeaders(ContentHeaders);
//         ContentHeaders.Clear();
//         ContentHeaders.Add('Content-Type', 'application/json');
//         ContentHeaders.Add('Content-Encoding', 'UTF8');

//         // Create JSON object
//         Clear(inventoryJson);
//         inventoryJson.Add('adjustmentcrmid', InventoryAdjustment."CRM ID");
//         inventoryJson.Add('warehousecrmid', Location."CRM ID");
//         inventoryJson.Add('productcrmid', Item."CRM ID");
//         inventoryJson.Add('unitcrmid', UnitOfMeasure."CRM ID");
//         inventoryJson.Add('quantity', Quantity);
//         inventoryJson.Add('transactiontype', TransactionType);
//         inventoryJson.WriteTo(jsonText);
//         Content.WriteFrom(jsonText);

//         // Retry logic for HTTP request
//         repeat
//             RetryCount += 1;
//             Clear(Response);

//             IsSuccessful := Client.Post('https://prod-01.australiasoutheast.logic.azure.com:443/workflows/4392f4646a9b459cbc69c2a3d1b03306/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=bmINoReceAMr3bYtof19_gola-w9hw_eFl6ri0JwXJQ', Content, Response);

//             if IsSuccessful then begin
//                 Response.Content().ReadAs(ResponseText);

//                 if ResponseText <> '' then begin
//                     if responseJson.ReadFrom(ResponseText) then begin
//                         if ParseErrorMessage(ResponseText, ErrorMsg) then
//                             Error('API Error: %1', ErrorMsg);

//                         // Handle successful response
//                         exit;
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