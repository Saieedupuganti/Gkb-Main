tableextension 50100 "Customer Ext" extends Customer
{
    fields
    {
        field(50149; "D365 State"; Text[100])
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

        field(50146; "D365 PostCode"; Text[100])
        {
            Caption = 'PostCode';
            DataClassification = ToBeClassified;
        }
        field(50101; "Customer Profile"; Option)
        {
            Caption = 'Customer Profile';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Agriculture,Beverages,Buildings,Chemical,Competition,Concrete,Consultants,Education,Engineer Procure Construct,Food,Government Organisation,Health Care,Hotel & Casinos,Laundry & Clean,Manufacturing,Materials Construction & Packaging,Mining and Precious Metals,N/A,OEM Machinery,Oil & Gas,Other,Packaging,Pet Food,Pharma & Biotech,Power Generation,Pulp & Paper,Recycling,Rubber & Pastic,SIG Affiliations,Service Providers,Service Retail,Social Services,Special Outbound Trade Contractors,Specialty Realty,Textiles,Timber And Forestry,Transportation,Utility Creation and Distribution,Vehicle Retail,Water and Waste,Wholesale';
            OptionMembers = " ","Agriculture","Beverages","Buildings","Chemical","Competition","Concrete","Consultants","Education","Engineer Procure Construct","Food","Government Organisation","Health Care","Hotel & Casinos","Laundry & Clean","Manufacturing","Materials Construction & Packaging","Mining and Precious Metals","N/A","OEM Machinery","Oil & Gas","Other","Packaging","Pet Food","Pharma & Biotech","Power Generation","Pulp & Paper","Recycling","Rubber& Pastic","SIG Affiliations","Service Providers","Service Retail","Social Services","Special Outbound Trade Contractors","Specialty Realty","Textiles","Timber And Forestry","Transportation","Utility Creation and Distribution","Vehicle Retail","Water and Waste","Wholesale";
        }
        field(50102; "Supplier account Group"; Option)
        {
            Caption = 'Supplier Account Group';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Accounting,Amenities,Boiler Ancillaries,Boiler Manufacturer,Burner Management,Communication,Competition,Consultants,Credit Cards,Electrical,Employees,Engineering,Equipment Rental,Freight & Transport,Gas Components,Inspection & Certification,IT,Legal,Motor Vehicles,Plumbing,Safety Equipment,Subcontractor,Tooling,Travel,Other,N/A';
            OptionMembers = " ","Accounting","Amenities","Boiler Ancillaries","Boiler Manufacturer","Burner Management","Communication","Competition","Consultants","Credit Cards","Electrical","Employees","Engineering","Equipment Rental","Freight & Transport","Gas Components","Inspection & Certification","IT","Legal","Motor Vehicles","Plumbing","Safety Equipment","Subcontractor","Tooling","Travel","Other","N/A";
        }
        field(50103; "D365 Account ID"; Text[100])
        {
            Caption = 'D365 Account ID';
            DataClassification = ToBeClassified;
        }
        field(50104; "SAP Customer Number"; Text[100])
        {
            Caption = 'SAP Customer Number';
            DataClassification = ToBeClassified;
        }
        field(50105; "Service Agreement"; Option)
        {
            Caption = 'Service Agreement';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Basic,Pro';
            OptionMembers = " ","Basic","Pro";
        }
        field(50106; "Account Contract Manager"; Text[100])
        {
            Caption = 'Account Contract Manager';
            DataClassification = ToBeClassified;
            TableRelation = Employee;

        }
        field(50107; "Capex From"; Date)
        {
            Caption = 'Capex From';
            DataClassification = ToBeClassified;
        }
        field(50108; "Capex To"; Date)
        {
            Caption = 'Capex To';
            DataClassification = ToBeClassified;
        }
        field(50109; "ABN No."; Text[100])
        {
            Caption = 'ABN No';
            DataClassification = ToBeClassified;
        }
        field(50110; "Customer group"; Option)
        {
            Caption = 'Customer Group';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Platinum,Gold,Silver,Bronze,N/A';
            OptionMembers = " ",Platinum,Gold,Silver,Bronze,"N/A";
        }
        field(50111; "Contact Group"; Option)
        {
            Caption = 'Contact Group';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Competitor,Consultant,Customer,Influencer,Investor,Manufacturer,Partner,Press,Prospect,Reseller,Sub Contractor,Vendor,Others';
            OptionMembers = " ",Competitor,Consultant,Customer,Influencer,Investor,Manufacturer,Partner,Press,Prospect,Reseller,"Sub Contractor",Vendor,Others;
        }
        field(50112; "Credit Hold"; Boolean)
        {
            Caption = 'Credit Hold';
            DataClassification = ToBeClassified;
        }
        field(50113; "Description"; Text[1000])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(50114; "Import Serial No"; Text[200])
        {
            Caption = 'Import Serial No';
        }
        field(50115; "Owner Ship"; Option)
        {
            Caption = 'Owner Ship';
            OptionCaption = ' ,Private,Public,Subsidary,Others';
            OptionMembers = " ",Private,Public,Subsidary,Others;
        }
        field(50116; "Supplier Account Groups"; Option)
        {
            Caption = 'Supplier Account Groups';
            OptionCaption = 'Sample1,Sample2';
            OptionMembers = Sample1,Sample2;
        }
        field(50117; "Address 3"; Text[100])
        {
            Caption = 'Address 3';
        }
        field(50131; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50135; "Account Contract Manager ID"; Text[100])
        {
            Caption = 'Account Contract Manager ID';
            DataClassification = ToBeClassified;
        }
        field(50137; WEB; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50138; "Contact Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(50500; "Dimension"; Code[20])
        {
            Caption = 'Dimension';
            DataClassification = ToBeClassified;
        }
        field(50501; "Dimension ID"; Text[100])
        {
            Caption = 'Dimension ID';
            DataClassification = ToBeClassified;
        }
        field(50502; "Customer Price Group Id"; Text[100])
        {
            Caption = 'Customer Price Group Id';
            DataClassification = ToBeClassified;
        }
        field(50503; "Custom Contact Id"; Text[100])
        {
            Caption = 'Custom Contact Id';
            DataClassification = ToBeClassified;
        }
        field(50504; Territory; Code[20])
        {
            Caption = 'Territory';
            DataClassification = ToBeClassified;
        }
        field(50505; "Territory Code ID"; Text[100])
        {
            Caption = 'Territory Code ID';
            DataClassification = ToBeClassified;
        }
        field(50506; "Territory Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50133; "Primary Contact"; Text[100])
        {
            Caption = 'Company Contact';
            FieldClass = FlowField;
            CalcFormula = Lookup("Contact"."No." WHERE("Name" = FIELD(Name)));
        }
        field(50136; "Address Name"; Text[100])
        {
            Caption = 'Address Name';
            DataClassification = ToBeClassified;
        }
        field(50140; "Owner Id"; Text[100])
        {
            Caption = 'Owner Id';
            DataClassification = ToBeClassified;
        }
        field(50141; "Owner"; Code[30])
        {
            Caption = 'Owner';
            DataClassification = ToBeClassified;
        }
        field(50142; "Currency Code Id"; Text[100])
        {
            Caption = 'Currency Code Id';
            DataClassification = ToBeClassified;
        }
        field(50143; "Parent Account"; Text[100])
        {
            Caption = 'Parent Account';
            DataClassification = ToBeClassified;
        }
        field(50144; "Parent Account CRM ID"; Text[100])
        {
            Caption = 'Parent Account CRM ID';
            DataClassification = ToBeClassified;
        }
    }


    trigger OnAfterModify()
    var
        dimRec: Record "Dimension Value";
        customerRec: Record Customer;
        currencyRec: Record Currency;
        contactRec: Record Contact;
        territoryRec: Record Territory;
        modified: Integer;
    begin

        modified := 0;
        // Check if field has changed and is not empty
        if (Rec."CRM ID" <> '') and (xRec."CRM ID" <> Rec."CRM ID") then begin
            contactRec.SetFilter("CRM ID", Rec."CRM ID");
            if contactRec.FindFirst() then begin
                // Rec."Primary Contact" := contactRec."No.";
                Rec."Primary Contact No." := contactRec."No.";
                modified := modified + 1;
            end;
        end;

        // Check if field has changed and is not empty
        if (Rec."Currency Code Id" <> '') and (xRec."Currency Code Id" <> Rec."Currency Code Id") then begin
            currencyRec.SetFilter("CRM ID", Rec."Currency Code Id");
            if currencyRec.FindFirst() then begin
                Rec."Currency Code" := currencyRec.Code;
                modified := modified + 1;
            end;
        end;

        // Check if field has changed and is not empty
        if (Rec."Dimension ID" <> '') and (xRec."Dimension ID" <> Rec."Dimension ID") then begin
            dimRec.SetFilter("CRM ID", Rec."Dimension ID");
            if dimRec.FindFirst() then begin
                Rec.Dimension := dimRec.Code;
                modified := modified + 1;
            end;
        end;

        // Check if field has changed and is not empty
        if (Rec."Territory Code ID" <> '') and (xRec."Territory Code ID" <> Rec."Territory Code ID") then begin
            territoryRec.SetFilter("CRM ID", Rec."Territory Code ID");
            if territoryRec.FindFirst() then begin
                Rec."Territory Code" := territoryRec.Code;
                modified := modified + 1;
            end;
        end;

        // Nodify only if found atleast 1 CRM - BC match
        if modified > 0 then begin
            Rec.Modify(false);
        end;
    end;

}