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
                field(CompanyID; Rec."Company Name")
                {
                    Caption = 'Company Name';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(CompanyContactID; Rec."Company No.")
                {
                    Caption = 'Company ID';
                }
                // field(NoOfBusinessRelations; Rec."No. of Business Relations")
                // {
                //     Caption = 'Contact Business Relation';
                // }
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
                field("AddressName"; Rec."Address Name") { }
                field("Address"; Rec.Address)
                {
                    Caption = 'Address 2 Street 1';
                }
                field(Address2; Rec."Address 2")
                {
                    Caption = 'Address 2 Street 2';
                }
                field(Address3; Rec."Address 3")
                {
                    Caption = 'Address 2 Street 3';
                }
                field(City; Rec."D365 City")
                {
                    Caption = 'City';
                }
                field("State"; Rec."D365 State") { }
                field(County; Rec.County)
                {
                    Caption = 'County';
                }
                field(Country; Rec."D365 Country")
                {
                    Caption = 'Country';
                }
                field(PostCode; Rec."D365 Postal Code")
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
                field(Description;Rec.Description){}
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
                field("EMailGroupCode"; Rec."E-Mail Group Code")
                {
                    Caption = 'Email Group Code';
                }
            }
        }
    }
}

// codeunit 50113 "Contact Handler"
// {
//     [EventSubscriber(ObjectType::Table, Database::Contact, OnBeforeOnInsert, '', false, false)]
//     local procedure OnBeforeInsertContact(var Contact: Record Contact)
//     begin
//         SetBusinessRelationsToZero(Contact);
//     end;

//     local procedure SetBusinessRelationsToZero(var Contact: Record Contact)
//     begin
//         Contact.Validate("No. of Business Relations", 0);
//     end;
// }


