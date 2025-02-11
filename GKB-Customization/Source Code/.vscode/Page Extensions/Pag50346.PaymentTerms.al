tableextension 50158 "Customet PrcGrp Ext" extends "Customer Price Group"
{
    fields
    {
        field(50100; "Crm Id"; Text[100])
        {
            Caption = 'Crm Id';
            DataClassification = CustomerContent;
        }
    }
}
pageextension 50346 "Cust Prcgrp Exte" extends "Customer Price Groups"
{
    layout
    {
        addafter(Description)
        {
            field("Crm Id"; rec."Crm Id") { ApplicationArea = All; }
        }
    }
}
