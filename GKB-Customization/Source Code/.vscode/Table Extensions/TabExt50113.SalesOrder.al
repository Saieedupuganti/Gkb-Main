tableextension 50113 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50102; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50103; "Unit of Measure Code CRMID"; Text[100])
        {
            Caption = 'Unit of Measure Code CRMID';
            DataClassification = ToBeClassified;
        }
        field(50126; "Unit of Measure Code"; Text[100])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = ToBeClassified;
        }
        field(50104; "Unit Cost CRMID"; Text[100])
        {
            Caption = 'Unit Cost CRMID';
            DataClassification = ToBeClassified;
        }
        field(50105; "Customer CRMID"; Text[100])
        {
            Caption = 'Customer CRMID';
            DataClassification = ToBeClassified;
        }
        field(50106; "Address Name"; Text[100])
        {
            Caption = 'Address Name';
            DataClassification = ToBeClassified;
        }
        field(50107; "Currency CRM ID"; Text[100])
        {
            Caption = 'Currency CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50108; "Order Type"; Text[100])
        {
            Caption = 'Order Type';
            DataClassification = ToBeClassified;
        }
        field(50109; Owner; Text[100])
        {
            Caption = 'Owner';
            DataClassification = ToBeClassified;
        }
        field(50110; "Owner CRMID"; Text[100])
        {
            Caption = 'Owner CRMID';
            DataClassification = ToBeClassified;
        }
        field(50111; Dimension; Text[100])
        {
            Caption = 'Dimension';
            DataClassification = ToBeClassified;
        }
        field(50112; "Dimension CRM ID"; Text[100])
        {
            Caption = 'Dimension CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50113; "Price List"; Text[100])
        {
            Caption = 'Price List';
            DataClassification = ToBeClassified;
        }
        field(50114; "Quote"; Text[100])
        {
            Caption = 'Quote';
            DataClassification = ToBeClassified;
        }
        field(50115; "Quote CRM ID"; Text[100])
        {
            Caption = 'Quote CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50116; "Opportunity"; Text[100])
        {
            Caption = 'Opportunity';
            DataClassification = ToBeClassified;
        }
        field(50117; "Opportunity CRM ID"; Text[100])
        {
            Caption = 'Opportunity CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50118; "Lead Type"; Text[100])
        {
            Caption = 'Lead Type';
            DataClassification = ToBeClassified;
        }
        field(50119; "Work Order Type"; Code[30])
        {
            Caption = 'Work Order Type';
            DataClassification = ToBeClassified;
            TableRelation = "GKB Work Order Type";
        }
        field(50120; "Freight Amount"; Text[100])
        {
            Caption = 'Freight Amount';
            DataClassification = ToBeClassified;
        }
        field(50121; "Freight Terms"; Option)
        {
            Caption = 'Freight Terms';
            OptionMembers=" ","100000001","100000000","100000002","100000003","100000004","100000005","100000006","100000007","100000008","100000009","100000010","100000011","100000012","100000013","1","2";
            OptionCaption=' ,CIF,CFR,CIP,CPT,DAF,DDP,DDU,DELIVERY,DEQ,DES,EXW,FAS,FCA,PICKUP,FOB,No Charge';
            DataClassification = ToBeClassified;
        }
        field(50122; "Creation Method"; Option)
        {
            Caption = 'Creation Method';
            OptionMembers="776160000","776160001";
            OptionCaption='Unknown,Win Quote';
            DataClassification = ToBeClassified;
        }
        field(50123; "Ship-to Address 3"; Text[100])
        {
            Caption = 'Ship-to Address 3';
            DataClassification = ToBeClassified;
        }
        field(50149; "D365 Sell To Country"; Text[100])
        {
            Caption = 'State';
            DataClassification = ToBeClassified;
        }
        field(50150; "D365 Country"; Text[100])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
        }
        field(50145; "D365 City"; Text[100])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(50146; "D365 Sell to Post Code"; Text[100])
        {
            Caption = 'Sell To Post Code';
            DataClassification = ToBeClassified;
        }
    }

    trigger OnAfterModify()
    var
        dimRec: Record "Dimension Value";
        customerRec: Record Customer;
        currencyRec: Record Currency;
        dimensionCode: text;
        customerCode: text;
        modified:Integer;
    begin
        
        modified:=0;
        // Check if field has changed and is not empty
        if (Rec."Customer CRMID"<>'') and (xRec."Customer CRMID"<>Rec."Customer CRMID") then begin
            customerRec.SetFilter("CRM ID",Rec."Customer CRMID");
            if customerRec.FindFirst() then begin
                Rec."Sell-to Customer No." := customerRec."No.";
                modified:=modified+1;
            end;
        end;
        
        // Check if field has changed and is not empty
        if (Rec."Dimension CRM ID"<>'') and (xRec."Dimension CRM ID"<>Rec."Dimension CRM ID") then begin
            dimRec.SetFilter("CRM ID",Rec."Dimension CRM ID");
            if dimRec.FindFirst() then begin
                Rec.Dimension := dimRec.Code;
                modified:=modified+1;
            end;
        end;

        // Check if field has changed and is not empty
        if (Rec."Currency CRM ID"<>'') and (xRec."Currency CRM ID" <>Rec."Currency CRM ID") then begin
            currencyRec.SetFilter("CRM ID",Rec."Currency CRM ID");
            if currencyRec.FindFirst() then begin
                Rec."Currency Code" := currencyRec.Code;
                modified:=modified+1;
            end;
        end;

        // Nodify only if found atleast 1 CRM - BC match
        if modified>0 then begin
            Rec.Modify(false);
        end;
    end;
            
}

