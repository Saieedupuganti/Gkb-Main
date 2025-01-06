page 50501 "CDS Account List"
{
    Caption = 'CDS Account List';
    PageType = List;
    SourceTable = "CDS Account";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // Existing fields
                field(adids_AccountID; Rec.adids_AccountID)
                {
                    ApplicationArea = All;
                    Caption = 'Account ID';
                    Editable = false;
                }
                field(Name; rec."Name")
                {
                    ApplicationArea = All;
                    Caption = 'Account Name';
                }
                field(AccountNumber; rec."AccountNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Account Number';
                }
                field(EmailAddress1; rec."EMailAddress1")
                {
                    ApplicationArea = All;
                    Caption = 'Email Address';
                }
                field(Telephone1; rec."Telephone1")
                {
                    ApplicationArea = All;
                    Caption = 'Main Phone';
                }
                field(Revenue; rec."Revenue")
                {
                    ApplicationArea = All;
                    Caption = 'Annual Revenue';
                    DecimalPlaces = 2; // Set decimal places for currency
                }
                field(NumberOfEmployees; rec."NumberOfEmployees")
                {
                    ApplicationArea = All;
                    Caption = 'Number of Employees';
                }
                field(StateCode; rec."StateCode")
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }

                // New fields
                field(Address2_City; rec."Address2_City")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 City';
                }
                field(Address2_Country; rec."Address2_Country")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Country';
                }
                field(Address2_County; rec."Address2_County")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 County';
                }
                field(Address2_Fax; rec."Address2_Fax")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Fax';
                }
                field(Address2_Latitude; rec."Address2_Latitude")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Latitude';
                }
                field(Address2_Longitude; rec."Address2_Longitude")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Longitude';
                }
                field(Address2_PostalCode; rec."Address2_PostalCode")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Postal Code';
                }
                // field(address2_stre)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Address 2 Street';
                // }
                field(Address2_Telephone1; Rec."Address2_Telephone1")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Telephone 1';
                }
                field(Address1_Telephone2; Rec.Address1_Telephone2)
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Telephone 2';
                }
                field(Address1_Telephone3; Rec.Address1_Telephone3)
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Telephone 3';
                }
                field(PreferredContactMethodCode; Rec.PreferredContactMethodCode)
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Shipping Method Code';
                }
                field(PreferredAppointmentDayCode; Rec.PreferredAppointmentDayCode)
                {
                    ApplicationArea = All;
                    Caption = 'Preferred Appointment Day Code';
                }
                field(PreferredAppointmentTimeCode; Rec.PreferredAppointmentTimeCode)
                {
                    ApplicationArea = All;
                    Caption = 'Preferred Appointment Time Code';
                }
                field(Merged; Rec.Merged)
                {
                    ApplicationArea = All;
                    Caption = 'Merged';
                }
                field(DoNotSendMM; Rec.DoNotSendMM)
                {
                    ApplicationArea = All;
                    Caption = 'Do Not Send Marketing Material';
                }
                field(MasterId; Rec.MasterId)
                {
                    ApplicationArea = All;
                    Caption = 'Master ID';
                }
                field(LastUsedInCampaign; Rec.LastUsedInCampaign)
                {
                    ApplicationArea = All;
                    Caption = 'Last Used In Campaign';
                }
                field(ExchangeRate; Rec.ExchangeRate)
                {
                    ApplicationArea = All;
                    Caption = 'Exchange';
                }
                // Additional fields based on integration field mapping
                field(adids_PaymentBlock; Rec.adids_PaymentBlock)
                {
                    ApplicationArea = All;
                    Caption = 'Block Payment Tolerance';
                }
                field(adids_CustomerGroup; Rec.adids_CustomerGroup)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Group';
                }
                field(adids_CustomerProfile; Rec.adids_CustomerProfile)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Profile';
                }
                field(adids_SAPCustomerNumber; Rec.adids_SAPCustomerNumber)
                {
                    ApplicationArea = All;
                    Caption = 'SAP Customer Number';
                }
                field(adids_TassLevel; Rec.adids_TassLevel)
                {
                    ApplicationArea = All;
                    Caption = 'Service Agreement';
                }
                field(adids_SupplierAccountGroups; Rec.adids_SupplierAccountGroups)
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Account Groups';
                }
                field(adids_AccountManager; Rec.adids_AccountManager)
                {
                    ApplicationArea = All;
                    Caption = 'Account Manager';
                }
            }
        }
    }
    // actions
    // {
    //     area(processing)
    //     {
    //         action(CreateFromCDS)
    //         {
    //             ApplicationArea = All;
    //             Caption = 'Create in Business Central';
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             ToolTip = 'Generate the table from the coupled Microsoft Dataverse lab book.';
    //             trigger OnAction()
    //             var
    //                 CDSLabBook: Record "CDS Account";
    //                 CRMIntegrationManagement: Codeunit "CRM Integration Management";
    //             begin
    //                 CurrPage.SetSelectionFilter(CDSLabBook);
    //                 CRMIntegrationManagement.CreateNewRecordsFromCRM(CDSLabBook);
    //             end;
    //         }
    //     }
    // }
    // var
    //     CurrentlyCoupledCDSAccount: Record "CDS Account";

    // trigger OnInit()
    // begin
    //     Codeunit.Run(Codeunit::"CRM Integration Management");
    // end;

    // procedure SetCurrentlyCoupledCDSAccount(CDSAccount: Record "CDS Account")
    // begin
    //     CurrentlyCoupledCDSAccount := CDSAccount;
    // end;
}
