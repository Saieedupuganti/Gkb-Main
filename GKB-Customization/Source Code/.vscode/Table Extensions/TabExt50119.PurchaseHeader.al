tableextension 50119 "GKBPurchase HeaderExt" extends "Purchase Header"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Created By"; Code[20])
        {
            Caption = 'Created By';
            //TableRelation = "User Setup"."User ID";
        }

        field(50102; "Ordered By"; Code[20])
        {
            Caption = 'Ordered By';
            TableRelation = Employee;
        }
        field(50103; "Address 3";Text[100])
        {
            Caption = 'Address 3';
        }
         field(50107; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
    }
    trigger OnInsert()
    var
        user: Record "User Setup";
        //userid: Code[50];
    begin
        IF User.GET(USERID) THEN 
        Rec."Created By" := User."User ID";
    end;

}

