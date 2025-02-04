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

        addafter("Sell-to Address 2")
        {
            field("Address 3"; Rec."Bill-to address name")
            {
                ApplicationArea = all;
            }
            field("Sales Order Name";Rec."Sales Order Name")
            {
                ApplicationArea = all;
            }
        }
    }
    
    trigger OnAfterGetCurrRecord()
    begin
        RichTextVar := Rec.GetRichText();
    end;

    trigger OnAfterGetRecord()
    var
        CustomerRec: Record Customer;
    begin
        if CustomerRec.Get(Rec."Sell-to Customer No.") then begin
            Rec."D365 Bill-to Address 3" := CustomerRec."Address 3";
            CurrPage.Update(false);
        end;
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