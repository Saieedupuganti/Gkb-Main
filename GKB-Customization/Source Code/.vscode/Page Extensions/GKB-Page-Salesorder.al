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
            field(Name; Rec.Name)
             { ApplicationArea = all;
             Caption = 'Sales order Name'; }
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