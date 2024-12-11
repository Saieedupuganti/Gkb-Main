page 50307 "API Contact"
{
    PageType = API;
    Caption = 'API Employee';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'Contact';
    EntitySetName = 'Contact';
    SourceTable = Contact;
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
                field(CompanyName; Rec."Company Name")
                {
                    Caption = 'Company Name';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(CompanyID; Rec."Company No.")
                {
                    Caption = 'Company ID';
                }
                field(ContactBusinessRelation; Rec."Contact Business Relation")
                {
                    Caption = 'Contact Business Relation';
                }
                field(FirstName; Rec."First Name")
                {
                    Caption = 'First Name';
                }
                field(MiddleName; Rec."Middle Name")
                {
                    Caption = 'Middle Name';
                }
                field(Surname; Rec."Surname")
                {
                    Caption = 'Surname';
                }
                field(Address; Rec."Address")
                {
                    Caption = 'Address';
                }
                field("Address2Street1";Rec."Address 2 Street1")
                {
                    Caption = 'Address 2 Street 1';
                }
                field(Address2Street2;Rec."Address 2 Street 2")
                {
                    Caption = 'Address 2 Street 2';
                }
                field(Address2Street3;Rec."Address 2 Street 3")
                {
                    Caption = 'Address 2 Street 3';
                }
                field(City; Rec."City")
                {
                    Caption = 'City';
                }
                field(County; Rec.County)
                {
                    Caption = 'County';
                }
                field(CountryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/RegionCode';
                }
                field(PostCode; Rec."Post Code")
                {
                    Caption = 'PostCode';
                }
                field(Currency; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(Currencycrmid; Rec."Currency CRM Id")
                {
                    Caption = 'Currency CRM Id';
                }
                field(Faxno; Rec."Fax No.")
                {
                    Caption = 'Fax No';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(JobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                }
                field(SalutationCode; Rec."Salutation Code")
                {
                    Caption = 'Salutation Code';
                }
                field(PhoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No';
                }
                field(Email; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(MobilePhoneNo; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No';
                }
                field(DimensionID; Rec."Dimension ID")
                {
                    Caption = 'Dimension ID';
                }
                field(Dimension; Rec.Dimension)
                {
                    Caption = 'Dimension';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field("EMailGroupCode"; Rec."E-Mail Group Code")
                {
                    Caption = 'Email Group Code';
                }
            }
        }
    }
}


