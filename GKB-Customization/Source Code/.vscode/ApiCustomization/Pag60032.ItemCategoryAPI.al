page 60032 "Item Category API"
{
    APIGroup = 'integration';
    APIPublisher = 'api';
    APIVersion = 'v1.0','v2.0';
    ApplicationArea = All;
    Caption = 'itemCategoryAPI';
    DelayedInsert = true;
    EntityName = 'itemcategoryapi';
    EntitySetName = 'itemcategoryapi';
    PageType = API;
    SourceTable = "Item Category";
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                
                field("code"; Rec.Code)
                {
                    Caption = 'Code';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Code));
                    end;
                }
                field(displayName; Rec.Description)
                {
                    Caption = 'Description';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Description));
                    end;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        ItemCategory: Record "Item Category";
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        ItemCategoryRecordRef: RecordRef;
    begin
        ItemCategory.SetRange(Code, Rec.Code);
        if not ItemCategory.IsEmpty() then
            Rec.Insert();

        Rec.Insert(true);

        ItemCategoryRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(ItemCategoryRecordRef, TempFieldSet, CurrentDateTime());
        ItemCategoryRecordRef.SetTable(Rec);

        Rec.Modify(true);
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        ItemCategory: Record "Item Category";
    begin
        ItemCategory.GetBySystemId(Rec.SystemId);

        if Rec.Code = ItemCategory.Code then
            Rec.Modify(true)
        else begin
            ItemCategory.TransferFields(Rec, false);
            ItemCategory.Rename(Rec.Code);
            Rec.TransferFields(ItemCategory);
        end;
    end;

    var
        TempFieldSet: Record 2000000041 temporary;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::"Item Category", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::"Item Category";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;
}

