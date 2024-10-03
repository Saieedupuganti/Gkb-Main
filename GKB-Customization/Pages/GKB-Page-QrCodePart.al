page 50200 "Qr Code"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Item;
    // Caption = 'Qr Code';

    layout
    {
        area(Content)
        {
            field(QrCode; Rec.QrCode)
            {
                ApplicationArea = all;

            }
        }

    }
    trigger OnOpenPage()
    var
        HttpClient: HttpClient;
        HttpResponseMessage: HttpResponseMessage;
        InStream: InStream;
    begin
        HttpClient.Get('https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' + Rec."No.", HttpResponseMessage);
        if HttpResponseMessage.IsSuccessStatusCode then begin
            HttpResponseMessage.Content().ReadAs(InStream);
            Rec.QrCode.CreateInStream(InStream);
            Rec.Modify(true);
        end;
    end;


}