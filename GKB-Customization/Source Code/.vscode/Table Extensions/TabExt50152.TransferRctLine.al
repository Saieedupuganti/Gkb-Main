tableextension 50152 "GKBTransfer Receipt LineExt" extends "Transfer Receipt Line"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Transfer Note"; Text[200])
        {
            Caption = 'Transfer Note';
            DataClassification = ToBeClassified;
        }
    }
}
pageextension 50361 "TransfrReciept Ext" extends "Posted Transfer Rcpt. Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Transfer Note"; Rec."Transfer Note")
            {
                ApplicationArea = all;
            }
        }
    }
}
