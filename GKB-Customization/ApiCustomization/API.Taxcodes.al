// Not Done have to work on

page 50311 TaxcodesApi
{
    PageType = API;
    Caption = 'Currency';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'Taxcodes';
    EntitySetName = 'Taxcodes';
    SourceTable = "VAT Product Posting Group";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                }
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM Id';
                }
                field(Description; Rec."Description")
                {
                    Caption = 'Description';
                }
            
            }
        }
    }
}

tableextension 50309 "Tax Codes CRM" extends "VAT Product Posting Group"
{
    fields
    {
        field(50101;"CRM ID";Text[100])
        {
            Caption='CRM Id';
        }
    }
}
