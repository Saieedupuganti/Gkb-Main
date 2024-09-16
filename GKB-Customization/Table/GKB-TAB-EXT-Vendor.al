tableextension 50142 "Vendor Ext" extends Vendor
{
    fields
    {
        //         field(70100; Comments2; Text[100])
        //         {
        //             Caption = 'Comments2';
        //             DataClassification = ToBeClassified;
        //         }
        field(70101; "Vendor Profile"; Option)
        {
            Caption = 'Vendor Profile';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Agriculture,Beverages,Buildings,Chemical,Competition,Concrete,Consultants,Education,Engineer Procure Construct,Food,Government Organisation,Health Care,Hotel & Casinos,Laundry & Clean,Manufacturing,Materials Construction & Packaging,Mining and Precious Metals,N/A,OEM Machinery,Oil & Gas,Other,Packaging,Pet Food,Pharma & Biotech,Power Generation,Pulp & Paper,Recycling,Rubber & Pastic,SIG Affiliations,Service Providers,Service Retail,Social Services,Special Outbound Trade Contractors,Specialty Realty,Textiles,Timber And Forestry,Transportation,Utility Creation and Distribution,Vehicle Retail,Water and Waste,Wholesale';
            OptionMembers = " ", "Agriculture", "Beverages", "Buildings", "Chemical", "Competition", "Concrete", "Consultants", "Education", "Engineer Procure Construct", "Food", "Government Organisation", "Health Care", "Hotel & Casinos", "Laundry & Clean", "Manufacturing", "Materials Construction & Packaging", "Mining and Precious Metals", "N/A", "OEM Machinery", "Oil & Gas", "Other", "Packaging", "Pet Food", "Pharma & Biotech", "Power Generation", "Pulp & Paper", "Recycling", "Rubber& Pastic", "SIG Affiliations", "Service Providers", "Service Retail", "Social Services", "Special Outbound Trade Contractors", "Specialty Realty", "Textiles", "Timber And Forestry", "Transportation", "Utility Creation and Distribution", "Vehicle Retail", "Water and Waste", "Wholesale";
        }
        field(70102; "Supplier account Group"; Option)
        {
            Caption = 'Supplier account Group';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Accounting,Amenities,Boiler Ancillaries,Boiler Manufacturer,Burner Management,Communication,Competition,Consultants,Credit Cards,Electrical,Employees,Engineering,Equipment Rental,Freight & Transport,Gas Components,Inspection & Certification,IT,Legal,Motor Vehicles,Plumbing,Safety Equipment,Subcontractor,Tooling,Travel,Other,N/A';
            OptionMembers = " ", "Acctunting", "Amenities", "Boiler Ancillaries", "Boiler Manufacturer", "Burner Management", "Communication", "Competition", "Consultants", "Credit Cards", "Electrical", "Employees", "Engineering", "Equipment Rental", "Freight & Transport", "Gas Components", "Inspection & Certification", "IT", "Legal", "Motor Vehicles", "Plumbing", "Safety Equipment", "Subcontractor", "Tooling", "Travel", "Other", "N/A";
        }
        field(70103; "D365 Account ID"; Text[100])
        {
            Caption = 'D365 Account ID';
            DataClassification = ToBeClassified;
        }
        field(70104; "SAP Vendor Number"; Text[100])
        {
            Caption = 'SAP Vendor Number';
            DataClassification = ToBeClassified;
        }
        field(70105; "Service Agreement"; Option)
        {
            Caption = 'Service Agreement';
            DataClassification = ToBeClassified;
            OptionCaption = 'Basic,Pro';
            OptionMembers = "Basic", "Pro";
        }
        field(70106; "Account Contract Manager"; Text[100])
        {
            Caption = 'Account Contract Manager';
            DataClassification = ToBeClassified;
        }
        field(70107; "Capex From"; Date)
        {
            Caption = 'Capex From';
            DataClassification = ToBeClassified;
        }
        field(70108; "Capex To"; Date)
        {
            Caption = 'Capex To';
            DataClassification = ToBeClassified;
        }
        field(70109; "ABN No."; Text[100])
        {
            Caption = 'ABN No';
            DataClassification = ToBeClassified;
        }
    }
}
