tableextension 50150 "GKBTransfer LineExt" extends "Transfer Line"
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
pageextension 50360 "Transfer Order Subform Ext" extends "Transfer Order Subform"
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