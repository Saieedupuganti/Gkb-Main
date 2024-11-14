tableextension 50210 "Item Creation Power Automate" extends Item
{
  fields
  {

  }
  
  
  var
    myInt: Integer;

    trigger OnAfterModify()
  var
      HttpClient: HttpClient;
      HttpContent: HttpContent;
      Response: HttpResponseMessage;
      JsonObject: JsonObject;
      JsonField: Text;
      ContentType: Text;
      PowerAutomateURL: Text;
      ContentHeaders: HttpHeaders;
      ResponseText:Text;
      RequestHeaders:HttpHeaders;
  begin
      HttpContent.GetHeaders(ContentHeaders);


      if not ContentHeaders.Contains('Content-Type') then
        ContentHeaders.Add('Content-Type', 'application/json');
      
      if not ContentHeaders.Contains('Content-Encoding') then
        ContentHeaders.Add('Content-Encoding', 'UTF8');

      HttpContent.GetHeaders(RequestHeaders);
      RequestHeaders.Add('Accept', 'application/json');
      RequestHeaders.Add('Accept-Encoding', 'utf-8');
      RequestHeaders.Add('Connection', 'Keep-alive');

      PowerAutomateURL := 'https://prod-28.australiasoutheast.logic.azure.com:443/workflows/7b639aebf03d48b589cb0cb4e242a43e/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=CBcPia0oWMebjYN00WLYwLb4Xr-lnSEztYIePQITywc';

      JsonObject.Add('no',Rec."No.");
      JsonObject.Add('description', Description);
      JsonObject.Add('unitprice', "Unit Price");

      JsonObject.WriteTo(JsonField);
      Message(Format(JsonObject));
      Message(JsonField);
      HttpContent.WriteFrom(JsonField);
      // Message(HttpContent);
      ContentType := 'application/json';

      // Send the HTTP POST request
      if HttpClient.Post(PowerAutomateURL, HttpContent, Response) then begin
        Response.Content().ReadAs(ResponseText);
        Message(ResponseText);
      end else begin
          Message('Error');
      end;
  end;

}