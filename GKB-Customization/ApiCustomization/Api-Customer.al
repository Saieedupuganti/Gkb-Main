page 50321 "API Customer"
{
    PageType = API;
    Caption = 'API Employee';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'Customer';
    EntitySetName = 'Customer';
    SourceTable = Customer;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field(code; Rec."No.")
                {
                    Caption = 'no';
                }
                field(primarycontact; Rec."Primary Contact No.")
                {
                    Caption = 'no';
                }
                field(primarycontact2; Rec."Primary Contact")
                {
                    Caption = 'Primary Contact';
                }
                field(primarycontact2id; Rec."Primary Contact CRMID")
                {
                    Caption = 'Primary Contact CRMID';
                }
                field("PhoneNo"; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field("D365AccountID"; Rec."D365 Account ID")
                {
                    Caption = 'Account Id';
                }
                field(ABN; Rec.ABN)
                {
                    Caption = 'ABN';
                }
                field("AccountContractManager"; Rec."Account Contract Manager")
                {
                    Caption = 'Account Contract Manager';
                }
                field("AccountContractManagerid"; Rec."Account Contract Manager ID")
                {
                    Caption = 'Account Contract Manager ID';
                }
                field(Addressname; Rec."Address Name")
                {
                    Caption = 'Address Name';
                }
                field(Address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field("Address2"; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field("Address3"; Rec."Address 3")
                {
                    Caption = 'Address';
                }
                field("CapexFrom"; Rec."Capex From")
                {
                    Caption = 'Capex From';
                }
                field("CapexTo"; Rec."Capex To")
                {
                    Caption = 'Capex To';
                }
                field("CountryRegionCode"; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(Contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }
                field("ContactGroup"; Rec."Contact Group")
                {
                    Caption = 'Contact Group';
                }
                field("CreditHold"; Rec."Credit Hold")
                {
                    Caption = 'Credit Hold';
                }
                field("CreditLimitLCY"; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit';
                }
                field(County; Rec.County)
                {
                    Caption = 'County';
                }
                field("CurrencyCode"; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field("Customergroup"; Rec."Customer group")
                {
                    Caption = 'Customer Group';
                }
                field("CustomerPriceGroup"; Rec."Customer Price Group")  //lookup
                {
                    Caption = 'Customer Price Group';
                }
                field("CustomerProfile"; Rec."Customer Profile")
                {
                    Caption = 'Customer Profile';
                }
                field("OwnerShip"; Rec."Owner Ship")
                {
                    Caption = 'Owner Ship';
                }
                field("PaymentMethodCode"; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field("PaymentTermsCode"; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field("city"; Rec.City)
                {
                    Caption = 'City';
                }
                field("SalespersonCode"; Rec."Salesperson Code")
                {
                    Caption = 'Sales person Code';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field("ServiceAgreement"; Rec."Service Agreement")
                {
                    Caption = 'Service Agreement';
                }
                field("EMail"; Rec."E-Mail")
                {
                    Caption = 'Caption';
                }
                field("FaxNo"; Rec."Fax No.")
                {
                    Caption = 'Fax No';
                }
                field("TerritoryCode"; Rec."Territory Code")  //lookup
                {
                    Caption = 'Territory Code';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field("PostCode"; Rec."Post Code")
                {
                    Caption = 'Postal Code';
                }
                field("SAPCustomerNumber"; Rec."SAP Customer Number")
                {
                    Caption = 'SAP Customer No.';
                }
                field(Dimension; Rec.Dimension)
                {
                    Caption = 'Dimension';
                }
                field("DimensionId"; Rec."Dimension Id")
                {
                    Caption = 'Dimension Id';
                }
                field("CustomContactId"; Rec."Custom Contact Id")
                {
                    Caption = 'Contact Id';
                }
                field("TerritoryCodeID"; Rec."Territory Code ID")
                {
                    Caption = 'Territory Code Id';
                }
                field("CustomerPriceGroupId"; Rec."Customer Price Group Id")
                {
                    Caption = 'Customer Price Group Id';
                }
                field(Territory; Rec.Territory)
                {
                    Caption = 'Terrotory';
                }
                field("TerritoryId"; Rec."Territory Id")
                {
                    Caption = 'Territory Id';
                }
                field("BlockPaymentTolerance"; Rec."Block Payment Tolerance")
                {
                    Caption = 'Block Payment Tolerence';
                }
                field("SupplieraccountGroup"; Rec."Supplier account Group")
                {
                    Caption = 'Supplier Account Group';
                }
                field(WEB; Rec.WEB)
                {
                    Caption = 'WEB';
                }
                field("PrivacyBlocked"; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                }
                field("ContactCode"; Rec."Contact Code")
                {
                    Caption = 'Contact Code';
                }

            }
        }
    }
}
tableextension 50321 "API Customer" extends Customer
{
    fields
    {
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
            Caption = 'Primary Contact';
            DataClassification = ToBeClassified;
            TableRelation = Contact."No.";
        }
        field(50134; "Primary Contact CRMID"; Text[100])
        {
            Caption = 'Primary Contact CRMID';
            DataClassification = ToBeClassified;
        }
        field(50136; "Address Name"; Text[100])
        {
            Caption = 'Address Name';
            DataClassification = ToBeClassified;
        }
    }
}
