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

    }
}