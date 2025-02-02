tableextension 50118 "Requesion Line Ext" extends "Requisition Line"
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
            Caption = 'Vendor No';
            TableRelation = Vendor;
        }
        field(50130; "Crm Id"; Text[100])
        {
            Caption = 'Crm Id';
            DataClassification = ToBeClassified;
        }
        field(50104; "VendorName"; Text[100])
        {
            Caption = 'Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                Vendor: Record Vendor;
            begin
                if Rec."Vendor Name" <> '' then begin
                    if Vendor.Get(Rec."No.") then begin
                        Rec."Vendor No." := Vendor."No.";
                    end;
                end;
            end;
        }
        field(50105; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No." = FIELD("Vendor No.")));
        }
        field(50106; "Requested By Name"; Code[30])
        {
            Caption = 'Requested By Name';
            TableRelation = Employee."First Name";
            ValidateTableRelation = false;
        }
        field(50107; "Project Task No"; Code[30])
        {

            Caption = 'Project Task No';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD(projectNo));
        }
        field(50108; "Dimension Value"; Code[30])
        {
            TableRelation = "Dimension Value";
            Caption = 'Dimension Value';
            DataClassification = ToBeClassified;
        }
        field(50109; "Work Order No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "GKB Work Order";
            trigger OnValidate()
            var
                WorkOrder: Record "GKB Work Order";
            begin
                if xRec."Work Order No" <> Rec."Work Order No" then begin
                    WorkOrder.Reset();
                    if WorkOrder.Get(Rec."Work Order No") then begin
                        Rec."Project Task No" := WorkOrder."Project Task No";
                        Rec.projectNo := WorkOrder."Job No.";
                        Rec."Shortcut Dimension 1 Code" := WorkOrder."Shortcut Dimension 1 Code";
                    end;
                end;
            end;
        }
    }

    trigger OnInsert()
    var
        User: Record "User Setup";
    begin
        IF User.GET(USERID) THEN
            Rec."Requested By Name" := User."User ID";
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePLInsert(var PurchaseLine: Record "Purchase Line"; var IsHandled: Boolean)
    begin
    end;
}