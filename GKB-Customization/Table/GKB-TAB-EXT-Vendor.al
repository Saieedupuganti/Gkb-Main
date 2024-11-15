tableextension 50142 "Vendor Ext" extends Vendor
{
    fields
    {
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
        field(50112; "Credit Hold"; Option)
        {
            Caption = 'Credit Hold';
            DataClassification = ToBeClassified;
            OptionCaption = 'Option1,Option2';
            OptionMembers = "Option1","Option2";
        }
        field(50113; "SAP Vendor No"; Text[100])
        {
            Caption = 'SAP Vendor No';
            DataClassification = ToBeClassified;
        }
        field(50115; "Owner Ship"; Option)
        {
            Caption = 'Owner Ship';
            OptionCaption = ' ,Private,Public,Subsidary,Others';
            OptionMembers = " ",Private,Public,Subsidary,Others;
        }
        field(50114; "Credit Holds"; Boolean)
        {
            Caption = 'Credit Holds';
            DataClassification = ToBeClassified;
        }
        field(50116; "Address 3"; Text[100])
        {
            Caption = 'Address 3';
        }
        field(50117; "Contact Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(50118; State; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50119; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(50120; "Dimension"; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(50121; WEB; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50122; "Sales Person Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = 
        }
        field(50123; "Customer Price Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = 
        }
        field(50124; "Address Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }
}
