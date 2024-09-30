// codeunit 50100 "ReqlineToPo"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeInsertEvent', '', false, false)]
//     local procedure OnBeforePLInsert()
//     begin
//         Error('hey there...Koties');
//     end;
// }