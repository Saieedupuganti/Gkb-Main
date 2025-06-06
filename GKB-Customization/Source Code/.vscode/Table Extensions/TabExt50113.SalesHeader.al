tableextension 50113 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50102; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50127; Name; Text[300])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
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
        field(50106; "Bill-to address name"; Text[100])
        {
            Caption = 'Address Name';
            DataClassification = ToBeClassified;
        }
        field(50107; "Currency CRM ID"; Text[100])
        {
            Caption = 'Currency CRM ID';
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
        field(50118; "Lead Type"; Option)
        {
            Caption = 'Lead Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Service/Parts",Training,Energy,Sales,"N/A";
        }
        field(50119; "Work Order Type"; Text[100])
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
            OptionMembers = " ","100000001","100000000","100000002","100000003","100000004","100000005","100000006","100000007","100000008","100000009","100000010","100000011","100000012","100000013","1","2";
            OptionCaption = ' ,CIF,CFR,CIP,CPT,DAF,DDP,DDU,DELIVERY,DEQ,DES,EXW,FAS,FCA,PICKUP,FOB,No Charge';
            DataClassification = ToBeClassified;
        }
        field(50122; "Creation Method"; Option)
        {
            Caption = 'Creation Method';
            OptionMembers = " ","776160000","776160001";
            OptionCaption = ' ,Unknown,Win Quote';
            DataClassification = ToBeClassified;
        }
        field(50123; "Ship-to Address 3"; Text[100])
        {
            Caption = 'Ship-to Address 3';
            DataClassification = ToBeClassified;
        }
        field(50149; "D365 Bill-To State"; Text[100])
        {
            Caption = 'State';
            DataClassification = ToBeClassified;
        }
        field(50150; "D365 Bill-to country"; Text[100])
        {
            Caption = 'Country';
            DataClassification = ToBeClassified;
        }
        field(50145; "D365 City"; Text[100])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(50146; "D365 Bill-to Post Code"; Text[100])
        {
            Caption = 'Bill-To Post Code';
            DataClassification = ToBeClassified;
        }
        field(50147; "D365 ShiptoCountry/RegionCode"; Text[50])
        {
            Caption = 'Ship-to Country/Region Code';
        }
        field(50148; "D365 Ship-to Post Code"; Text[100])
        {
            Caption = 'Ship-to Post Code';
        }
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Work Details"; Blob)
        {
            Caption = 'Work Details';
            DataClassification = ToBeClassified;
            ObsoleteState = Removed;
            // ExtendedDatatype= RichContent
        }
        field(50200; RichText; Blob)
        {
            Caption = 'Rich Text';
            DataClassification = CustomerContent;
        }
        field(50202; "D365 Bill-to Address 3"; Text[100])
        {
            Caption = 'Bill-to Address 3';
        }
        field(50203; "Sales Order Name"; Text[100])
        {
            Caption = 'Sales Order Name';
            ObsoleteState = Pending;
        }
        field(50204; "Invoice Created"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Invoice Created';
        }
        field(50205; "Sales Order No."; Text[100])
        {
            Caption = 'Sales Order No.';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST(Order));
        }
        field(50206; "Job No."; Text[100])
        {
            Caption = 'Work Order No.';
            TableRelation = Job."No.";

            trigger OnLookup()
            var
                JobRec: Record Job;
                JobListPage: Page "Job List";
            begin
                JobRec.SetRange("Sales Order", Rec."No.");
                PAGE.RunModal(PAGE::"Job List", JobRec);
            end;
        }
        field(50207; "Job Task No"; Code[30])
        {
            Caption = 'Project Task No';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job No."));
        }
        field(50124; Description; Text[300])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        // Fields are created for the Blanket Sales Order To SALES INVOICE

        field(50208; "Percentage To Invoice"; Decimal)
        {
            Caption = '% To Invoice';
            MinValue = 0;
            MaxValue = 100;
            DecimalPlaces = 0 : 2;
        }

        field(50209; "Invoiced Percentage"; Decimal)
        {
            Caption = 'Invoiced %';
            Editable = false;
            MinValue = 0;
            MaxValue = 100;
            DecimalPlaces = 0 : 2;
        }

        field(50210; "Remaining Percentage"; Decimal)
        {
            Caption = 'Remaining %';
            Editable = false;
            MinValue = 0;
            MaxValue = 100;
            DecimalPlaces = 0 : 2;
            InitValue = 100;
        }

        field(50211; "Invoicing Amount"; Decimal)
        {
            Caption = 'Invoicing Amount';
            Editable = false;
            MinValue = 0;
            DecimalPlaces = 0 : 2;
        }

        field(50212; "Amount Invoiced"; Decimal)
        {
            Caption = 'Amount Invoiced';
            Editable = false;
            MinValue = 0;
            DecimalPlaces = 0 : 2;
        }

        field(50213; "Remaining Amount"; Decimal)
        {
            Caption = 'Remaining Amount';
            Editable = false;
            MinValue = 0;
            DecimalPlaces = 0 : 2;
        }
        field(50214; "Customer PO Number"; Text[100])
        {
            Caption = 'Customer PO Number';
            DataClassification = ToBeClassified;
        }
        field(50215; "Billing Type"; Option)
        {
            Caption = 'Billing Type';
            OptionMembers = " ","Charge Up","Quoted","Monthly Billing","Not Chargeable","N/A";
            DataClassification = ToBeClassified;
        }
        field(50000; "GST Prod Posting Group"; Code[20])
        {
            Caption = 'GST Prod Posting Group';
            Description = 'GST Product Posting Group at the header level';
            TableRelation = "VAT Product Posting Group";
            DataClassification = ToBeClassified;
        }
        field(50001; "Sales Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(50002; "D365 Sell-to Address 3"; Text[100])
        {
            Caption = 'Sell-to Address 3';
        }
        field(50520; "Delivery Docket No."; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50521; "Delivery Docket Date"; Date)
        {
            Caption = 'Delivery Docket Date';
            DataClassification = ToBeClassified;
        }
    }

    trigger OnModify()
    var
        TotalAmount: Decimal;
        SalesLine: Record "Sales Line";
    begin
        if Rec."Document Type" = Rec."Document Type"::"Blanket Order" then begin

            // Validate percentage limits
            if Rec."Invoiced Percentage" > 100 then
                Error('Invoiced Percentage cannot be greater than 100.');

            if (Rec."Percentage To Invoice" + Rec."Invoiced Percentage") > 100 then
                Error('Total of Invoiced Percentage and Percentage To Invoice cannot exceed 100.');

            // Calculate total amount
            TotalAmount := 0;
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."No.");
            if SalesLine.FindSet() then begin
                repeat
                    TotalAmount += SalesLine.Amount;
                until SalesLine.Next() = 0;
            end;

            Rec."Invoicing Amount" := Round((Rec."Percentage To Invoice" / 100) * TotalAmount, 0.01);
        end;
    end;

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
        if (Rec."Customer CRMID" <> '') and (xRec."Customer CRMID" <> Rec."Customer CRMID") then begin
            customerRec.SetFilter("CRM ID", Rec."Customer CRMID");
            if customerRec.FindFirst() then begin
                Rec."Bill-to Customer No." := customerRec."No.";
                modified := modified + 1;
            end;
        end;

        if (Rec."Dimension CRM ID" <> '') and (xRec."Dimension CRM ID" <> Rec."Dimension CRM ID") then begin
            dimRec.SetFilter("CRM ID", Rec."Dimension CRM ID");
            if dimRec.FindFirst() then begin
                Rec.Dimension := dimRec.Code;
                modified := modified + 1;
            end;
        end;

        if (Rec."Currency CRM ID" <> '') and (xRec."Currency CRM ID" <> Rec."Currency CRM ID") then begin
            currencyRec.SetFilter("CRM ID", Rec."Currency CRM ID");
            if currencyRec.FindFirst() then begin
                Rec."Currency Code" := currencyRec.Code;
                modified := modified + 1;
            end;
        end;

        if modified > 0 then begin
            Rec.Modify(false);
        end;
    end;

    var
        Readdataskippedmsg: Label 'Loading Field %1 Will be skipped because there was an error when reading tha date.';

    procedure SetRichText(RichText1: Text)
    var
        OutStream: OutStream;
    begin
        Clear(RichText);
        RichText.CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(RichText1);
        Modify();
    end;

    procedure GetRichText() TermConditions: Text
    var
        InStream: Instream;
        typehelper: Codeunit "Type Helper";
    begin
        CalcFields(RichText);
        RichText.CreateInStream(InStream, TextEncoding::UTF8);
        if not typehelper.TryReadAsTextWithSeparator(InStream, typehelper.LFSeparator(), TermConditions) then
            Message(Readdataskippedmsg, FieldCaption(RichText));
    end;
}
