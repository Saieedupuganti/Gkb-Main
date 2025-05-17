tableextension 50119 "GKBPurchase HeaderExt" extends "Purchase Header"
{

    fields
    {
        modify("Vendor Invoice No.")
        {
            trigger OnBeforeValidate()

            begin
                if Rec."Vendor Invoice No." = '' then
                    exit;
            end;
        }
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Created By"; Code[20])
        {
            Caption = 'Created By';
        }
        field(50102; "Ordered By"; Code[20])
        {
            Caption = 'Ordered By';
            TableRelation = Employee."First Name";
            ValidateTableRelation = false;

        }
        field(50103; "Address 3"; Text[100])
        {
            Caption = 'Address 3';
        }
        field(50107; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50108; "Job No"; Code[50])
        {
            Caption = 'Work Order No.';
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(50110; "Delivery Docket No."; Code[50])
        {
            Caption = 'Delivery Docket No.';
            DataClassification = ToBeClassified;
        }
    }
    trigger OnInsert()
    var
        user: Record "User Setup";
    begin
        IF User.GET(USERID) THEN
            Rec."Created By" := User."User ID";
    end;

}

