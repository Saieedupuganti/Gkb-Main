codeunit 50133 "Inventory Update Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesLine(SalesInvHdrNo: Code[20])
    var
        salesLine: Record "Sales Invoice Line";
    begin
        // Trigger after Sales Order Shipment
        salesLine.Reset();
        salesLine.SetRange("Document No.", SalesInvHdrNo);
        salesLine.SetFilter(Quantity, '>%1', 0);
        if salesLine.FindSet() then
            repeat
                UpdateInventoryRecord(SalesLine."No.", SalesLine."Unit of Measure Code", SalesLine."Location Code", SalesLine.Quantity);
            until salesLine.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::Item, 'OnAfterValidateEvent', Inventory, true, true)]
    local procedure OnAfterValidateEvent(var Rec: Record Item)
    begin
        UpdateInventoryRecord(Rec."No.", Rec."Base Unit of Measure", Rec."Location Filter", Rec.Inventory);
    end;

    local procedure UpdateInventoryRecord(ItemNo: Code[20]; UOMCode: Code[10]; LocationCode: Code[10]; Quantity: Decimal)
    var
        Client: HttpClient;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        Response: HttpResponseMessage;
        ResponseText: Text;
        InventoryJson: JsonObject;
        JsonText: Text;
        Item: Record Item;
        IsSuccessful: Boolean;
        UnitOfMeasure: Record "Unit of Measure";
        Location: Record Location;
        MaxRetries: Integer;
        RetryCount: Integer;
        TimeoutMs: Integer;
        ErrorMsg: Text;
    begin

        // Content.WriteFrom(JsonText);
        Content.GetHeaders(ContentHeaders);
        ContentHeaders.Clear();
        ContentHeaders.Add('Content-Type', 'application/json');
        ContentHeaders.Add('Content-Encoding', 'UTF8');



        if not Item.Get(ItemNo) then
            Error('Item %1 not found.', ItemNo);
        if not UnitOfMeasure.Get(UOMCode) then
            Error('Unit of Measure %1 not found.', UOMCode);
        if not Location.Get(LocationCode) then
            Error('Location %1 not found.', LocationCode);


        if Item."CRM ID" = '' then
            Error('Product CRM ID is missing for item %1.', ItemNo);
        if UnitOfMeasure."CRM ID" = '' then
            Error('Unit CRM ID is missing for UOM %1.', UOMCode);
        if Location."CRM ID" = '' then
            Error('Warehouse CRM ID is missing for location %1.', LocationCode);


        Clear(InventoryJson);
        InventoryJson.Add('adjustmentcrmid', Location."Adjustment Crm Id");
        // InventoryJson.Add('adjustmentcrmid', Format(CreateGuid()));
        InventoryJson.Add('warehousecrmid', Location."CRM ID");
        InventoryJson.Add('productcrmid', Item."CRM ID");
        InventoryJson.Add('unitcrmid', UnitOfMeasure."CRM ID");
        InventoryJson.Add('quantity', Quantity);

        InventoryJson.WriteTo(JsonText);
        Content.WriteFrom(JsonText);

        IsSuccessful := Client.Post('https://prod-01.australiasoutheast.logic.azure.com:443/workflows/4392f4646a9b459cbc69c2a3d1b03306/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=bmINoReceAMr3bYtof19_gola-w9hw_eFl6ri0JwXJQ', Content, Response);
        Response.Content().ReadAs(ResponseText);

        if IsSuccessful then begin
            Response.Content().ReadAs(ResponseText);
            //         if ResponseText <> '' then begin
            //             if InventoryJson.ReadFrom(ResponseText) then begin
            //                 if ParseErrorMessage(ResponseText, ErrorMsg) then
            //                     Error('API Error: %1', ErrorMsg);

            //             end else
            //                 Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);
            //         end;
        end;
    end;

    // local procedure ParseErrorMessage(ResponseText: Text; var ErrorMessage: Text): Boolean
    // var
    //     JsonObject: JsonObject;
    //     ErrorToken: JsonToken;
    //     ErrorObject: JsonObject;
    //     MessageToken: JsonToken;
    // begin
    //     if JsonObject.ReadFrom(ResponseText) then begin
    //         if JsonObject.Get('error', ErrorToken) then begin
    //             if ErrorToken.IsObject then begin
    //                 ErrorObject := ErrorToken.AsObject();
    //                 if ErrorObject.Get('message', MessageToken) then begin
    //                     if MessageToken.IsValue then begin
    //                         ErrorMessage := MessageToken.AsValue().AsText();
    //                         exit(true);
    //                     end;
    //                 end;

    //                 ErrorObject.WriteTo(ErrorMessage);
    //                 exit(true);
    //             end;
    //         end;
    //     end;
    //     ErrorMessage := ResponseText;
    //     exit(false);
    // end;
}