page 60000 "API Vendor"
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
            }
        }
    }
}