tableextension 50103 GKBItemExt extends Item
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
        field(50103; QrCode; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(50104; SAPITEMID; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50106; Currency; Code[30])              //lookup
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(50107; "Posting Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Sample1;Sample";
            OptionCaption = 'Sample1,Sample2';
        }
        field(50108; "Vendor Id"; Text[100])   //lookup
        {

            DataClassification = ToBeClassified;
            // TableRelation = Vendor."Dimension ID" WHERE("No." = FIELD("Vendor Id"));
            trigger OnLookup()
            var
                vendor: Record Vendor;
            begin
                vendor.Reset();
                if page.RunModal(page::"Vendor Card", vendor) = Action::LookupOK then
                    "Vendor Id" := vendor."Dimension ID";
            end;
        }
        field(50109; "Product Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ;1;2;3;4";
            OptionCaption = ' ,Sales Inventory,Miscellaneous Charges,Services,Flat Fees';
        }
        field(50110; "Product Structure"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Sample1;Sample";
            OptionCaption = 'Sample1,Sample2';
        }
        field(50102; Status; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50112; "Currency Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "Custom Vendor Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50114; "Base Unit Of Measure Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50301; "Unit"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(50509; "Vendor Id CRM"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
}