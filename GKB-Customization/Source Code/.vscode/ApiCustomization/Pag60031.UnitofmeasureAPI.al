// page 60031 "Unit of measure API"
// {
//     APIPublisher = 'integration';
//     APIGroup = 'api';
//     APIVersion = 'v1.0', 'v2.0';
//     ApplicationArea = All;
//     Caption = 'Unit Of MeasureAPI';
//     DelayedInsert = true;
//     EntitySetName = 'UnitOfMeasure';
//     EntityName = 'UnitOfMeasure';
//     PageType = API;
//     SourceTable = "Unit of Measure";
//     ODataKeyFields = SystemId;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field(id; Rec.SystemId)
//                 {
//                     Caption = 'Id';
//                     Editable = false;
//                 }
//                 field("CRMID";Rec."CRM ID")
//                 {
//                     Caption = 'CRM Id';
//                 }
//                 field("code"; Rec.Code)
//                 {
//                     Caption = 'Code';
//                     ShowMandatory = true;

//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo(Code));
//                     end;
//                 }
//                 field(displayName; Rec.Description)
//                 {
//                     Caption = 'Display Name';

//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo(Description));
//                     end;
//                 }
//                 field(internationalStandardCode; Rec."International Standard Code")
//                 {
//                     Caption = 'International Standard Code';

//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("International Standard Code"));
//                     end;
//                 }
//                 field(symbol; Rec.Symbol)
//                 {
//                     Caption = 'Symbol';

//                     trigger OnValidate()
//                     begin
//                         RegisterFieldSet(Rec.FieldNo("Symbol"));
//                     end;
//                 }
//                 field(lastModifiedDateTime; Rec.SystemModifiedAt)
//                 {
//                     Caption = 'Last Modified Date';
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     var
//         GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
//         UnitofMeasureRecordRef: RecordRef;
//     begin
//         Rec.Insert(true);

//         UnitofMeasureRecordRef.GetTable(Rec);
//         GraphMgtGeneralTools.ProcessNewRecordFromAPI(UnitofMeasureRecordRef, TempFieldSet, CurrentDateTime());
//         UnitofMeasureRecordRef.SetTable(Rec);

//         exit(false);
//     end;

//     var
//         TempFieldSet: Record 2000000041 temporary;

//     local procedure RegisterFieldSet(FieldNo: Integer)
//     begin
//         if TempFieldSet.Get(DATABASE::"Unit of Measure", FieldNo) then
//             exit;

//         TempFieldSet.Init();
//         TempFieldSet.TableNo := DATABASE::"Unit of Measure";
//         TempFieldSet.Validate("No.", FieldNo);
//         TempFieldSet.Insert(true);
//     end;
// }



