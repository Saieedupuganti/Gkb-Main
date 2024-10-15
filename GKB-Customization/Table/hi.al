tableextension 50201 "Sales Order Ext" extends "Sales Header"
{
    fields
    {
        field(50200; RichText; Blob)
        {
            Caption = 'Rich Text';
            DataClassification = CustomerContent;
        }
    }
}
