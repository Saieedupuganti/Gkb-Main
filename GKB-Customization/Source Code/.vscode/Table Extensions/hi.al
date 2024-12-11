tableextension 50201 "Sales Order Ext" extends "Sales Header"
{
    fields
    {

    }



    // procedure SetRichText(NewRichText: Text)
    // var
    //     OutStream: OutStream;
    // begin
    //     Clear(RichText);
    //     RichText.CreateOutStream(OutStream, TEXTENCODING::UTF8);
    //     OutStream.WriteText(NewRichText);
    //     Modify();
    // end;

    // procedure GetRichText() RichText1: Text
    // var
    //     type: codeunit "type helper";
    //     InStream: InStream;
    // begin
    //     CalcFields(RichText);
    //     RichText.CreateInStream(InStream, TEXTENCODING::UTF8);
    //     exit(type.TryReadAsTextWithSepAndFieldErrMsg(InStream, type.LFSeparator(), FieldName(RichText)));
    // end;
}