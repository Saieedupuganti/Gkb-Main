page 50324 "API Item Journals"
{
    PageType = API;
    Caption = 'API Item Journals';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'inventory';
    EntitySetName = 'inventory';
    SourceTable = "Item Journal Line";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(uomcode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(uomcrmid; Rec."Unit of Measure Code CRMID")
                {
                    Caption = 'Unit of Measure Code crmid';
                }
                field(postinggroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }
                field(locationcode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(unitcost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(unitcostcrmid; Rec."Unit Cost CRMID")
                {
                    Caption = 'Unit Cost CRMID';
                }
            }
        }
    }
}

tableextension 50323 "Item Journals Ext" extends "Item Journal Line"
{
    fields
    {
        field(50101; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50102; "Unit of Measure Code CRMID"; Text[100])
        {
            Caption = 'Unit of Measure Code CRMID';
            DataClassification = ToBeClassified;
        }
        field(50103; "Unit Cost CRMID"; Text[100])
        {
            Caption = 'Unit Cost CRMID';
            DataClassification = ToBeClassified;
        }
    }
}
