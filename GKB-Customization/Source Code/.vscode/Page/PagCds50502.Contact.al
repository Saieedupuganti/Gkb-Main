page 50502 "CDS Contact List"
{
    Caption = 'CDS Contact List';
    PageType = List;
    SourceTable = "CDS Contact";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ContactId; Rec.ContactId)
                {
                    ApplicationArea = All;
                    Caption = 'Contact ID';
                }
                field(adids_ContactID; Rec.adids_ContactID)
                {
                    ApplicationArea = All;
                    Caption = 'Account ID';
                }
                field(CustomerSizeCode; Rec."CustomerSizeCode")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Size Code';
                }
                field(PreferredContactMethodCode; Rec."PreferredContactMethodCode")
                {
                    ApplicationArea = All;
                    Caption = 'Preferred Contact Method Code';
                }
                field(CustomerTypeCode; Rec."CustomerTypeCode")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Type Code';
                }
                field(TerritoryCode; Rec."TerritoryCode")
                {
                    ApplicationArea = All;
                    Caption = 'Territory Code';
                }
                field(TraversedPath; Rec."TraversedPath")
                {
                    ApplicationArea = All;
                    Caption = 'Traversed Path';
                }
                field(PaymentTermsCode; Rec."PaymentTermsCode")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Terms Code';
                }
                field(ShippingMethodCode; Rec."ShippingMethodCode")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Method Code';
                }
                field(ParticipatesInWorkflow; Rec."ParticipatesInWorkflow")
                {
                    ApplicationArea = All;
                    Caption = 'Participates In Workflow';
                }
                field(FullName; Rec."FullName")
                {
                    ApplicationArea = All;
                    Caption = 'Full Name';
                }
                field(Description; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
                field(WebSiteURL; Rec."WebSiteURL")
                {
                    ApplicationArea = All;
                    Caption = 'Website URL';
                }
                field(FtpSiteURL; Rec."FtpSiteURL")
                {
                    ApplicationArea = All;
                    Caption = 'FTP Site URL';
                }
                field(EMailAddress1; Rec."EMailAddress1")
                {
                    ApplicationArea = All;
                    Caption = 'Email Address 1';
                }
                field(EMailAddress2; Rec."EMailAddress2")
                {
                    ApplicationArea = All;
                    Caption = 'Email Address 2';
                }
                field(EMailAddress3; Rec."EMailAddress3")
                {
                    ApplicationArea = All;
                    Caption = 'Email Address 3';
                }
                field(DoNotPhone; Rec."DoNotPhone")
                {
                    ApplicationArea = All;
                    Caption = 'Do Not Phone';
                }
                field(DoNotFax; Rec."DoNotFax")
                {
                    ApplicationArea = All;
                    Caption = 'Do Not Fax';
                }
                field(Telephone1; Rec."Telephone1")
                {
                    ApplicationArea = All;
                    Caption = 'Telephone 1';
                }
                field(DoNotEMail; Rec."DoNotEMail")
                {
                    ApplicationArea = All;
                    Caption = 'Do Not Email';
                }
                field(Telephone2; Rec."Telephone2")
                {
                    ApplicationArea = All;
                    Caption = 'Telephone 2';
                }
                field(Fax; Rec."Fax")
                {
                    ApplicationArea = All;
                    Caption = 'Fax';
                }
                field(Telephone3; Rec."Telephone3")
                {
                    ApplicationArea = All;
                    Caption = 'Telephone 3';
                }
                field(DoNotPostalMail; Rec."DoNotPostalMail")
                {
                    ApplicationArea = All;
                    Caption = 'Do Not Postal Mail';
                }
                field(DoNotBulkEMail; Rec."DoNotBulkEMail")
                {
                    ApplicationArea = All;
                    Caption = 'Do Not Bulk Email';
                }
                field(DoNotBulkPostalMail; Rec."DoNotBulkPostalMail")
                {
                    ApplicationArea = All;
                    Caption = 'Do Not Bulk Postal Mail';
                }
                field(CreditLimit; Rec."CreditLimit")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Limit';
                }
                field(CreditOnHold; Rec."CreditOnHold")
                {
                    ApplicationArea = All;
                    Caption = 'Credit On Hold';
                }
                field(CreatedOn; Rec."CreatedOn")
                {
                    ApplicationArea = All;
                    Caption = 'Created On';
                }
                field(ModifiedOn; Rec."ModifiedOn")
                {
                    ApplicationArea = All;
                    Caption = 'Modified On';
                }
                field(VersionNumber; Rec."VersionNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Version Number';
                }
                field(Aging30; Rec."Aging30")
                {
                    ApplicationArea = All;
                    Caption = 'Aging 30';
                }
                field(Aging60; Rec."Aging60")
                {
                    ApplicationArea = All;
                    Caption = 'Aging 60';
                }
                field(StateCode; Rec."StateCode")
                {
                    ApplicationArea = All;
                    Caption = 'State Code';
                }
                field(Aging90; Rec."Aging90")
                {
                    ApplicationArea = All;
                    Caption = 'Aging 90';
                }
                field(Address1_AddressId; Rec."Address1_AddressId")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 ID';
                }
                field(Address1_AddressTypeCode; Rec."Address1_AddressTypeCode")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Type Code';
                }
                field(Address1_Name; Rec."Address1_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Name';
                }
                field(Address1_PrimaryContactName; Rec."Address1_PrimaryContactName")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Primary Contact Name';
                }
                field(Address1_Line1; Rec."Address1_Line1")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Line 1';
                }
                field(Address1_Line2; Rec."Address1_Line2")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Line 2';
                }
                field(Address1_Line3; Rec."Address1_Line3")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Line 3';
                }
                field(Address1_City; Rec."Address1_City")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 City';
                }
                field(Address1_StateOrProvince; Rec."Address1_StateOrProvince")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 State/Province';
                }
                field(Address1_County; Rec."Address1_County")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 County';
                }
                field(Address1_Country; Rec."Address1_Country")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Country';
                }
                field(Address1_PostOfficeBox; Rec."Address1_PostOfficeBox")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Post Office Box';
                }
                field(Address1_PostalCode; Rec."Address1_PostalCode")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Postal Code';
                }
                field(Address1_UTCOffset; Rec."Address1_UTCOffset")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 UTC Offset';
                }
                field(Address1_FreightTermsCode; Rec."Address1_FreightTermsCode")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Freight Terms Code';
                }
                field(Address1_UPSZone; Rec."Address1_UPSZone")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 UPS Zone';
                }
                field(Address1_Latitude; Rec."Address1_Latitude")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Latitude';
                }
                field(Address1_Telephone1; Rec."Address1_Telephone1")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Telephone 1';
                }
                field(Address1_Longitude; Rec."Address1_Longitude")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Longitude';
                }
                field(Address1_ShippingMethodCode; Rec."Address1_ShippingMethodCode")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Shipping Method Code';
                }
                field(Address1_Telephone2; Rec."Address1_Telephone2")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Telephone 2';
                }
                field(Address1_Telephone3; Rec."Address1_Telephone3")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Telephone 3';
                }
                field(Address1_Fax; Rec."Address1_Fax")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Fax';
                }
                field(Address2_AddressId; Rec."Address2_AddressId")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 ID';
                }
                field(Address2_AddressTypeCode; Rec."Address2_AddressTypeCode")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Type Code';
                }
                field(Address2_Name; Rec."Address2_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Name';
                }
                field(Address2_PrimaryContactName; Rec."Address2_PrimaryContactName")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Primary Contact Name';
                }
                field(Address2_Line1; Rec."Address2_Line1")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Line 1';
                }
                field(Address2_Line2; Rec."Address2_Line2")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Line 2';
                }
                field(Address2_Line3; Rec."Address2_Line3")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Line 3';
                }
                field(Address2_City; Rec."Address2_City")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 City';
                }
                field(Address2_StateOrProvince; Rec."Address2_StateOrProvince")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 State/Province';
                }
                field(Address2_County; Rec."Address2_County")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 County';
                }
                field(Address2_Country; Rec."Address2_Country")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Country';
                }
                field(Address2_PostOfficeBox; Rec."Address2_PostOfficeBox")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Post Office Box';
                }
                field(Address2_PostalCode; Rec."Address2_PostalCode")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Postal Code';
                }
                field(Address2_UTCOffset; Rec."Address2_UTCOffset")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 UTC Offset';
                }
                field(Address2_FreightTermsCode; Rec."Address2_FreightTermsCode")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Freight Terms Code';
                }
                field(Address2_UPSZone; Rec."Address2_UPSZone")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 UPS Zone';
                }
                field(Address2_Latitude; Rec."Address2_Latitude")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Latitude';
                }
                field(Address2_Telephone1; Rec."Address2_Telephone1")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Telephone 1';
                }
                field(Address2_Longitude; Rec."Address2_Longitude")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Longitude';
                }
                field(Address2_ShippingMethodCode; Rec."Address2_ShippingMethodCode")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Shipping Method Code';
                }
                field(Address2_Telephone2; Rec."Address2_Telephone2")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Telephone 2';
                }
                field(Address2_Telephone3; Rec."Address2_Telephone3")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Telephone 3';
                }
                field(Address2_Fax; Rec."Address2_Fax")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Fax';
                }
                field(PreferredAppointmentDayCode; Rec."PreferredAppointmentDayCode")
                {
                    ApplicationArea = All;
                    Caption = 'Preferred Appointment Day Code';
                }
                field(PreferredAppointmentTimeCode; Rec."PreferredAppointmentTimeCode")
                {
                    ApplicationArea = All;
                    Caption = 'Preferred Appointment Time Code';
                }
                field(Merged; Rec."Merged")
                {
                    ApplicationArea = All;
                    Caption = 'Merged';
                }
                field(DoNotSendMM; Rec."DoNotSendMM")
                {
                    ApplicationArea = All;
                    Caption = 'Do Not Send MM';
                }
                field(MasterId; Rec."MasterId")
                {
                    ApplicationArea = All;
                    Caption = 'Master ID';
                }
                field(LastUsedInCampaign; Rec."LastUsedInCampaign")
                {
                    ApplicationArea = All;
                    Caption = 'Last Used In Campaign';
                }
                field(ExchangeRate; Rec."ExchangeRate")
                {
                    ApplicationArea = All;
                    Caption = 'Exchange Rate';
                }
                field(UTCConversionTimeZoneCode; Rec."UTCConversionTimeZoneCode")
                {
                    ApplicationArea = All;
                    Caption = 'UTC Conversion Time Zone Code';
                }
                field(OverriddenCreatedOn; Rec."OverriddenCreatedOn")
                {
                    ApplicationArea = All;
                    Caption = 'Overridden Created On';
                }
                field(TimeZoneRuleVersionNumber; Rec."TimeZoneRuleVersionNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Time Zone Rule Version Number';
                }
                field(ImportSequenceNumber; Rec."ImportSequenceNumber")
                {
                    ApplicationArea = All;
                    Caption = 'Import Sequence Number';
                }
                field(CreditLimit_Base; Rec."CreditLimit_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Limit Base';
                }
                field(Aging30_Base; Rec."Aging30_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Aging 30 Base';
                }
                field(Aging90_Base; Rec."Aging90_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Aging 90 Base';
                }
                field(Aging60_Base; Rec."Aging60_Base")
                {
                    ApplicationArea = All;
                    Caption = 'Aging 60 Base';
                }
                field(StageId; Rec."StageId")
                {
                    ApplicationArea = All;
                    Caption = 'Stage ID';
                }
                field(ProcessId; Rec."ProcessId")
                {
                    ApplicationArea = All;
                    Caption = 'Process ID';
                }
                field(Address2_Composite; Rec."Address2_Composite")
                {
                    ApplicationArea = All;
                    Caption = 'Address 2 Composite';
                }
                field(Address1_Composite; Rec."Address1_Composite")
                {
                    ApplicationArea = All;
                    Caption = 'Address 1 Composite';
                }
                field(EntityImageId; Rec."EntityImageId")
                {
                    ApplicationArea = All;
                    Caption = 'Entity Image ID';
                }
                field(TimeSpentByMeOnEmailAndMeetings; Rec."TimeSpentByMeOnEmailAndMeetings")
                {
                    ApplicationArea = All;
                    Caption = 'Time Spent By Me On Email And Meetings';
                }
                field(OnHoldTime; Rec."OnHoldTime")
                {
                    ApplicationArea = All;
                    Caption = 'On Hold Time';
                }
                field(LastOnHoldTime; Rec."LastOnHoldTime")
                {
                    ApplicationArea = All;
                    Caption = 'Last On Hold Time';
                }
                field(FollowEmail; Rec."FollowEmail")
                {
                    ApplicationArea = All;
                    Caption = 'Follow Email';
                }
                field(MarketingOnly; Rec."MarketingOnly")
                {
                    ApplicationArea = All;
                    Caption = 'Marketing Only';
                }
                field(Adx_CreatedByIPAddress; Rec."Adx_CreatedByIPAddress")
                {
                    ApplicationArea = All;
                    Caption = 'ADX Created By IP Address';
                }
                field(Adx_CreatedByUsername; Rec."Adx_CreatedByUsername")
                {
                    ApplicationArea = All;
                    Caption = 'ADX Created By Username';
                }
                field(Adx_ModifiedByIPAddress; Rec."Adx_ModifiedByIPAddress")
                {
                    ApplicationArea = All;
                    Caption = 'ADX Modified By IP Address';
                }
                field(Adx_ModifiedByUsername; Rec."Adx_ModifiedByUsername")
                {
                    ApplicationArea = All;
                    Caption = 'ADX Modified By Username';
                }
                // field(msa_managingpartnerid; Rec.msa)
                // {
                //     ApplicationArea = All;
                //     Caption = 'MSA Managing Partner ID';
                // }

                field(TeamsFollowed; Rec."TeamsFollowed")
                {
                    ApplicationArea = All;
                    Caption = 'Teams Followed';
                }
                field(msdyn_gdproptout; Rec."msdyn_gdproptout")
                {
                    ApplicationArea = All;
                    Caption = 'MSDyn GDPR Opt Out';
                }

                field(adids_PAYMENTTERMS; Rec."adids_PAYMENTTERMS")
                {
                    ApplicationArea = All;
                    Caption = 'ADIDS Payment Terms';
                }
                field(adids_PaymentMethod; Rec."adids_PaymentMethod")
                {
                    ApplicationArea = All;
                    Caption = 'ADIDS Payment Method';
                }

                field(adids_ImportSerialNo; Rec."adids_ImportSerialNo")
                {
                    ApplicationArea = All;
                    Caption = 'ADIDS Import Serial No';
                }
                field(bim_fromphonenumber; Rec."bim_fromphonenumber")
                {
                    ApplicationArea = All;
                    Caption = 'BIM From Phone Number';
                }
                field(bim_isarchived; Rec."bim_isarchived")
                {
                    ApplicationArea = All;
                    Caption = 'BIM Is Archived';
                }
                field(bim_optout; Rec."bim_optout")
                {
                    ApplicationArea = All;
                    Caption = 'BIM Opt Out';
                }
                field(bim_selectedcountry; Rec."bim_selectedcountry")
                {
                    ApplicationArea = All;
                    Caption = 'BIM Selected Country';
                }
                field(adigkb_bcid; Rec."adigkb_bcid")
                {
                    ApplicationArea = All;
                    Caption = 'ADIGKB BCID';
                }
                field(adids_emailgroupcode; Rec."adids_emailgroupcode")
                {
                    ApplicationArea = All;
                    Caption = 'E-Mail Group Code';
                }
            }
        }
    }
}