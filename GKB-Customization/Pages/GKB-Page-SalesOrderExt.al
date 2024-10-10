// pageextension 50200 "Sales Order Ext" extends "Sales Order"
// {
//     layout
//     {
//         addafter(Status)
//         {
//             field("Work Details";Rec."Work Details")
//                 {
//                     Caption = 'Rich Text';
//                     MultiLine = true;
//                   //  ExtendedDatatype = RichContent;
//                     ApplicationArea = All;

//                     trigger OnValidate()
//                     begin
//                         SetRichText();
//                     end;
//                 }
//         }
//     }  
//     local procedure GetRichText()
//     var
//         RichTextInS: InStream;
//     begin
//         Rec.CalcFields("Work Details");
//         Rec."Work Details".CreateInStream(RichTextInS, TextEncoding::UTF8);
//         RichTextInS.Read(RichTextVar);
//     end;

//     local procedure SetRichText()
//     var
//         RichTextOutS: OutStream;
//     begin
//         Rec."Work Details".CreateOutStream(RichTextOutS, TextEncoding::UTF8);
//         RichTextOutS.Write(RichTextVar);
//         Rec.Modify(true);
//     end;

//      var
//         RichTextVar: BigText;

//         trigger OnAfterGetRecord()
//     begin
//         GetRichText();
//     end;

// }