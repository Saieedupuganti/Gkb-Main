table 70000 "Customer Asset"
{
    Caption = 'Customer Asset';
    DrillDownPageId = "Customer Asset List";
    LookupPageId = "Customer Asset Card";
    DataClassification = CustomerContent;


    fields
    {
        field(5065; No; Code[20])
        {
            Caption = 'No';
        }
        field(5000; "Account Id"; Text[100])
        {
            Caption = 'Account Id';
            DataClassification = ToBeClassified;
        }
        field(5001; Account; Code[50])
        {
            Caption = 'Account';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(5002; "Equipment Card No."; Text[100])
        {
            Caption = 'Equipment Card No.';
            DataClassification = ToBeClassified;
        }
        field(5003; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(5004; "Asset number"; Text[100])
        {
            Caption = 'Asset Number';
            DataClassification = ToBeClassified;
        }
        field(5005; "Asset Location"; Code[50])
        {
            Caption = 'Asset Location';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(5006; "Equipment Category"; Option)
        {
            Caption = 'Equipment Category';
            DataClassification = ToBeClassified;
            OptionCaption = '';
            OptionMembers = "";
        }
        field(5007; "Product Id"; Text[100])
        {
            Caption = 'product Id';
            DataClassification = ToBeClassified;
        }
        field(5008; "SAP Item No."; Text[100])
        {
            Caption = 'SAP Item No.';
            DataClassification = ToBeClassified;
        }
        field(5009; "Product"; Code[50])
        {
            Caption = 'Product';
            DataClassification = ToBeClassified;
            // TableRelation = ;
        }
        field(5010; "Top-Level Asset"; Code[50])
        {
            Caption = 'Top-Level Asset';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(5011; "Parent Asset"; Code[50])
        {
            Caption = 'Parent Asset';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(5012; "Agreement"; Code[50])
        {
            Caption = 'Agreement';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(5013; "Boiler Type"; Option)
        {
            Caption = 'Boiler Type';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Condensing Boiler,Electric Boiler,High Temperature Hot Wa,Vertical Boiler,Waste Heat Boiler,Watertube Boiler,Coal Boiler,Biogas Boiler,Hot Oil,Hot Water,Superheated Steam';
            OptionMembers = " ","Condensing Boiler","Electric Boiler","High Temperature Hot Wa","Vertical Boiler","Waste Heat Boiler","Watertube Boiler","Coal Boiler","Biogas Boiler","Hot Oil","Hot Water","Superheated Steam";
        }
        field(5014; "Asset Tag"; Text[100])
        {
            Caption = 'Asset Tag';
            DataClassification = ToBeClassified;
        }
        field(5015; "Building No. Name"; Text[100])
        {
            Caption = 'Building No. Name';
            DataClassification = ToBeClassified;
        }
        field(5016; "Burner Brand"; Option)
        {
            Caption = 'Burner Brand';
            DataClassification = ToBeClassified;
            OptionCaption = '';
            OptionMembers = "";
        }
        field(5017; "Burner Type"; Option)
        {
            Caption = 'Burner Type';
            DataClassification = ToBeClassified;
            OptionCaption = '';
            OptionMembers = "";
        }
        field(5018; "Capacity(KW)"; Text[100])
        {
            Caption = 'Capacity(KW)';
            DataClassification = ToBeClassified;
        }
        field(5019; "Category"; Code[50])
        {
            Caption = 'Category';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(5020; "Date Of Next 4 Monthly"; Date)
        {
            Caption = 'Date Of Next 4 Monthly';
            DataClassification = ToBeClassified;
        }
        field(5021; "Date OfNext6MtlySteamTrapAudit"; Date)
        {
            Caption = 'Date Of Next 6 Monthly Steam Trap Audit';
            DataClassification = ToBeClassified;
        }
        field(5022; "Date Of Next AS2593 Audit"; Date)
        {
            Caption = 'Date Of Next AS2593 Audit';
            DataClassification = ToBeClassified;
        }
        field(5023; "Date Of Next Biennial Service"; Date)
        {
            Caption = 'Date Of Next Biennial Service';
            DataClassification = ToBeClassified;
        }
        field(5024; "Date Of Next Steam Trap Audit"; Date)
        {
            Caption = 'Date Of Next Steam Trap Audit';
            DataClassification = ToBeClassified;
        }
        field(5025; Days; Integer)
        {
            Caption = 'Days';
            DataClassification = ToBeClassified;
        }
        field(5026; "Installation Date"; Date)
        {
            Caption = 'Installation Date';
            DataClassification = ToBeClassified;
        }
        field(5027; "Last active alert time"; DateTime)
        {
            Caption = 'Last active alert time';
            DataClassification = ToBeClassified;
        }
        field(5028; "Last Biennal Date"; Date)
        {
            Caption = 'Last Biennal Date';
            DataClassification = ToBeClassified;
        }
        field(5029; "Equipment Man"; Option)
        {
            Caption = 'Equipment Man';
            DataClassification = ToBeClassified;
            OptionCaption = '';
            OptionMembers = "";
        }
        field(5030; "ETC Serial No"; Text[100])
        {
            Caption = 'ETC Serial No';
            DataClassification = ToBeClassified;
        }
        field(5031; Floor; Text[100])
        {
            Caption = 'Floor';
            DataClassification = ToBeClassified;
        }
        field(5032; "Fuel Type"; Text[100])
        {
            Caption = 'Fuel Type';
            DataClassification = ToBeClassified;
        }
        field(5033; Manufacture; Code[50])
        {
            Caption = 'Manufacture';
            DataClassification = ToBeClassified;
            TableRelation = Manufacturer;
        }
        field(5034; "Manufacture Date"; Date)
        {
            Caption = 'Manufacture Date';
            DataClassification = ToBeClassified;
        }
        field(5035; Manufacturer; Text[100])
        {
            Caption = 'Manufacturer';
            DataClassification = ToBeClassified;
        }
        field(5036; "Manufacture Detail"; Text[100])
        {
            Caption = 'Manufacture Detail';
            DataClassification = ToBeClassified;
        }
        field(5037; "Manufacturing Date"; Text[100])
        {
            Caption = 'Manufacturing Date';
            DataClassification = ToBeClassified;
        }
        field(5038; "Next 3 Monthly Date"; Date)
        {
            Caption = 'Next 3 Monthly Date';
            DataClassification = ToBeClassified;
        }
        field(5039; "Next 5 Weekly Date"; Date)
        {
            Caption = 'Next 5 Weekly Date';
            DataClassification = ToBeClassified;
        }
        field(5040; "Next 6 Monthly Date"; Date)
        {
            Caption = 'Next 6 Monthly Date';
            DataClassification = ToBeClassified;
        }
        field(5041; "Next Annual Date"; Date)
        {
            Caption = 'Next Annual Date';
            DataClassification = ToBeClassified;
        }
        field(5042; "NoOfTechniesForAnnualService"; Integer)
        {
            Caption = 'No Of Technies For Annual Service';
            DataClassification = ToBeClassified;
        }
        field(5043; "OBS Sim No"; Integer)
        {
            Caption = 'OBS Sim No';
            DataClassification = ToBeClassified;
        }
        field(5044; "On-Site Installed location"; Text[100])
        {
            Caption = 'On-Site Installed location';
            DataClassification = ToBeClassified;
        }
        field(5045; "Owning business Unit"; Code[50])
        {
            Caption = 'Owning Business Unit';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(5046; Pressure; Text[100])
        {
            Caption = 'Pressure';
            DataClassification = ToBeClassified;
        }
        field(5047; "Registration Status"; Boolean)
        {
            Caption = 'Registration Status';
            DataClassification = ToBeClassified;
        }
        field(5048; "Room Location"; Text[100])
        {
            Caption = 'Room Location';
            DataClassification = ToBeClassified;
        }
        field(5049; "Safety Valve"; Text[100])
        {
            Caption = 'Safety Valve';
            DataClassification = ToBeClassified;
        }
        field(5050; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionCaption = '';
            OptionMembers = "";
        }
        field(5051; "Status reason"; Text[100])
        {
            Caption = 'Status Reason';
            DataClassification = ToBeClassified;
        }
        field(5052; Unit; Text[100])
        {
            Caption = 'Unit';
            DataClassification = ToBeClassified;
        }
        field(5053; warrenty; Option)
        {
            Caption = 'warrenty';
            DataClassification = ToBeClassified;
            OptionCaption = '';
            OptionMembers = "";
        }
        field(5054; "Budgeted hours 3 Monthly"; Integer)
        {
            Caption = 'Budgeted hours 3 Monthly';
            DataClassification = ToBeClassified;
        }
        field(5055; "Budgeted hours 4 Monthly"; Integer)
        {
            Caption = 'Budgeted hours 4 Monthly';
            DataClassification = ToBeClassified;
        }
        field(5056; "Budgeted hours 5 Monthly"; Integer)
        {
            Caption = 'Budgeted Hours 5 Monthly';
            DataClassification = ToBeClassified;
        }
        field(5057; "Budgeted hours 6 Monthly"; Integer)
        {
            Caption = 'Budgeted Hours 6 Monthly';
            DataClassification = ToBeClassified;
        }
        field(5058; "Budgetedhrs6MntlyStmtrapaudit"; Integer)
        {
            Caption = 'Budgeted Hrs 6 Monthly Steam Trap Audit';
            DataClassification = ToBeClassified;
        }
        field(5059; "Budgeted hours AS2593"; Integer)
        {
            Caption = 'Budgeted Hours AS2593';
            DataClassification = ToBeClassified;
        }
        field(5060; "Budgeted hours for annual"; Integer)
        {
            Caption = 'Budgeted Hours For Annual';
            DataClassification = ToBeClassified;
        }
        field(5061; "BudgetedhrsforbiennialSerice"; Integer)
        {
            Caption = 'Budgeted Hrs for Biennial Serice';
            DataClassification = ToBeClassified;
        }
        field(5062; "Budgeted hrs 3steam trap audit"; Integer)
        {
            Caption = 'Budgeted Hrs 3 Steam Trap Audit';
            DataClassification = ToBeClassified;
        }
        field(5063; Owner; Code[50])
        {
            Caption = 'Owner';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
    }
    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; Name)
        { }
        key(Key3; "Account Id")
        { }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}