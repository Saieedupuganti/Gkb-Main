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
                    Caption = 'Address 3';
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
                field("CurrencyCodeid"; Rec."Currency Code Id")
                {
                    Caption = 'Currency Code Id';
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
                field(owner; Rec."Owner")
                {
                    Caption = 'Owner';
                }
                field(ownerid; Rec."Owner Id")
                {
                    Caption = 'Owner ID';
                }
                field(supplieraccountgroup; Rec."Supplier Account Group")
                {
                    Caption = 'Supplier Account Group';
                }
                field("BlockPaymentTolerance"; Rec."Block Payment Tolerance")
                {
                    Caption = 'Block Payment Tolerence';
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
                field("parentaccount"; Rec."Parent Account")
                {
                    Caption = 'Parent Account';
                }
                field(parentaccountcrmid; Rec."Parent Account CRM ID")
                {
                    Caption = 'Parent Account CRM ID';
                }
            }
        }
    }
}

