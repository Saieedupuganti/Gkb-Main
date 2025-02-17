tableextension 50101 "GKB Contacts Ext " extends Contact
{
    fields
    {
        field(50149; "D365 State"; Text[100])
        {
            Caption = 'State';
            DataClassification = ToBeClassified;
        }
        field(50148; "D365 Country"; Text[100])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
        }
        field(50147; "D365 City"; Text[100])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(50146; "D365 Postal Code"; Text[100])
        {
            Caption = 'PostCode';
            DataClassification = ToBeClassified;
        }
        field(50100; "D365 Contact ID"; Text[100])
        {
            Caption = 'Contact ID';
            DataClassification = ToBeClassified;
        }
        field(50101; "E-Mail Group Code"; Option)
        {
            Caption = 'E-Mail Group Code';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Account Payable,Accounts,Billing,Billing + Maintenance,Energy,Head Office Contact,Maintenance,Management,Managing Director,Orders,Sales,Statements,Training,Worksheet Email';
            OptionMembers = " ","Account Payable","Accounts","Billing","Billing + Maintenance","Energy","Head Office Contact","Maintenance","Management","Managing Director","Orders","Sales","Statements","Training","Worksheet Email";
        }
        field(70102; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(70103; "Address 3"; Text[100])
        {
            Caption = 'Address 3';
        }
        field(70104; "Address Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70107; "Address 2 Street1"; Text[100])
        {
            Caption = 'Address 2';
        }
        field(70105; "Address 2 Street 2"; Text[100])
        {
            Caption = 'Address 2';
        }
        field(70106; "Address 2 Street 3"; Text[100])
        {
            Caption = 'Address 3 Street 3';
        }
        field(50131; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50132; "Dimension ID"; Text[100])
        {
            Caption = 'Dimension ID';
            DataClassification = ToBeClassified;
        }
        field(50133; "Company Contact"; Text[100])
        {
            Caption = 'Company Contact';
            DataClassification = ToBeClassified;
            //TableRelation = Contact."No.";
        }
        field(50134; "Dimension"; Text[100])
        {
            Caption = 'Dimension';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code;
        }
        field(50135; "Currency CRM Id"; Text[100])
        {
            Caption = 'Currency CRM Id';
            DataClassification = ToBeClassified;
        }
        field(50136; "Company Name Crm"; Text[100])
        {
            Caption = 'Company Name Crm';
            FieldClass = FlowField;
            CalcFormula = Lookup("Customer"."CRM ID" WHERE("Name" = FIELD("Company Name")));
        }
    }
    trigger OnAfterModify()
    var
        dimRec: Record "Dimension Value";
        customerRec: Record Customer;
        currencyRec: Record Currency;
        dimensionCode: text;
        customerCode: text;
        modified: Integer;
    begin

        modified := 0;

        if (Rec."Currency CRM Id" <> '') and (xRec."Currency CRM ID" <> Rec."Currency CRM ID") then begin
            currencyRec.SetFilter("CRM ID", Rec."Currency CRM ID");
            if currencyRec.FindFirst() then begin
                Rec."Currency Code" := currencyRec.Code;
                modified := modified + 1;
            end;
        end;

        if (Rec."Dimension ID" <> '') and (xRec."Dimension ID" <> Rec."Dimension ID") then begin
            dimRec.SetFilter("CRM ID", Rec."Dimension ID");
            if dimRec.FindFirst() then begin
                Rec.Dimension := dimRec.Code;
                modified := modified + 1;
            end;
        end;



        if modified > 0 then begin
            Rec.Modify(false);
        end;
    end;

    trigger OnModify()
    begin
        UpdateStandardFields();
    end;

    trigger OnInsert()
    begin
        UpdateStandardFields();
    end;

    local procedure UpdateStandardFields()
    begin
        "City" := "D365 City";
        County := "D365 State";
        "Country/Region Code" := "D365 Country";
        "Post Code" := "D365 postal Code";
    end;
}
