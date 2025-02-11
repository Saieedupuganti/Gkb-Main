codeunit 50133 "Inventory Update Subscribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', false, false)]
    local procedure OnAfterPostSalesLine(var SalesLine: Record "Sales Line"; CommitIsSuppressed: Boolean; var SalesHeader: Record "Sales Header")
    begin
        // Trigger after Sales Order Shipment
        if (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) and (SalesLine.Quantity > 0) then begin
            UpdateInventoryRecord(
                SalesLine."No.",
                SalesLine."Unit of Measure Code",
                SalesLine."Location Code",
                SalesLine."Quantity Shipped"
            );
        end;
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

        Content.WriteFrom(JsonText);
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

        Clear(InventoryJson);
        InventoryJson.Add('adjustmentcrmid', Format(CreateGuid()));
        InventoryJson.Add('warehousecrmid', Location."CRM ID");
        InventoryJson.Add('productcrmid', Item."CRM ID");
        InventoryJson.Add('unitcrmid', UnitOfMeasure."CRM ID");
        InventoryJson.Add('quantity', Quantity);

        InventoryJson.WriteTo(JsonText);

        IsSuccessful := Client.Post('https://prod-01.australiasoutheast.logic.azure.com:443/workflows/4392f4646a9b459cbc69c2a3d1b03306/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=bmINoReceAMr3bYtof19_gola-w9hw_eFl6ri0JwXJQ', Content, Response);
        Response.Content().ReadAs(ResponseText);

        if IsSuccessful then begin
            Response.Content().ReadAs(ResponseText);

        end else
            Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);
    end;
}