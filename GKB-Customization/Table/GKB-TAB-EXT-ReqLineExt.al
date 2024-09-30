tableextension 50150 "Requesion Line Ext" extends "Requisition Line"
{
    fields
    {
        field(50102; "projectNo"; Code[30])
        {
            Caption = 'Project No.';
            TableRelation = Job;
        }
        field(50103; "AlternateVendorNo."; Code[30])
        {
            Caption = 'Vendor Name';
            TableRelation = Vendor;
        }
        field(50104; "VendorName"; Text[100])
        {
            Caption = 'Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
        }
        field(50105; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No." = FIELD("Vendor No.")));
        }


    }
    // [IntegrationEvent(false, false)]
    // local procedure OnBeforePLInsert(var PurchaseLine: Record "Purchase Line"; var IsHandled: Boolean)
    // begin
    // end;
}