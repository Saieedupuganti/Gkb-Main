codeunit 50121 "JobNoWOlsUpdate"
{
    [EventSubscriber(ObjectType::Table, Database::"GKB Work Order Lines", 'OnAfterValidateEvent', 'Code', false, false)]
    local procedure UpdateVendorDetailsOnItemChange(var Rec: Record "GKB Work Order Lines")
    var
        WO: Record "GKB Work Order";
    begin
        WO.SetRange("Work Order No.", Rec."Work Order No.");
        if WO.FindFirst() then begin
            Rec."Job No." := WO."Job No.";
        end;
    end;
}