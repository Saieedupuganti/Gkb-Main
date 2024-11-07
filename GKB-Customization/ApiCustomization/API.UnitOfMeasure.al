page 50304 "API UOM"
{
    PageType = API;
    Caption = 'API UOM';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'uom';
    EntitySetName = 'uom';
    SourceTable = "Unit of Measure";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(code; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }
}

tableextension 50341 "UnitOfMeasureExt" extends "Unit of Measure"
{
    trigger OnBeforeInsert()
    begin
        // Check if the Code field is empty and generate a new code if needed
        if Rec."Code" = '' then
            Rec."Code" := GetNextAvailableCode();
    end;

    local procedure GetNextAvailableCode(): Code[20]
    var
        LastUOM: Record "Unit of Measure";
        NewCodeInt: Integer;
    begin
        // Find the last existing Code and increment it for the new record
        if LastUOM.FindLast() then begin
            if Evaluate(NewCodeInt, LastUOM."Code") then
                NewCodeInt := NewCodeInt + 1
            else
                Error('Code field contains non-numeric characters and cannot be auto-incremented.');
        end else
            NewCodeInt := 1;

        exit(Format(NewCodeInt));
    end;
}

tableextension 50304 "API UOM" extends "Unit of Measure"
{
    fields
    {
        field(50100; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
    }
}