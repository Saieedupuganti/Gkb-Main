tableextension 50125 "GKBSales HeaderExt" extends "Sales Header"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Work Details"; Blob)
        {
            Caption = 'Work Details';
            DataClassification = ToBeClassified;
            // ExtendedDatatype= RichContent
        }
        field(50200; RichText; Blob)
        {
            Caption = 'Rich Text';
            DataClassification = CustomerContent;
        }
    }

    var
        Readdataskippedmsg: Label 'Loading Field %1 Will be skipped because there was an error when reading tha date.';

    procedure SetRichText(RichText1: Text)
    var
        OutStream: OutStream;
    begin
        Clear(RichText);
        RichText.CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(RichText1);
        Modify();
    end;

    procedure GetRichText() TermConditions: Text
    var
        InStream: Instream;
        typehelper: Codeunit "Type Helper";
    begin
        CalcFields(RichText);
        RichText.CreateInStream(InStream, TextEncoding::UTF8);
        if not typehelper.TryReadAsTextWithSeparator(InStream, typehelper.LFSeparator(), TermConditions) then
            Message(Readdataskippedmsg, FieldCaption(RichText));
    end;

}
