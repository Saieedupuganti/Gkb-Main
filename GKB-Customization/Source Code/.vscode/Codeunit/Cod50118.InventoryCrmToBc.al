tableextension 50202 "Inventory Adj Update" extends "Item Ledger Entry"
{
    fields
    {
        field(50200; Comment; Text[200])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }
    }
}
pageextension 50362 "Item LedgEntry Ext" extends "Item ledger Entries"
{
    layout
    {
        addafter("Location Code")
        {
            field(Comment; Rec.Comment)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
//     trigger OnAfterInsert()
//     var
//         entries: Record "Item Ledger Entry";
//         payload: JsonObject;

//         Client: HttpClient;
//         Content: HttpContent;
//         ContentHeaders: HttpHeaders;
//         Response: HttpResponseMessage;
//         ResponseText: Text;
//         InventoryJson: JsonObject;
//         JsonText: Text;
//         Item: Record Item;
//         IsSuccessful: Boolean;
//         UnitOfMeasure: Record "Unit of Measure";
//         Location: Record Location;
//         MaxRetries: Integer;
//         RetryCount: Integer;
//         TimeoutMs: Integer;
//         ErrorMsg: Text;
//         ItemNo: Code[20];
//         UOMCode: Code[10];
//         LocationCode: Code[10];
//         Quantity: Decimal;
//         adjResponse: JsonToken;
//     begin
//         Quantity := 0;
//         entries.SetFilter("Item No.", Rec."Item No.");
//         entries.SetFilter("Location Code", Rec."Location Code");

//         if entries.FindSet() then
//             repeat
//                 Quantity := Quantity + entries.Quantity;
//             until entries.Next() = 0;

//         Clear(InventoryJson);

//         ItemNo := Rec."Item No.";
//         Item.Get(ItemNo);
//         InventoryJson.Add('productcrmid', Item."CRM ID");
//         InventoryJson.Add('quantity', Quantity);

//         UOMCode := Item."Base Unit of Measure";
//         if UOMCode <> '' then begin
//             UnitOfMeasure.Get(UOMCode);
//             InventoryJson.Add('unitcrmid', UnitOfMeasure."CRM ID");
//         end;

//         LocationCode := Rec."Location Code";
//         if LocationCode <> '' then begin
//             Location.Get(LocationCode);
//             InventoryJson.Add('warehousecrmid', Location."CRM ID");
//             InventoryJson.Add('adjustmentcrmid', Location."Adjustment Crm Id");
//         end;

//         // Content.WriteFrom(JsonText);
//         Content.GetHeaders(ContentHeaders);
//         ContentHeaders.Clear();
//         ContentHeaders.Add('Content-Type', 'application/json');
//         ContentHeaders.Add('Content-Encoding', 'UTF8');

//         InventoryJson.WriteTo(JsonText);
//         Content.WriteFrom(JsonText);
//         Message(JsonText);
//         IsSuccessful := Client.Post('https://prod-01.australiasoutheast.logic.azure.com:443/workflows/4392f4646a9b459cbc69c2a3d1b03306/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=bmINoReceAMr3bYtof19_gola-w9hw_eFl6ri0JwXJQ', Content, Response);
//         // Response.Content().ReadAs(ResponseText);

//         if IsSuccessful then begin
//             Response.Content().ReadAs(ResponseText);
//             if ResponseText <> '' then begin
//                 if InventoryJson.ReadFrom(ResponseText) then begin
//                     if ParseErrorMessage(ResponseText, ErrorMsg) then
//                         Error('API Error: %1', ErrorMsg);
//                     InventoryJson.Get('adjustmentcrmid', adjResponse);
//                     Location."Adjustment Crm Id" := adjResponse.AsValue().AsText();
//                     Location.Modify(false);
//                 end else
//                     Error('HTTP request failed. Status code: %1', Response.HttpStatusCode);
//             end;
//         end;
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