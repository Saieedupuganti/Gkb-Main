page 50340 "API Vendor"
{
    PageType = API;
    EntitySetName = 'Vendors';
    EntityName = 'Vendors';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    APIPublisher = 'integration';
    DelayedInsert = true;
    SourceTable = Vendor;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("EMail"; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field("code"; Rec."No.")
                {
                    Caption = 'no';
                }
                field("crmid"; Rec."CRM ID")
                {
                    Caption = 'BC ID';
                }
                field(Address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field("Address2"; Rec."Address 2")
                {
                    Caption = 'Address2';
                }
                field("PostCode"; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field("CapexFrom"; Rec."Capex From")
                {
                    Caption = 'Capex From';
                }
                field("CapexTo"; Rec."Capex To")
                {
                    Caption = 'Capex To';
                }
                field("CreditHold"; Rec."Credit Hold")
                {
                    Caption = 'Credit Hold';
                }
                field("D365AccountID"; Rec."D365 Account ID")
                {
                    Caption = 'Account Id';
                }
                field("SAPVendorNumber"; Rec."SAP Vendor Number")
                {
                    Caption = 'Sap vendor Number';
                }
                field(City; Rec.City)
                {
                    Caption = 'City';
                }
                field("CountryRegionCode"; Rec."Country/Region Code")
                {
                    Caption = 'Region Code';
                }
                field("PhoneNo"; Rec."Phone No.")
                {
                    Caption = 'Phone Number';
                }
                field(ABN; Rec.ABN)
                {
                    Caption = 'ABN';
                }
                field("ABNNo"; Rec."ABN No.")
                {
                    Caption = 'ABN No.';
                }
                field("AccountContractManager"; Rec."Account Contract Manager")   //lookup
                {
                    Caption = 'Account Contract Manager';
                }
                field("AccountContractManagerId"; Rec."Account Contract Manager Id")
                {
                    Caption = 'Account Contract Manager Id';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field("FaxNo"; Rec."Fax No.")
                {
                    Caption = 'Fax No';
                }
                field(County; Rec.County)
                {
                    Caption = 'County';
                }
                field("Address3"; Rec."Address 3")
                {
                    Caption = 'Address 3';
                }
                field(Contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }
                field("ContactGroup"; Rec."Contact Groups")
                {
                    Caption = 'Contact Group';
                }
                field("BalanceDueLCY"; Rec."Balance Due (LCY)")
                {
                    Caption = 'Balance Due';
                }
                field("Currency"; Rec."Currency Code")  //llokup
                {
                    Caption = 'Currency Code';
                }
                field("CurrencyId"; Rec."Currency Code Id")
                {
                    Caption = 'Currency Code Id';
                }

                field("CustomerGroup"; Rec."Customer Group")
                {
                    Caption = 'Customer group';
                }
                field("VendorProfile"; Rec."Vendor Profile")
                {
                    Caption = 'Vendor Profile';
                }
                field("PurchaserCode"; Rec."Purchaser Code")
                {
                    Caption = 'Purchaser Code';
                }
                field("BlockPaymentTolerance"; Rec."Block Payment Tolerance")
                {
                    Caption = 'Block Payment Tolarence';
                }
                field("PaymentMethodCode"; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field("PaymentTermsCode"; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field("PrimaryContactNo"; Rec."Primary Contact No.")   //lookup
                {
                    Caption = 'primary Contact No.';
                }
                field("PrimaryContactNoId"; Rec."Primary Contact No Id")
                {
                    Caption = 'Primary Contact No Id';
                }
                field("ServiceAgreement"; Rec."Service Agreement")
                {
                    Caption = 'Service Agreement';
                }
                field("PrivacyBlocked"; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                }
                field("Territory"; Rec."Territory Code")   //lookup
                {
                    Caption = 'Territory Code';
                }
                field("TerritoryId"; Rec."Territory Code Id")
                {
                    Caption = 'Territory Code Id';
                }
                field("addressname"; Rec."Address Name")
                {
                    Caption = 'Address Name';
                }
                field("ContactCode"; Rec."Contact Code")
                {
                    Caption = 'Contact Code';
                }
                field(State; Rec.State)
                {
                    Caption = 'State';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(Dimension; Rec.Dimension)
                {
                    Caption = 'Dimension';
                }
                field("DimensionId"; Rec."Dimension Id")
                {
                    Caption = 'Dimension Id';
                }
                field("SupplieraccountGroup"; Rec."Supplier account Group")
                {
                    Caption = 'Supplier Account Group';
                }
                field(WEB; Rec.WEB)
                {
                    Caption = 'WEB';
                }
                field("CustomerPriceGroup"; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                }
                field("CustomerPriceGroupId"; Rec."Customer Price Group Id")
                {
                    Caption = 'Customer Price Group Id';
                }
                field("SalesPersonCode"; Rec."Sales Person Code")
                {
                    Caption = 'Sales Person Code';
                }
                field("OwnerShip"; Rec."Owner Ship")
                {
                    Caption = 'Owner Ship';
                }
                field(owner; Rec."Owner")
                {
                    Caption = 'Owner';
                }
                field(ownerid; Rec."Owner Id")
                {
                    Caption = 'Owner ID';
                }
               

            }
        }
    }
}
tableextension 50340 "Api vendor" extends Vendor
{
    fields
    {

        field(50501; "Primary Contact No Id"; Text[100])
        {
            Caption = 'Customer Price Group Id';
            DataClassification = ToBeClassified;
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
        field(50507; "CRM ID"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50510; "Dimension ID"; Text[100])
        {
            Caption = 'Dimension ID';
            DataClassification = ToBeClassified;
        }
        field(50511; "Customer Price Group Id"; Text[100])
        {
            Caption = 'Customer Price Group Id';
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
    }
}