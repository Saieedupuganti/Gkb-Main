tableextension 50100 "Customer Ext" extends Customer
{
    fields
    {
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
        field(50117; "Address 3";Text[100])
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
        field(50137;WEB;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50138;"Contact Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation= Contact;
        }

    }
}
