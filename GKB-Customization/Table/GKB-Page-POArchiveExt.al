tableextension 50155 "Purchase Order Archive" extends "Purchase Header Archive"
{
    fields
    {
        field(1234; "Po Status"; enum "Purch header Archive")
        {
            Caption = 'Po Status';
        }
        field(1235;"Entry Type";Text[100])
        {
            Caption = 'Entry Type';
            DataClassification=ToBeClassified;
        }
    }
    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnDelete(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean)
    begin
    end;
}