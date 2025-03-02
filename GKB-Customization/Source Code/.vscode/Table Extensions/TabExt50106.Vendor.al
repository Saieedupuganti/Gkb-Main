tableextension 50106 "Vendor Ext" extends Vendor
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
        field(50142; "Vendor Profile"; Option)
        {
            Caption = 'Vendor Profile';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Agriculture,Beverages,Buildings,Chemical,Competition,Concrete,Consultants,Education,Engineer Procure Construct,Food,Government Organisation,Health Care,Hotel & Casinos,Laundry & Clean,Manufacturing,Materials Construction & Packaging,Mining and Precious Metals,N/A,OEM Machinery,Oil & Gas,Other,Packaging,Pet Food,Pharma & Biotech,Power Generation,Pulp & Paper,Recycling,Rubber & Pastic,SIG Affiliations,Service Providers,Service Retail,Social Services,Special Outbound Trade Contractors,Specialty Realty,Textiles,Timber And Forestry,Transportation,Utility Creation and Distribution,Vehicle Retail,Water and Waste,Wholesale';
            OptionMembers = " ","Agriculture","Beverages","Buildings","Chemical","Competition","Concrete","Consultants","Education","Engineer Procure Construct","Food","Government Organisation","Health Care","Hotel & Casinos","Laundry & Clean","Manufacturing","Materials Construction & Packaging","Mining and Precious Metals","N/A","OEM Machinery","Oil & Gas","Other","Packaging","Pet Food","Pharma & Biotech","Power Generation","Pulp & Paper","Recycling","Rubber& Pastic","SIG Affiliations","Service Providers","Service Retail","Social Services","Special Outbound Trade Contractors","Specialty Realty","Textiles","Timber And Forestry","Transportation","Utility Creation and Distribution","Vehicle Retail","Water and Waste","Wholesale";
        }
        field(50102; "Supplier account Group"; Option)
        {
            Caption = 'Supplier account Group';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Accounting,Amenities,Boiler Ancillaries,Boiler Manufacturer,Burner Management,Communication,Competition,Consultants,Credit Cards,Electrical,Employees,Engineering,Equipment Rental,Freight & Transport,Gas Components,Inspection & Certification,IT,Legal,Motor Vehicles,Plumbing,Safety Equipment,Subcontractor,Tooling,Travel,Other,N/A';
            OptionMembers = " ","Acctunting","Amenities","Boiler Ancillaries","Boiler Manufacturer","Burner Management","Communication","Competition","Consultants","Credit Cards","Electrical","Employees","Engineering","Equipment Rental","Freight & Transport","Gas Components","Inspection & Certification","IT","Legal","Motor Vehicles","Plumbing","Safety Equipment","Subcontractor","Tooling","Travel","Other","N/A";
        }
        field(50144; "D365 Account ID"; Text[100])
        {
            Caption = 'D365 Account ID';
            DataClassification = ToBeClassified;
        }
        field(50104; "SAP Vendor Number"; Text[100])
        {
            Caption = 'SAP Vendor Number';
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
        field(50110; "Customer Group"; Option)
        {
            Caption = 'Customer Group';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Platinum,Gold,Silver,Bronze,N/A';
            OptionMembers = " ",Platinum,Gold,Silver,Bronze,"N/A";
        }
        field(50111; "Contact Groups"; Option)
        {
            Caption = 'Contact Groups';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Competitor,Consultant,Customer,Influencer,Investor,Manufacturer,Partner,Press,Prospect,Reseller,Sub Contractor,Vendor,Others';
            OptionMembers = " ",Competitor,Consultant,Customer,Influencer,Investor,Manufacturer,Partner,Press,Prospect,Reseller,"Sub Contractor",Vendor,Others;
        }
        field(50112; "Credit Hold"; Boolean)
        {
            Caption = 'Credit Hold';
            DataClassification = ToBeClassified;
        }
        field(50115; "Owner Ship"; Option)
        {
            Caption = 'Owner Ship';
            OptionCaption = ' ,Private,Public,Subsidary,Others';
            OptionMembers = " ",Private,Public,Subsidary,Others;
        }
        field(50116; "Address 3"; Text[100])
        {
            Caption = 'Address 3';
        }
        field(50118; State; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50119; "Description"; Text[1000])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(50120; "Dimension"; Text[100])
        {
            Caption = 'Dimension';
            DataClassification = ToBeClassified;
        }
        field(50121; WEB; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50124; "Address Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50501; "CRM Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50150; "Company Conatct"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Contact"."No." WHERE("Name" = FIELD(Name)));
        }
        field(50503; "Currency Code Id"; Text[100])
        {
            Caption = 'Currency Code Id';
            DataClassification = ToBeClassified;
        }
        field(50505; "Account Contract Manager Id"; Text[100])
        {
            Caption = 'Account Contract Manager ID';
            DataClassification = ToBeClassified;
        }
        field(50504; Territory; Code[20])
        {
            Caption = 'Territory';
            DataClassification = ToBeClassified;
        }
        field(50506; "Territory Code Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50510; "Dimension ID"; Text[100])
        {
            Caption = 'Dimension ID';
            DataClassification = ToBeClassified;
        }
        field(50512; "Custom Contact Id"; Text[100])
        {
            Caption = 'Custom Contact Id';
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
        field(50145; "Parent Account"; Text[100])
        {
            Caption = 'Parent Account';
            DataClassification = ToBeClassified;
        }
        field(50143; "Is Also a Customer"; Boolean)
        {
            Caption = 'Is Also a Customer';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                CreateCustomerFromVendor: Codeunit CreateCustomerFrmVendor;
            begin
                if "Is Also a Customer" then
                    CreateCustomerFromVendor.HandleVendorModification(Rec, Rec);
            end;
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
        if (Rec."CRM Id" <> '') and (xRec."CRM Id" <> Rec."CRM Id") then begin
            contactRec.SetFilter("CRM ID", Rec."CRM Id");
            if contactRec.FindFirst() then begin
                Rec."Primary Contact No." := contactRec."No.";
                modified := modified + 1;
            end;
        end;

        if (Rec."Currency Code Id" <> '') and (xRec."Currency Code Id" <> Rec."Currency Code Id") then begin
            currencyRec.SetFilter("CRM ID", Rec."Currency Code Id");
            if currencyRec.FindFirst() then begin
                Rec."Currency Code" := currencyRec.Code;
                modified := modified + 1;
            end;
        end;

        if (Rec."Dimension ID" <> '') and (xRec."Dimension ID" <> Rec."Dimension ID") then begin
            dimRec.SetFilter("CRM ID", Rec."Dimension ID");
            if dimRec.FindFirst() then begin
                Rec."Global Dimension 1 Code" := dimRec.Code;
                modified := modified + 1;
            end;
        end;

        if (Rec."Territory Code ID" <> '') and (xRec."Territory Code ID" <> Rec."Territory Code ID") then begin
            territoryRec.SetFilter("CRM ID", Rec."Territory Code ID");
            if territoryRec.FindFirst() then begin
                Rec."Territory Code" := territoryRec.Code;
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

    trigger OnAfterInsert()
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