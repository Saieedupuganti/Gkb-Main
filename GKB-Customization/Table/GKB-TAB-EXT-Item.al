tableextension 50102 GKBItemExt extends Item
{
    fields
    {
        field(50099; "D365 Product ID"; Code[30])
        {
            Caption = 'D365 Product ID';
            DataClassification = ToBeClassified;
        }
        field(50098; "Vendor 1 Catalogue Number"; Text[100])
        {
            Caption = 'Vendor 1 Catalogue Number';
            DataClassification = ToBeClassified;
        }
        field(50097; "Trade Type"; Option)
        {
            Caption = 'Trade Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Service Engineer Dual Trade,First-Year Apprentice,Second-Year Apprenctice,Third-Year Apprenctice,Fourth-Year Apprenctice';
            OptionMembers = "Service Engineer Dual Trade","First-Year Apprentice","Second-Year Apprenctice","Third-Year Apprenctice","Fourth-Year Apprenctice";
        }
        field(50100; "OBS Item Name"; Text[100])
        {
            Caption = 'OBS Item Name';
            DataClassification = ToBeClassified;
        }
        field(50101; "Vendor Item Name"; Text[100])
        {
            Caption = 'Vendor Item Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No." = FIELD("Vendor No.")));
        }
        field(50111; VendorName; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No." = FIELD("Vendor No.")));
        }
        field(50103;QrCode;Blob)
        {
            DataClassification=ToBeClassified;  
        }
        field(50104;SAPITEMID;Code[100])
        {
            DataClassification=ToBeClassified;  
        }
        field(50105;"CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50106;Currency;Code[30])              //lookup
        {
        DataClassification = ToBeClassified;
        TableRelation = Currency;
        }
        field(50107;"Posting Group";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Sample1;Sample";
            OptionCaption = 'Sample1,Sample2';
        }
        field(50108;"Vendor Id";Code[30])   //lookup
        {
            DataClassification= ToBeClassified;
            TableRelation = Vendor;
        }
        field(50109;"Product Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Sample1;Sample";
            OptionCaption = 'Sample1,Sample2';
        }
        field(50110;"Product Structure";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Sample1;Sample";
            OptionCaption = 'Sample1,Sample2';
        }
        field(50102;Status;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50112;"Currency Id";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50113;"Custom Vendor Id";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50114;"Base Unit Of Measure Id";Text[100])
        {
            DataClassification=ToBeClassified;
        }

    }
}
tableextension 50351 "ItemExt" extends Item
{
    fields
    {
        modify("Base Unit of Measure")
        {
            trigger OnAfterValidate()
            var
                unitRec: Record "Unit of Measure";
            begin
                unitRec.SetFilter(Code,Rec."Base Unit of Measure");
                if unitRec.FindFirst() then begin
                    Rec."Base Unit Of Measure Id":=unitRec."CRM ID";
                    Message(unitRec."CRM ID");
                    Rec.Modify(false);
                end;
            end;
        }
        modify(Currency)
        {
            trigger OnAfterValidate()
            var
                unitRec: Record Currency;
            begin
                unitRec.SetFilter(Code,Rec.Currency);
                if unitRec.FindFirst() then begin
                    Rec."Currency Id":=unitRec."CRM ID";
                    Message(unitRec."CRM ID");
                    Rec.Modify(false);
                end;
            end;
        }
        modify("Vendor Id")
        {
            trigger OnAfterValidate()
            var
                unitRec: Record Vendor;
            begin
                unitRec.SetFilter("No.",Rec."Vendor Id");
                if unitRec.FindFirst() then begin
                    Rec."Vendor Id CRM":=unitRec."CRM ID";
                    Message(unitRec."CRM ID");
                    Rec.Modify(false);
                end;
            end;
        }
    }
}

// pageextension 50341 "Itemext" extends "Item Card"
// {
//     trigger OnModifyRecord(): Boolean
//     var
//         unitRec: Record "Unit of Measure";
//     begin
//         // Message('Triggered'+Format(Rec."Base Unit of Measure"));
//         unitRec.SetFilter(Code,Rec."Base Unit of Measure");
//         if unitRec.FindFirst() then begin
//             Rec."Base Unit Of Measure Id":=unitRec."CRM ID";
//             Message(unitRec."CRM ID");
//             Rec.Modify(false);
//         end;
//     end;
// }


