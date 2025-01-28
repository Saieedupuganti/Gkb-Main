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
                field(ABN; Rec.ABN)
                {
                    Caption = 'ABN';
                }
                field(Address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(Addressname; Rec."Address Name")
                {
                    Caption = 'Address Name';
                }
                field("Address2"; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field("Address3"; Rec."Address 3")
                {
                    Caption = 'Address 3';
                }
                field("BlockPaymentTolerance"; Rec."Block Payment Tolerance")
                {
                    Caption = 'Block Payment Tolerence';
                }
                field("CapexFrom"; Rec."Capex From")
                {
                    Caption = 'Capex From';
                }
                field("CapexTo"; Rec."Capex To")
                {
                    Caption = 'Capex To';
                }
                field("city"; rec."D365 City")
                {
                    Caption = 'City';
                }
                field(code; Rec."No.")
                {
                    Caption = 'no';
                }
                field("ContactGroup"; Rec."Contact Groups")
                {
                    Caption = 'Contact Group';
                }
                field("Country"; Rec."D365 Country")
                {
                    Caption = 'Country/Region Code';
                }
                field(County; Rec.County)
                {
                    Caption = 'County';
                }
                field("CreditHold"; Rec."Credit Hold")
                {
                    Caption = 'Credit Hold';
                }
                field("CreditLimitLCY"; Rec."Credit Amount (LCY)")
                {
                    Caption = 'Credit Limit';
                }
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field("CurrencyCode"; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field("Customergroup"; Rec."Customer group")
                {
                    Caption = 'Customer Group';
                }
                // The below two fields only for the reference with customer

                // field("CustomerPriceGroup"; Rec."Customer Price Group")    //Not in Vendor
                // {
                //     Caption = 'Customer Price Group';
                // }
                // field("CustomerPriceGroupId"; Rec."Customer Price Group Id")   // NOt In Vendor
                // {
                //     Caption = 'Customer Price Group Id';
                // }
                field("CustomerProfile"; Rec."Vendor Profile")
                {
                    Caption = 'Customer Profile';
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
                field("D365AccountID"; Rec."D365 Account ID")
                {
                    Caption = 'Account Id';
                }
                field("EMail"; Rec."E-Mail")
                {
                    Caption = 'Caption';
                }
                field("FaxNo"; Rec."Fax No.")
                {
                    Caption = 'Fax No';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(ownerid; Rec."Owner Id")
                {
                    Caption = 'Owner ID';
                }
                field("PaymentMethodCode"; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field("PaymentTermsCode"; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field("PhoneNo"; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field("PostCode"; Rec."D365 Postal Code")
                {
                    Caption = 'Postal Code';
                }
                field("PrivacyBlocked"; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                }
                field(primarycontact; Rec."Primary Contact No.")
                {
                    Caption = 'no';
                }
                field("SAPCustomerNumber"; Rec."SAP Vendor Number")
                {
                    Caption = 'SAP Customer No.';
                }
                field("ServiceAgreement"; Rec."Service Agreement")
                {
                    Caption = 'Service Agreement';
                }
                field(State; Rec."D365 State")
                {
                    Caption = 'State';
                }
                field(supplieraccountgroup; Rec."Supplier Account Group")
                {
                    Caption = 'Supplier Account Group';
                }
                field("TerritoryCode"; Rec."Territory Code")
                {
                    Caption = 'Territory Code';
                }
                field("TerritoryCodeID"; Rec."Territory Code ID")
                {
                    Caption = 'Territory Code Id';
                }
                field(WEB; Rec.WEB)
                {
                    Caption = 'WEB';
                }
            }
        }
    }
}


