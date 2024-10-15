pageextension 50201 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter(General)
        {
            group(RichTextGroup)
            {
                Caption = 'Rich Text Group';
                field(RichText; RichTextVar)
                {
                    Caption = 'Rich Text';
                    MultiLine = true;
                    ExtendedDatatype = RichContent;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        SetRichText();
                    end;
                }
            }
        }
    }
    var
        RichTextVar: Text;

    trigger OnAfterGetRecord()
    begin
        GetRichText();
    end;

    local procedure GetRichText()
    var
        RichTextInS: InStream;
    begin
        Rec.CalcFields(RichText);
        Rec.RichText.CreateInStream(RichTextInS, TextEncoding::UTF8);
        RichTextInS.Read(RichTextVar);
    end;

    local procedure SetRichText()
    var
        RichTextOutS: OutStream;
    begin
        Rec.RichText.CreateOutStream(RichTextOutS, TextEncoding::UTF8);
        RichTextOutS.Write(RichTextVar);
        Rec.Modify(true);
    end;
}