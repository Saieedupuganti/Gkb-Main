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
                field("no"; Rec."No.")
                {
                    Caption = 'no';
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
                field("ContactGroups"; Rec."Contact Groups")
                {
                    Caption = 'Contact Group';
                }
                field("BalanceDueLCY"; Rec."Balance Due (LCY)")
                {
                    Caption = 'Balance Due';
                }
                field("CurrencyCode"; Rec."Currency Code")  //llokup
                {
                    Caption = 'Currency Code';
                }
                field("CurrencyCodeId"; Rec."Currency Code Id")
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
                field("TerritoryCode"; Rec."Territory Code")   //lookup
                {
                    Caption = 'Territory Code';
                }
                field("TerritoryCodeId"; Rec."Territory Code Id")
                {
                    Caption = 'Territory Code Id';
                }
            }
        }
    }
}
tableextension 50340 "Api vendor" extends Vendor
{
    fields
    {

        field(50502; "Primary Contact No Id"; Text[100])
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
        field(50506; "Territory Code Id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
}