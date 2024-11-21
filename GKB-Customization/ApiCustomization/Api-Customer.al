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
                field(primarycontactid; Rec."Primary Contact CRMID")
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
                field(Territory; Rec.Territory)
                {
                    Caption = 'Terrotory';
                }
                field("TerritoryId"; Rec."Territory Id")
                {
                    Caption = 'Territory Id';
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
                field(website; Rec.Website)
                {
                    Caption = 'Website';
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
        field(50139; "Website"; Code[30])
        {
            Caption = 'Website';
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
        field(50142; "Currency Code Id"; Text[100])
        {
            Caption = 'Currency Code Id';
            DataClassification = ToBeClassified;
        }
        field(50143; "Parent Account"; Text[100])
        {
            Caption = 'Parent Account';
            DataClassification = ToBeClassified;
        }
        field(50144; "Parent Account CRM ID"; Text[100])
        {
            Caption = 'Parent Account CRM ID';
            DataClassification = ToBeClassified;
        }
    }




    trigger OnAfterModify()
    var
        dimRec: Record Dimension;
        customerRec: Record Customer;
        currencyRec: Record Currency;
        contactRec: Record Contact;
        territoryRec: Record Territory;
        modified:Integer;
    begin
        
        modified:=0;
        // Check if field has changed and is not empty
        if (Rec."Primary Contact CRMID"<>'') and (xRec."Primary Contact CRMID"<>Rec."Primary Contact CRMID") then begin
            contactRec.SetFilter("CRM ID",Rec."Primary Contact CRMID");
            if contactRec.FindFirst() then begin
                Rec."Primary Contact" := contactRec."No.";
                Rec."Primary Contact No." := contactRec."No.";
                modified:=modified+1;
            end;
        end;
        
        // Check if field has changed and is not empty
        if (Rec."Currency Code Id"<>'') and (xRec."Currency Code Id"<>Rec."Currency Code Id") then begin
            currencyRec.SetFilter("CRM ID",Rec."Currency Code Id");
            if currencyRec.FindFirst() then begin
                Rec."Currency Code" := currencyRec.Code;
                modified:=modified+1;
            end;
        end;

        // Check if field has changed and is not empty
        if (Rec."Dimension ID"<>'') and (xRec."Dimension ID" <>Rec."Dimension ID") then begin
            dimRec.SetFilter("CRM ID",Rec."Dimension ID");
            if dimRec.FindFirst() then begin
                Rec.Dimension := dimRec.Code;
                modified:=modified+1;
            end;
        end;

        // Check if field has changed and is not empty
        if (Rec."Territory Code ID"<>'') and (xRec."Territory Code ID" <>Rec."Territory Code ID") then begin
            territoryRec.SetFilter("CRM ID",Rec."Territory Code ID");
            if territoryRec.FindFirst() then begin
                Rec."Territory Code" := territoryRec.Code;
                modified:=modified+1;
            end;
        end;

        // Nodify only if found atleast 1 CRM - BC match
        if modified>0 then begin
            Rec.Modify(false);
        end;
    end;


}
