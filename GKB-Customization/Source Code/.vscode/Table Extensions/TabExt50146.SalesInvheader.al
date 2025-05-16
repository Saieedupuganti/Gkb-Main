tableextension 50146 "GKBSales Invoice HeaderExt" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50032; "Customer PO Number"; Text[100])
        {
            Caption = 'Customer PO Number';
            DataClassification = ToBeClassified;
        }
        field(50033; "Address 3"; Text[100])
        {
            Caption = 'Address 3';
            DataClassification = ToBeClassified;
        }
    }
}
pageextension 50349 "Posted Sale Inv Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("Customer PO Number"; Rec."Customer PO Number")
            {
                ApplicationArea = All;
            }
        }
        addafter("Bill-to Address 2")
        {
            field("Address 3"; Rec."Address 3")
            {
                ApplicationArea = All;
            }
        }
    }
}
