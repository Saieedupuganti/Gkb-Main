pageextension 50201 "Sales Order Ext" extends "Sales Order"
{
    Caption = 'Test Sales Order';
    layout
    {
        addafter(General)
        {
            group("Rich Text")
            {
                Caption = 'Rich Text';
                field(RichText; RichTextVar)
                {
                    ApplicationArea = all;
                    // Caption = 'Custom Rich Text';
                    MultiLine = true;
                    ExtendedDatatype = RichContent;
                    ShowCaption = false;


                    trigger OnValidate()
                    begin
                        Rec.SetRichText(RichTextVar);
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        RichTextVar := Rec.GetRichText()
    end;

    var
        RichTextVar: Text;


}


//     trigger OnAfterGetRecord()
//     begin
//         GetRichText();
//     end;

//     local procedure GetRichText()
//     var
//         RichTextInS: InStream;
//     begin
//         Rec.CalcFields(RichText);
//         Rec.RichText.CreateInStream(RichTextInS, TextEncoding::UTF8);
//         RichTextInS.Read(RichTextVar);
//     end;

//     local procedure SetRichText()
//     var
//         RichTextOutS: OutStream;
//     begin
//         Rec.RichText.CreateOutStream(RichTextOutS, TextEncoding::UTF8);
//         RichTextOutS.Write(RichTextVar);
//         Rec.Modify(true);
//     end;
// }