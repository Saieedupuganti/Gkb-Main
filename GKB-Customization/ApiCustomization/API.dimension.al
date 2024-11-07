page 50310 DimensionApi
{
    PageType = API;
    Caption = 'Dimension API';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'dimension';
    EntitySetName = 'dimensions';
    SourceTable = Dimension;
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
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(codeCaption; Rec."Code Caption")
                {
                    Caption = 'Code Caption';
                }
                field(filterCaption; Rec."Filter Caption")
                {
                    Caption = 'Filter Caption';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(consolidationCode; Rec."Consolidation Code")
                {
                    Caption = 'Consolidation Code';
                }
                field(mapToICDimensionCode; Rec."Map-to IC Dimension Code")
                {
                    Caption = 'Map-to IC Dimension Code';
                }
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                }
            }
        }
    }
}


tableextension 50310 "Dimension CRM" extends "Dimension"
{
    fields
    {
        field(50101; "CRM ID"; Text[100])
        {
            Caption = 'CRM Id';
        }
    }
}