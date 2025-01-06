table 50114 "CDS Account"
{
  ExternalName = 'account';
  TableType = CDS;
  Description = 'Business that represents a customer or potential customer. The company that is billed in business transactions.';

  fields
  {
    field(1; AccountId; GUID)
    {
      ExternalName = 'accountid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Insert;
      Description = 'Unique identifier of the account.';
      Caption = 'Account';
    }
    field(2; AccountCategoryCode; Option)
    {
      ExternalName = 'accountcategorycode';
      ExternalType = 'Picklist';
      Description = 'Select a category to indicate whether the customer account is standard or preferred.';
      Caption = 'Category';
      InitValue = " ";
      OptionMembers = " ", PreferredCustomer, Standard;
      OptionOrdinalValues = -1, 1, 2;
    }
    field(5; CustomerSizeCode; Option)
    {
      ExternalName = 'customersizecode';
      ExternalType = 'Picklist';
      Description = 'Select the size category or range of the account for segmentation and reporting purposes.';
      Caption = 'Customer Size';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(6; PreferredContactMethodCode; Option)
    {
      ExternalName = 'preferredcontactmethodcode';
      ExternalType = 'Picklist';
      Description = 'Select the preferred method of contact.';
      Caption = 'Preferred Method of Contact';
      InitValue = Any;
      OptionMembers = Any, Email, Phone, Fax, Mail;
      OptionOrdinalValues = 1, 2, 3, 4, 5;
    }
    field(7; CustomerTypeCode; Option)
    {
      ExternalName = 'customertypecode';
      ExternalType = 'Picklist';
      Description = 'Select the category that best describes the relationship between the account and your organization.';
      Caption = 'Contact Groups';
      InitValue = Customer;
      OptionMembers = Competitor, Consultant, Customer, Influencer, Investor, Manufacturer, Partner, Press, Prospect, Reseller, SubContractor, Vendor, Others;
      OptionOrdinalValues = 1, 2, 3, 4, 5, 6, 7, 12, 8, 9, 10, 11, 13;
    }
    field(8; AccountRatingCode; Option)
    {
      ExternalName = 'accountratingcode';
      ExternalType = 'Picklist';
      Description = 'Select a rating to indicate the value of the customer account.';
      Caption = 'Account Rating';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(9; IndustryCode; Option)
    {
      ExternalName = 'industrycode';
      ExternalType = 'Picklist';
      Description = 'Select the account''s primary industry for use in marketing segmentation and demographic analysis.';
      Caption = 'Industry';
      InitValue = " ";
      OptionMembers = " ", Accounting, "AgricultureAndNon-petrolNaturalResourceExtraction", BroadcastingPrintingAndPublishing, Brokers, BuildingSupplyRetail, BusinessServices, Consulting, ConsumerServices, DesignDirectionAndCreativeManagement, DistributorsDispatchersAndProcessors, DoctorsOfficesAndClinics, DurableManufacturing, EatingAndDrinkingPlaces, EntertainmentRetail, EquipmentRentalAndLeasing, Financial, FoodAndTobaccoProcessing, InboundCapitalIntensiveProcessing, InboundRepairAndServices, Insurance, LegalServices, "Non-DurableMerchandiseRetail", OutboundConsumerService, PetrochemicalExtractionAndDistribution, ServiceRetail, SIGAffiliations, SocialServices, SpecialOutboundTradeContractors, SpecialtyRealty, Transportation, UtilityCreationAndDistribution, VehicleRetail, Wholesale;
      OptionOrdinalValues = -1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33;
    }
    field(10; TerritoryCode; Option)
    {
      ExternalName = 'territorycode';
      ExternalType = 'Picklist';
      Description = 'Select a region or territory for the account for use in segmentation and analysis.';
      Caption = 'Territory Code';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(11; AccountClassificationCode; Option)
    {
      ExternalName = 'accountclassificationcode';
      ExternalType = 'Picklist';
      Description = 'Select a classification code to indicate the potential value of the customer account based on the projected return on investment, cooperation level, sales cycle length or other criteria.';
      Caption = 'Classification';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(13; BusinessTypeCode; Option)
    {
      ExternalName = 'businesstypecode';
      ExternalType = 'Picklist';
      Description = 'Select the legal designation or other business type of the account for contracts or reporting purposes.';
      Caption = 'Business Type';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(15; TraversedPath; Text[1250])
    {
      ExternalName = 'traversedpath';
      ExternalType = 'String';
      Description = 'For internal use only.';
      Caption = '(Deprecated) Traversed Path';
    }
    field(18; PaymentTermsCode; Option)
    {
      ExternalName = 'paymenttermscode';
      ExternalType = 'Picklist';
      Description = 'Select the payment terms to indicate when the customer needs to pay the total amount.';
      Caption = 'Payment Terms- D365';
      InitValue = " ";
      OptionMembers = " ", NET30, "2%10NET", NET45, NET60, "10DAYS", "14DAYS", "15DAYS", "1M(8D)", "2DAYS", "21DAYS", "30DAYS", "60DAYS", "7DAYS", CM, ARCOD;
      OptionOrdinalValues = -1, 1, 2, 3, 4, 100000000, 100000001, 100000002, 100000003, 100000004, 100000005, 100000006, 100000007, 100000008, 100000009, 100000010;
    }
    field(19; ShippingMethodCode; Option)
    {
      ExternalName = 'shippingmethodcode';
      ExternalType = 'Picklist';
      Description = 'Select a shipping method for deliveries sent to the account''s address to designate the preferred carrier or other delivery option.';
      Caption = 'Shipping Method';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(21; ParticipatesInWorkflow; Boolean)
    {
      ExternalName = 'participatesinworkflow';
      ExternalType = 'Boolean';
      Description = 'For system use only. Legacy Microsoft Dynamics CRM 3.0 workflow data.';
      Caption = 'Participates in Workflow';
    }
    field(22; Name; Text[160])
    {
      ExternalName = 'name';
      ExternalType = 'String';
      Description = 'Type the company or business name.';
      Caption = 'Account Name';
    }
    field(23; AccountNumber; Text[20])
    {
      ExternalName = 'accountnumber';
      ExternalType = 'String';
      Description = 'Type an ID number or code for the account to quickly search and identify the account in system views.';
      Caption = 'Account ID';
    }
    field(24; Revenue; Decimal)
    {
      ExternalName = 'revenue';
      ExternalType = 'Money';
      Description = 'Type the annual revenue for the account, used as an indicator in financial performance analysis.';
      Caption = 'Annual Revenue';
    }
    field(25; NumberOfEmployees; Integer)
    {
      ExternalName = 'numberofemployees';
      ExternalType = 'Integer';
      Description = 'Type the number of employees that work at the account for use in marketing segmentation and demographic analysis.';
      Caption = 'Number of Employees';
    }
    field(26; Description; BLOB)
    {
      ExternalName = 'description';
      ExternalType = 'Memo';
      Description = 'Type additional information to describe the account, such as an excerpt from the company''s website.';
      Caption = 'Description';
      Subtype = Memo;
    }
    field(27; SIC; Text[20])
    {
      ExternalName = 'sic';
      ExternalType = 'String';
      Description = 'Type the Standard Industrial Classification (SIC) code that indicates the account''s primary industry of business, for use in marketing segmentation and demographic analysis.';
      Caption = 'SIC Code';
    }
    field(28; OwnershipCode; Option)
    {
      ExternalName = 'ownershipcode';
      ExternalType = 'Picklist';
      Description = 'Select the account''s ownership structure, such as public or private.';
      Caption = 'Ownership';
      InitValue = " ";
      OptionMembers = " ", Public, Private, Subsidiary, Other;
      OptionOrdinalValues = -1, 1, 2, 3, 4;
    }
    field(29; MarketCap; Decimal)
    {
      ExternalName = 'marketcap';
      ExternalType = 'Money';
      Description = 'Type the market capitalization of the account to identify the company''s equity, used as an indicator in financial performance analysis.';
      Caption = 'Market Capitalization';
    }
    field(30; SharesOutstanding; Integer)
    {
      ExternalName = 'sharesoutstanding';
      ExternalType = 'Integer';
      Description = 'Type the number of shares available to the public for the account. This number is used as an indicator in financial performance analysis.';
      Caption = 'Shares Outstanding';
    }
    field(31; TickerSymbol; Text[10])
    {
      ExternalName = 'tickersymbol';
      ExternalType = 'String';
      Description = 'Type the stock exchange symbol for the account to track financial performance of the company. You can click the code entered in this field to access the latest trading information from MSN Money.';
      Caption = 'Ticker Symbol';
    }
    field(32; StockExchange; Text[20])
    {
      ExternalName = 'stockexchange';
      ExternalType = 'String';
      Description = 'Type the stock exchange at which the account is listed to track their stock and financial performance of the company.';
      Caption = 'Stock Exchange';
    }
    field(33; WebSiteURL; Text[200])
    {
      ExternalName = 'websiteurl';
      ExternalType = 'String';
      Description = 'Type the account''s website URL to get quick details about the company profile.';
      Caption = 'Website';
    }
    field(34; FtpSiteURL; Text[200])
    {
      ExternalName = 'ftpsiteurl';
      ExternalType = 'String';
      Description = 'Type the URL for the account''s FTP site to enable users to access data and share documents.';
      Caption = 'FTP Site';
    }
    field(35; EMailAddress1; Text[100])
    {
      ExternalName = 'emailaddress1';
      ExternalType = 'String';
      Description = 'Type the primary email address for the account.';
      Caption = 'Email';
    }
    field(36; EMailAddress2; Text[100])
    {
      ExternalName = 'emailaddress2';
      ExternalType = 'String';
      Description = 'Type the secondary email address for the account.';
      Caption = 'Email Address 2';
    }
    field(37; EMailAddress3; Text[100])
    {
      ExternalName = 'emailaddress3';
      ExternalType = 'String';
      Description = 'Type an alternate email address for the account.';
      Caption = 'Email Address 3';
    }
    field(38; DoNotPhone; Boolean)
    {
      ExternalName = 'donotphone';
      ExternalType = 'Boolean';
      Description = 'Select whether the account allows phone calls. If Do Not Allow is selected, the account will be excluded from phone call activities distributed in marketing campaigns.';
      Caption = 'Do not allow Phone Calls';
    }
    field(39; DoNotFax; Boolean)
    {
      ExternalName = 'donotfax';
      ExternalType = 'Boolean';
      Description = 'Select whether the account allows faxes. If Do Not Allow is selected, the account will be excluded from fax activities distributed in marketing campaigns.';
      Caption = 'Do not allow Faxes';
    }
    field(40; Telephone1; Text[50])
    {
      ExternalName = 'telephone1';
      ExternalType = 'String';
      Description = 'Type the main phone number for this account.';
      Caption = 'Main Phone';
    }
    field(41; DoNotEMail; Boolean)
    {
      ExternalName = 'donotemail';
      ExternalType = 'Boolean';
      Description = 'Select whether the account allows direct email sent from Microsoft Dynamics 365.';
      Caption = 'Do not allow Emails';
    }
    field(42; Telephone2; Text[50])
    {
      ExternalName = 'telephone2';
      ExternalType = 'String';
      Description = 'Type a second phone number for this account.';
      Caption = 'Other Phone';
    }
    field(43; Fax; Text[50])
    {
      ExternalName = 'fax';
      ExternalType = 'String';
      Description = 'Type the fax number for the account.';
      Caption = 'Fax';
    }
    field(44; Telephone3; Text[50])
    {
      ExternalName = 'telephone3';
      ExternalType = 'String';
      Description = 'Type a third phone number for this account.';
      Caption = 'Telephone 3';
    }
    field(45; DoNotPostalMail; Boolean)
    {
      ExternalName = 'donotpostalmail';
      ExternalType = 'Boolean';
      Description = 'Select whether the account allows direct mail. If Do Not Allow is selected, the account will be excluded from letter activities distributed in marketing campaigns.';
      Caption = 'Do not allow Mails';
    }
    field(46; DoNotBulkEMail; Boolean)
    {
      ExternalName = 'donotbulkemail';
      ExternalType = 'Boolean';
      Description = 'Select whether the account allows bulk email sent through campaigns. If Do Not Allow is selected, the account can be added to marketing lists, but is excluded from email.';
      Caption = 'Do not allow Bulk Emails';
    }
    field(47; DoNotBulkPostalMail; Boolean)
    {
      ExternalName = 'donotbulkpostalmail';
      ExternalType = 'Boolean';
      Description = 'Select whether the account allows bulk postal mail sent through marketing campaigns or quick campaigns. If Do Not Allow is selected, the account can be added to marketing lists, but will be excluded from the postal mail.';
      Caption = 'Do not allow Bulk Mails';
    }
    field(48; CreditLimit; Decimal)
    {
      ExternalName = 'creditlimit';
      ExternalType = 'Money';
      Description = 'Type the credit limit of the account. This is a useful reference when you address invoice and accounting issues with the customer.';
      Caption = 'Credit Limit';
    }
    field(49; CreditOnHold; Boolean)
    {
      ExternalName = 'creditonhold';
      ExternalType = 'Boolean';
      Description = 'Select whether the credit for the account is on hold. This is a useful reference while addressing the invoice and accounting issues with the customer.';
      Caption = 'Credit Hold';
    }
    field(51; CreatedOn; Datetime)
    {
      ExternalName = 'createdon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Shows the date and time when the record was created. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
      Caption = 'Created On';
    }
    field(53; ModifiedOn; Datetime)
    {
      ExternalName = 'modifiedon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Shows the date and time when the record was last updated. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
      Caption = 'Modified On';
    }
    field(56; VersionNumber; BigInteger)
    {
      ExternalName = 'versionnumber';
      ExternalType = 'BigInt';
      ExternalAccess = Read;
      Description = 'Version number of the account.';
      Caption = 'Version Number';
    }
    field(57; ParentAccountId; GUID)
    {
      ExternalName = 'parentaccountid';
      ExternalType = 'Lookup';
      Description = 'Choose the parent account associated with this account to show parent and child businesses in reporting and analytics.';
      Caption = 'Parent Account';
      TableRelation = "CDS Account".AccountId;
    }
    field(58; Aging30; Decimal)
    {
      ExternalName = 'aging30';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'For system use only.';
      Caption = 'Aging 30';
    }
    field(59; StateCode; Option)
    {
      ExternalName = 'statecode';
      ExternalType = 'State';
      ExternalAccess = Modify;
      Description = 'Shows whether the account is active or inactive. Inactive accounts are read-only and can''t be edited unless they are reactivated.';
      Caption = 'Status';
      InitValue = Active;
      OptionMembers = Active, Inactive;
      OptionOrdinalValues = 0, 1;
    }
    field(60; Aging60; Decimal)
    {
      ExternalName = 'aging60';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'For system use only.';
      Caption = 'Aging 60';
    }
    field(61; StatusCode; Option)
    {
      ExternalName = 'statuscode';
      ExternalType = 'Status';
      Description = 'Select the account''s status.';
      Caption = 'Status Reason';
      InitValue = " ";
      OptionMembers = " ", Active, Inactive, Pending, Inactive1;
      OptionOrdinalValues = -1, 1, 2, 888880001, 888880002;
    }
    field(62; Aging90; Decimal)
    {
      ExternalName = 'aging90';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'For system use only.';
      Caption = 'Aging 90';
    }
    field(73; Address1_AddressId; GUID)
    {
      ExternalName = 'address1_addressid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Unique identifier for address 1.';
      Caption = 'Address 1: ID';
    }
    field(74; Address1_AddressTypeCode; Option)
    {
      ExternalName = 'address1_addresstypecode';
      ExternalType = 'Picklist';
      Description = 'Select the primary address type.';
      Caption = 'Address 1: Address Type';
      InitValue = " ";
      OptionMembers = " ", BillTo, ShipTo, Primary, Other;
      OptionOrdinalValues = -1, 1, 2, 3, 4;
    }
    field(75; Address1_Name; Text[200])
    {
      ExternalName = 'address1_name';
      ExternalType = 'String';
      Description = 'Type a descriptive name for the primary address, such as Corporate Headquarters.';
      Caption = 'Address 1: Name';
    }
    field(76; Address1_PrimaryContactName; Text[100])
    {
      ExternalName = 'address1_primarycontactname';
      ExternalType = 'String';
      Description = 'Type the name of the main contact at the account''s primary address.';
      Caption = 'Address 1: Primary Contact Name';
    }
    field(77; Address1_Line1; Text[250])
    {
      ExternalName = 'address1_line1';
      ExternalType = 'String';
      Description = 'Type the first line of the primary address.';
      Caption = 'Address 1: Street 1';
    }
    field(78; Address1_Line2; Text[250])
    {
      ExternalName = 'address1_line2';
      ExternalType = 'String';
      Description = 'Type the second line of the primary address.';
      Caption = 'Address 1: Street 2';
    }
    field(79; Address1_Line3; Text[250])
    {
      ExternalName = 'address1_line3';
      ExternalType = 'String';
      Description = 'Type the third line of the primary address.';
      Caption = 'Address 1: Street 3';
    }
    field(80; Address1_City; Text[80])
    {
      ExternalName = 'address1_city';
      ExternalType = 'String';
      Description = 'Type the city for the primary address.';
      Caption = 'Address 1: City';
    }
    field(81; Address1_StateOrProvince; Text[50])
    {
      ExternalName = 'address1_stateorprovince';
      ExternalType = 'String';
      Description = 'Type the state or province of the primary address.';
      Caption = 'Address 1: State/Province';
    }
    field(82; Address1_County; Text[50])
    {
      ExternalName = 'address1_county';
      ExternalType = 'String';
      Description = 'Type the county for the primary address.';
      Caption = 'Address 1: County';
    }
    field(83; Address1_Country; Text[80])
    {
      ExternalName = 'address1_country';
      ExternalType = 'String';
      Description = 'Type the country or region for the primary address.';
      Caption = 'Address 1: Country/Region';
    }
    field(84; Address1_PostOfficeBox; Text[20])
    {
      ExternalName = 'address1_postofficebox';
      ExternalType = 'String';
      Description = 'Type the post office box number of the primary address.';
      Caption = 'Address 1: Post Office Box';
    }
    field(85; Address1_PostalCode; Text[20])
    {
      ExternalName = 'address1_postalcode';
      ExternalType = 'String';
      Description = 'Type the ZIP Code or postal code for the primary address.';
      Caption = 'Address 1: ZIP/Postal Code';
    }
    field(86; Address1_UTCOffset; Integer)
    {
      ExternalName = 'address1_utcoffset';
      ExternalType = 'Integer';
      Description = 'Select the time zone, or UTC offset, for this address so that other people can reference it when they contact someone at this address.';
      Caption = 'Address 1: UTC Offset';
    }
    field(87; Address1_FreightTermsCode; Option)
    {
      ExternalName = 'address1_freighttermscode';
      ExternalType = 'Picklist';
      Description = 'Select the freight terms for the primary address to make sure shipping orders are processed correctly.';
      Caption = 'Address 1: Freight Terms';
      InitValue = " ";
      OptionMembers = " ", FOB, NoCharge, CFR, CIF, CIP, CPT, DAF, DDP, DDU, DELIVERY, DEQ, DES, EXW, FAS, FCA, PICKUP;
      OptionOrdinalValues = -1, 1, 2, 100000000, 100000001, 100000002, 100000003, 100000004, 100000005, 100000006, 100000007, 100000008, 100000009, 100000010, 100000011, 100000012, 100000013;
    }
    field(88; Address1_UPSZone; Text[4])
    {
      ExternalName = 'address1_upszone';
      ExternalType = 'String';
      Description = 'Type the UPS zone of the primary address to make sure shipping charges are calculated correctly and deliveries are made promptly, if shipped by UPS.';
      Caption = 'Address 1: UPS Zone';
    }
    field(89; Address1_Latitude; Decimal)
    {
      ExternalName = 'address1_latitude';
      ExternalType = 'Double';
      Description = 'Type the latitude value for the primary address for use in mapping and other applications.';
      Caption = 'Address 1: Latitude';
    }
    field(90; Address1_Telephone1; Text[50])
    {
      ExternalName = 'address1_telephone1';
      ExternalType = 'String';
      Description = 'Type the main phone number associated with the primary address.';
      Caption = 'Address Phone';
    }
    field(91; Address1_Longitude; Decimal)
    {
      ExternalName = 'address1_longitude';
      ExternalType = 'Double';
      Description = 'Type the longitude value for the primary address for use in mapping and other applications.';
      Caption = 'Address 1: Longitude';
    }
    field(92; Address1_ShippingMethodCode; Option)
    {
      ExternalName = 'address1_shippingmethodcode';
      ExternalType = 'Picklist';
      Description = 'Select a shipping method for deliveries sent to this address.';
      Caption = 'Address 1: Shipping Method';
      InitValue = " ";
      OptionMembers = " ", Airborne, DHL, FEDEX, UPS, PostalMail, FullLoad, WillCall, AUPOST, "OWNLOG.";
      OptionOrdinalValues = -1, 1, 2, 3, 4, 5, 6, 7, 100000000, 100000001;
    }
    field(93; Address1_Telephone2; Text[50])
    {
      ExternalName = 'address1_telephone2';
      ExternalType = 'String';
      Description = 'Type a second phone number associated with the primary address.';
      Caption = 'Address 1: Telephone 2';
    }
    field(94; Address1_Telephone3; Text[50])
    {
      ExternalName = 'address1_telephone3';
      ExternalType = 'String';
      Description = 'Type a third phone number associated with the primary address.';
      Caption = 'Address 1: Telephone 3';
    }
    field(95; Address1_Fax; Text[50])
    {
      ExternalName = 'address1_fax';
      ExternalType = 'String';
      Description = 'Type the fax number associated with the primary address.';
      Caption = 'Address 1: Fax';
    }
    field(96; Address2_AddressId; GUID)
    {
      ExternalName = 'address2_addressid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Unique identifier for address 2.';
      Caption = 'Address 2: ID';
    }
    field(97; Address2_AddressTypeCode; Option)
    {
      ExternalName = 'address2_addresstypecode';
      ExternalType = 'Picklist';
      Description = 'Select the secondary address type.';
      Caption = 'Address 2: Address Type';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(98; Address2_Name; Text[200])
    {
      ExternalName = 'address2_name';
      ExternalType = 'String';
      Description = 'Type a descriptive name for the secondary address, such as Corporate Headquarters.';
      Caption = 'Address 2: Name';
    }
    field(99; Address2_PrimaryContactName; Text[100])
    {
      ExternalName = 'address2_primarycontactname';
      ExternalType = 'String';
      Description = 'Type the name of the main contact at the account''s secondary address.';
      Caption = 'Address 2: Primary Contact Name';
    }
    field(100; Address2_Line1; Text[250])
    {
      ExternalName = 'address2_line1';
      ExternalType = 'String';
      Description = 'Type the first line of the secondary address.';
      Caption = 'Address 2: Street 1';
    }
    field(101; Address2_Line2; Text[250])
    {
      ExternalName = 'address2_line2';
      ExternalType = 'String';
      Description = 'Type the second line of the secondary address.';
      Caption = 'Address 2: Street 2';
    }
    field(102; Address2_Line3; Text[250])
    {
      ExternalName = 'address2_line3';
      ExternalType = 'String';
      Description = 'Type the third line of the secondary address.';
      Caption = 'Address 2: Street 3';
    }
    field(103; Address2_City; Text[80])
    {
      ExternalName = 'address2_city';
      ExternalType = 'String';
      Description = 'Type the city for the secondary address.';
      Caption = 'Address 2: City';
    }
    field(104; Address2_StateOrProvince; Text[50])
    {
      ExternalName = 'address2_stateorprovince';
      ExternalType = 'String';
      Description = 'Type the state or province of the secondary address.';
      Caption = 'Address 2: State/Province';
    }
    field(105; Address2_County; Text[50])
    {
      ExternalName = 'address2_county';
      ExternalType = 'String';
      Description = 'Type the county for the secondary address.';
      Caption = 'Address 2: County';
    }
    field(106; Address2_Country; Text[80])
    {
      ExternalName = 'address2_country';
      ExternalType = 'String';
      Description = 'Type the country or region for the secondary address.';
      Caption = 'Address 2: Country/Region';
    }
    field(107; Address2_PostOfficeBox; Text[20])
    {
      ExternalName = 'address2_postofficebox';
      ExternalType = 'String';
      Description = 'Type the post office box number of the secondary address.';
      Caption = 'Address 2: Post Office Box';
    }
    field(108; Address2_PostalCode; Text[20])
    {
      ExternalName = 'address2_postalcode';
      ExternalType = 'String';
      Description = 'Type the ZIP Code or postal code for the secondary address.';
      Caption = 'Address 2: ZIP/Postal Code';
    }
    field(109; Address2_UTCOffset; Integer)
    {
      ExternalName = 'address2_utcoffset';
      ExternalType = 'Integer';
      Description = 'Select the time zone, or UTC offset, for this address so that other people can reference it when they contact someone at this address.';
      Caption = 'Address 2: UTC Offset';
    }
    field(110; Address2_FreightTermsCode; Option)
    {
      ExternalName = 'address2_freighttermscode';
      ExternalType = 'Picklist';
      Description = 'Select the freight terms for the secondary address to make sure shipping orders are processed correctly.';
      Caption = 'Address 2: Freight Terms';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(111; Address2_UPSZone; Text[4])
    {
      ExternalName = 'address2_upszone';
      ExternalType = 'String';
      Description = 'Type the UPS zone of the secondary address to make sure shipping charges are calculated correctly and deliveries are made promptly, if shipped by UPS.';
      Caption = 'Address 2: UPS Zone';
    }
    field(112; Address2_Latitude; Decimal)
    {
      ExternalName = 'address2_latitude';
      ExternalType = 'Double';
      Description = 'Type the latitude value for the secondary address for use in mapping and other applications.';
      Caption = 'Address 2: Latitude';
    }
    field(113; Address2_Telephone1; Text[50])
    {
      ExternalName = 'address2_telephone1';
      ExternalType = 'String';
      Description = 'Type the main phone number associated with the secondary address.';
      Caption = 'Address 2: Telephone 1';
    }
    field(114; Address2_Longitude; Decimal)
    {
      ExternalName = 'address2_longitude';
      ExternalType = 'Double';
      Description = 'Type the longitude value for the secondary address for use in mapping and other applications.';
      Caption = 'Address 2: Longitude';
    }
    field(115; Address2_ShippingMethodCode; Option)
    {
      ExternalName = 'address2_shippingmethodcode';
      ExternalType = 'Picklist';
      Description = 'Select a shipping method for deliveries sent to this address.';
      Caption = 'Address 2: Shipping Method';
      InitValue = DefaultValue;
      OptionMembers = DefaultValue;
      OptionOrdinalValues = 1;
    }
    field(116; Address2_Telephone2; Text[50])
    {
      ExternalName = 'address2_telephone2';
      ExternalType = 'String';
      Description = 'Type a second phone number associated with the secondary address.';
      Caption = 'Address 2: Telephone 2';
    }
    field(117; Address2_Telephone3; Text[50])
    {
      ExternalName = 'address2_telephone3';
      ExternalType = 'String';
      Description = 'Type a third phone number associated with the secondary address.';
      Caption = 'Address 2: Telephone 3';
    }
    field(118; Address2_Fax; Text[50])
    {
      ExternalName = 'address2_fax';
      ExternalType = 'String';
      Description = 'Type the fax number associated with the secondary address.';
      Caption = 'Address 2: Fax';
    }
    field(156; PreferredAppointmentDayCode; Option)
    {
      ExternalName = 'preferredappointmentdaycode';
      ExternalType = 'Picklist';
      Description = 'Select the preferred day of the week for service appointments.';
      Caption = 'Preferred Day';
      InitValue = " ";
      OptionMembers = " ", Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday;
      OptionOrdinalValues = -1, 0, 1, 2, 3, 4, 5, 6;
    }
    field(158; PreferredAppointmentTimeCode; Option)
    {
      ExternalName = 'preferredappointmenttimecode';
      ExternalType = 'Picklist';
      Description = 'Select the preferred time of day for service appointments.';
      Caption = 'Preferred Time';
      InitValue = " ";
      OptionMembers = " ", Morning, Afternoon, Evening;
      OptionOrdinalValues = -1, 1, 2, 3;
    }
    field(159; Merged; Boolean)
    {
      ExternalName = 'merged';
      ExternalType = 'Boolean';
      ExternalAccess = Read;
      Description = 'Shows whether the account has been merged with another account.';
      Caption = 'Merged';
    }
    field(160; DoNotSendMM; Boolean)
    {
      ExternalName = 'donotsendmm';
      ExternalType = 'Boolean';
      Description = 'Select whether the account accepts marketing materials, such as brochures or catalogs.';
      Caption = 'Send Marketing Materials';
    }
    field(161; MasterId; GUID)
    {
      ExternalName = 'masterid';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Shows the master account that the account was merged with.';
      Caption = 'Master ID';
      TableRelation = "CDS Account".AccountId;
    }
    field(162; LastUsedInCampaign; Date)
    {
      ExternalName = 'lastusedincampaign';
      ExternalType = 'DateTime';
      ExternalAccess = Modify;
      Description = 'Shows the date when the account was last included in a marketing campaign or quick campaign.';
      Caption = 'Last Date Included in Campaign';
    }
    field(177; ExchangeRate; Decimal)
    {
      ExternalName = 'exchangerate';
      ExternalType = 'Decimal';
      ExternalAccess = Read;
      Description = 'Shows the conversion rate of the record''s currency. The exchange rate is used to convert all money fields in the record from the local currency to the system''s default currency.';
      Caption = 'Exchange Rate';
    }
    field(178; UTCConversionTimeZoneCode; Integer)
    {
      ExternalName = 'utcconversiontimezonecode';
      ExternalType = 'Integer';
      Description = 'Time zone code that was in use when the record was created.';
      Caption = 'UTC Conversion Time Zone Code';
    }
    field(179; OverriddenCreatedOn; Date)
    {
      ExternalName = 'overriddencreatedon';
      ExternalType = 'DateTime';
      ExternalAccess = Insert;
      Description = 'Date and time that the record was migrated.';
      Caption = 'Record Created On';
    }
    field(180; TimeZoneRuleVersionNumber; Integer)
    {
      ExternalName = 'timezoneruleversionnumber';
      ExternalType = 'Integer';
      Description = 'For internal use only.';
      Caption = 'Time Zone Rule Version Number';
    }
    field(181; ImportSequenceNumber; Integer)
    {
      ExternalName = 'importsequencenumber';
      ExternalType = 'Integer';
      ExternalAccess = Insert;
      Description = 'Unique identifier of the data import or data migration that created this record.';
      Caption = 'Import Sequence Number';
    }
    field(183; CreditLimit_Base; Decimal)
    {
      ExternalName = 'creditlimit_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Shows the credit limit converted to the system''s default base currency for reporting purposes.';
      Caption = 'Credit Limit (Base)';
    }
    field(185; Aging30_Base; Decimal)
    {
      ExternalName = 'aging30_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'The base currency equivalent of the aging 30 field.';
      Caption = 'Aging 30 (Base)';
    }
    field(186; Revenue_Base; Decimal)
    {
      ExternalName = 'revenue_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Shows the annual revenue converted to the system''s default base currency. The calculations use the exchange rate specified in the Currencies area.';
      Caption = 'Annual Revenue (Base)';
    }
    field(187; Aging90_Base; Decimal)
    {
      ExternalName = 'aging90_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'The base currency equivalent of the aging 90 field.';
      Caption = 'Aging 90 (Base)';
    }
    field(189; MarketCap_Base; Decimal)
    {
      ExternalName = 'marketcap_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Shows the market capitalization converted to the system''s default base currency.';
      Caption = 'Market Capitalization (Base)';
    }
    field(190; Aging60_Base; Decimal)
    {
      ExternalName = 'aging60_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'The base currency equivalent of the aging 60 field.';
      Caption = 'Aging 60 (Base)';
    }
    field(197; YomiName; Text[160])
    {
      ExternalName = 'yominame';
      ExternalType = 'String';
      Description = 'Type the phonetic spelling of the company name, if specified in Japanese, to make sure the name is pronounced correctly in phone calls and other communications.';
      Caption = 'Yomi Account Name';
    }
    field(210; StageId; GUID)
    {
      ExternalName = 'stageid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Shows the ID of the stage.';
      Caption = '(Deprecated) Process Stage';
    }
    field(211; ProcessId; GUID)
    {
      ExternalName = 'processid';
      ExternalType = 'Uniqueidentifier';
      Description = 'Shows the ID of the process.';
      Caption = 'Process';
    }
    field(213; Address2_Composite; BLOB)
    {
      ExternalName = 'address2_composite';
      ExternalType = 'Memo';
      ExternalAccess = Read;
      Description = 'Shows the complete secondary address.';
      Caption = 'Address 2';
      Subtype = Memo;
    }
    field(214; Address1_Composite; BLOB)
    {
      ExternalName = 'address1_composite';
      ExternalType = 'Memo';
      ExternalAccess = Read;
      Description = 'Shows the complete primary address.';
      Caption = 'Address 1';
      Subtype = Memo;
    }
    field(215; EntityImageId; GUID)
    {
      ExternalName = 'entityimageid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Read;
      Description = 'For internal use only.';
      Caption = 'Entity Image Id';
    }
    field(223; TimeSpentByMeOnEmailAndMeetings; Text[1250])
    {
      ExternalName = 'timespentbymeonemailandmeetings';
      ExternalType = 'String';
      ExternalAccess = Read;
      Description = 'Total time spent for emails (read and write) and meetings by me in relation to account record.';
      Caption = 'Time Spent by me';
    }
    field(236; PrimarySatoriId; Text[200])
    {
      ExternalName = 'primarysatoriid';
      ExternalType = 'String';
      Description = 'Primary Satori ID for Account';
      Caption = 'Primary Satori ID';
    }
    field(237; PrimaryTwitterId; Text[128])
    {
      ExternalName = 'primarytwitterid';
      ExternalType = 'String';
      Description = 'Primary Twitter ID for Account';
      Caption = 'Primary Twitter ID';
    }
    field(241; OnHoldTime; Integer)
    {
      ExternalName = 'onholdtime';
      ExternalType = 'Integer';
      ExternalAccess = Read;
      Description = 'Shows how long, in minutes, that the record was on hold.';
      Caption = 'On Hold Time (Minutes)';
    }
    field(242; LastOnHoldTime; Datetime)
    {
      ExternalName = 'lastonholdtime';
      ExternalType = 'DateTime';
      Description = 'Contains the date and time stamp of the last on hold time.';
      Caption = 'Last On Hold Time';
    }
    field(244; FollowEmail; Boolean)
    {
      ExternalName = 'followemail';
      ExternalType = 'Boolean';
      Description = 'Information about whether to allow following email activity like opens, attachment views and link clicks for emails sent to the account.';
      Caption = 'Follow Email Activity';
    }
    field(247; MarketingOnly; Boolean)
    {
      ExternalName = 'marketingonly';
      ExternalType = 'Boolean';
      Description = 'Whether is only for marketing';
      Caption = 'Marketing Only';
    }
    field(10001; Adx_CreatedByIPAddress; Text[100])
    {
      ExternalName = 'adx_createdbyipaddress';
      ExternalType = 'String';
      Description = '';
      Caption = 'Created By (IP Address)';
    }
    field(10002; Adx_CreatedByUsername; Text[100])
    {
      ExternalName = 'adx_createdbyusername';
      ExternalType = 'String';
      Description = '';
      Caption = 'Created By (User Name)';
    }
    field(10003; Adx_ModifiedByIPAddress; Text[100])
    {
      ExternalName = 'adx_modifiedbyipaddress';
      ExternalType = 'String';
      Description = '';
      Caption = 'Modified By (IP Address)';
    }
    field(10004; Adx_ModifiedByUsername; Text[100])
    {
      ExternalName = 'adx_modifiedbyusername';
      ExternalType = 'String';
      Description = '';
      Caption = 'Modified By (User Name)';
    }
    field(10005; msa_managingpartnerid; GUID)
    {
      ExternalName = 'msa_managingpartnerid';
      ExternalType = 'Lookup';
      Description = 'Unique identifier for Account associated with Account.';
      Caption = 'Managing Partner';
      TableRelation = "CDS Account".AccountId;
    }
    field(10013; PreferredEquipmentId; GUID)
    {
      ExternalName = 'preferredequipmentid';
      ExternalType = 'Lookup';
      Description = 'Choose the account''s preferred service facility or equipment to make sure services are scheduled correctly for the customer.';
      Caption = 'Preferred Facility/Equipment';
      TableRelation = "CDS Account".AccountId;
    }
    field(10018; OpenDeals; Integer)
    {
      ExternalName = 'opendeals';
      ExternalType = 'Integer';
      ExternalAccess = Read;
      Description = 'Number of open opportunities against an account and its child accounts.';
      Caption = 'Open Deals';
    }
    field(10019; OpenDeals_Date; Datetime)
    {
      ExternalName = 'opendeals_date';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Last Updated time of rollup field Open Deals.';
      Caption = 'Open Deals (Last Updated On)';
    }
    field(10020; OpenDeals_State; Integer)
    {
      ExternalName = 'opendeals_state';
      ExternalType = 'Integer';
      ExternalAccess = Read;
      Description = 'State of rollup field Open Deals.';
      Caption = 'Open Deals (State)';
    }
    field(10021; OpenRevenue; Decimal)
    {
      ExternalName = 'openrevenue';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Sum of open revenue against an account and its child accounts.';
      Caption = 'Open Revenue';
    }
    field(10022; OpenRevenue_Base; Decimal)
    {
      ExternalName = 'openrevenue_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Open Revenue in base currency.';
      Caption = 'Open Revenue (Base)';
    }
    field(10023; OpenRevenue_Date; Datetime)
    {
      ExternalName = 'openrevenue_date';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Last Updated time of rollup field Open Revenue.';
      Caption = 'Open Revenue (Last Updated On)';
    }
    field(10024; OpenRevenue_State; Integer)
    {
      ExternalName = 'openrevenue_state';
      ExternalType = 'Integer';
      ExternalAccess = Read;
      Description = 'State of rollup field Open Revenue.';
      Caption = 'Open Revenue (State)';
    }
    field(10026; TeamsFollowed; Integer)
    {
      ExternalName = 'teamsfollowed';
      ExternalType = 'Integer';
      Description = 'Number of users or conversations followed the record';
      Caption = 'TeamsFollowed';
    }
    field(10029; msdyn_gdproptout; Boolean)
    {
      ExternalName = 'msdyn_gdproptout';
      ExternalType = 'Boolean';
      Description = 'Describes whether account is opted out or not';
      Caption = 'GDPR Optout';
    }
    field(10033; msdyn_BillingAccount; GUID)
    {
      ExternalName = 'msdyn_billingaccount';
      ExternalType = 'Lookup';
      Description = 'Reference to an other account to be used for billing (only to be used if billing account differs)';
      Caption = 'Billing Account';
      TableRelation = "CDS Account".AccountId;
    }
    field(10034; msdyn_TaxExempt; Boolean)
    {
      ExternalName = 'msdyn_taxexempt';
      ExternalType = 'Boolean';
      Description = 'Select whether the account is tax exempt.';
      Caption = 'Tax Exempt';
    }
    field(10036; msdyn_TaxExemptNumber; Text[20])
    {
      ExternalName = 'msdyn_taxexemptnumber';
      ExternalType = 'String';
      Description = 'Shows the government tax exempt number.';
      Caption = 'Tax Exempt Number';
    }
    field(10042; msdyn_TravelCharge; Decimal)
    {
      ExternalName = 'msdyn_travelcharge';
      ExternalType = 'Money';
      Description = 'Enter the travel charge to include on work orders. This value will be multiplied by the travel charge type.';
      Caption = 'Travel Charge';
    }
    field(10043; msdyn_travelcharge_Base; Decimal)
    {
      ExternalName = 'msdyn_travelcharge_base';
      ExternalType = 'Money';
      ExternalAccess = Read;
      Description = 'Value of the Travel Charge in base currency.';
      Caption = 'Travel Charge (Base)';
    }
    field(10044; msdyn_TravelChargeType; Option)
    {
      ExternalName = 'msdyn_travelchargetype';
      ExternalType = 'Picklist';
      Description = 'Specify how travel is charged for this account.';
      Caption = 'Travel Charge Type';
      InitValue = None;
      OptionMembers = Hourly, Mileage, Fixed, None;
      OptionOrdinalValues = 690970000, 690970001, 690970002, 690970003;
    }
    field(10047; msdyn_WorkOrderInstructions; BLOB)
    {
      ExternalName = 'msdyn_workorderinstructions';
      ExternalType = 'Memo';
      Description = 'Shows the default instructions to show on new work orders.';
      Caption = 'Work Order Instructions';
      Subtype = Memo;
    }
    field(10054; adids_ABN; Text[100])
    {
      ExternalName = 'adids_abn';
      ExternalType = 'String';
      Description = '';
      Caption = 'ABN';
    }
    field(10055; adids_CustomerProfile; Option)
    {
      ExternalName = 'adids_customerprofile';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Customer Profile';
      InitValue = " ";
      OptionMembers = " ", Agriculture, Beverages, Buildings, Chemical, Competition, Concrete, Consultants, Education, EngineerProcureConstruct, Food, GovernmentOrganisation, HealthCare, "Hotel&Casinos", "Laundry&Clean", Manufacturing, "MaterialsConstruction&Packaging", MiningAndPreciousMetals, "N/A", OEMMachinery, "Oil&Gas", Other, Packaging, PetFood, "Pharma&Biotech", PowerGeneration, "Pulp&Paper", Recycling, "Rubber&Plastic", SIGAffiliations, ServiceProviders, ServiceRetail, SocialServices, SpecialOutboundTradeContractors, SpecialtyRealty, Textiles, TimberAndForestry, Transportation, UtilityCreationAndDistribution, VehicleRetail, WaterAndWaste, Wholesale;
      OptionOrdinalValues = -1, 888880038, 888880000, 888880001, 888880002, 888880003, 888880032, 888880004, 888880005, 888880033, 888880006, 888880007, 888880008, 888880009, 888880010, 888880011, 888880012, 888880013, 888880037, 888880014, 888880015, 888880016, 888880034, 888880040, 888880017, 888880018, 888880019, 888880039, 888880020, 888880021, 888880035, 888880022, 888880023, 888880024, 888880025, 888880036, 888880026, 888880027, 888880028, 888880029, 888880030, 888880031;
    }
    field(10057; adids_SAPCustomerNumber; Text[100])
    {
      ExternalName = 'adids_sapcustomernumber';
      ExternalType = 'String';
      Description = '';
      Caption = 'SAP Customer Number';
    }
    field(10058; adids_CustomerGroup; Option)
    {
      ExternalName = 'adids_customergroup';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Customer Group';
      InitValue = " ";
      OptionMembers = " ", Platinum, Gold, Silver, Bronze, "N/A";
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004;
    }
    field(10060; adids_AccountManager; Option)
    {
      ExternalName = 'adids_accountmanager';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Account Manager';
      InitValue = " ";
      OptionMembers = " ", AnthonySandorCsillag, AviAneja, BenjaminShamuel, BrendanOBrien, "DeniseLombardi-Carraro", FebinAnthony, JuanOgaz, MeerHassan, FebinAnthony1, JuanOgaz1, MeganDuniam, MichaelAland, MidhunJayakumar, MuhammadHassanMalik, NalgunalingamSatgunalingam, NikolinaMukevska, PhilipGiles, RavjotSingh, RoxanaCisternas, SabyBinjo, ShaneOBrien, SiljaTeles, TonyButler, VineetaGupta, YanXu, YuvrajKhanna, "N/A";
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005, 888880006, 888880007, 888880008, 888880009, 888880010, 888880011, 888880012, 888880013, 888880014, 888880015, 888880016, 888880017, 888880018, 888880019, 888880020, 888880021, 888880022, 888880023, 888880024, 888880025, 888880026;
    }
    field(10062; adids_SupplierAccountGroups; Option)
    {
      ExternalName = 'adids_supplieraccountgroups';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Supplier Account Groups';
      InitValue = " ";
      OptionMembers = " ", Accounting, Amenities, BoilerAncillaries, BoilerManufacturer, BurnerManagement, Communication, Competition, Consultants, CreditCards, Electrical, Employees, Engineering, EquipmentRental, "Freight&Transport", GasComponents, "Inspection&Certification", IT, Legal, MotorVehicles, Plumbing, SafetyEquipment, Subcontractor, Tooling, Travel, Other, "N/A";
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005, 888880006, 888880007, 888880008, 888880009, 888880010, 888880011, 888880012, 888880013, 888880014, 888880015, 888880016, 888880017, 888880018, 888880019, 888880020, 888880021, 888880022, 888880023, 888880024, 888880025;
    }
    field(10064; adids_PAYMENTTERMS; Option)
    {
      ExternalName = 'adids_paymentterms';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'PAYMENT TERMS';
      InitValue = " ";
      OptionMembers = " ", ARCOD, AR7DaysINV, AR14DaysINV, AR28DaysEOM, AR30DaysEOM, AR30DaysINV, AR45DaysEOM, AR60DaysEOM, AR60DaysINV, AR90DaysEOM, AR90DaysINV, APCOD, AP7DaysINV, AP14DaysINV, AP30DaysEOM, AP30DaysINV, AP60DayEOM, AP60DaysINV;
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005, 888880006, 888880007, 888880008, 888880009, 888880010, 888880011, 888880012, 888880013, 888880014, 888880015, 888880016, 888880017;
    }
    field(10066; adids_PaymentMethod; Option)
    {
      ExternalName = 'adids_paymentmethod';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Payment Method';
      InitValue = " ";
      OptionMembers = " ", Cheque, DirectDeposit, "NAB-Eftpos", CreditCard, Other, "N/A";
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005;
    }
    field(10068; adids_AccountName; Text[100])
    {
      ExternalName = 'adids_accountname';
      ExternalType = 'String';
      Description = '';
      Caption = 'Bank Account Name';
    }
    field(10069; adids_BSB; Text[100])
    {
      ExternalName = 'adids_bsb';
      ExternalType = 'String';
      Description = '';
      Caption = 'BSB';
    }
    field(10072; adids_AccountID; Text[100])
    {
      ExternalName = 'adids_accountid';
      ExternalType = 'String';
      Description = '';
      Caption = 'Account ID (Base)';
    }
    field(10073; adids_RelationshipStage; Option)
    {
      ExternalName = 'adids_relationshipstage';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Relationship Stage';
      InitValue = " ";
      OptionMembers = " ", "List-A1", "List-A2", "Active-A3", "Active-B1", "Active-B2", """Active-B2""1", "Active-C1", "Active-C2", "Active-C3", "N/A";
      OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005, 888880006, 888880007, 888880008, 888880009;
    }
    field(10075; adids_BpayNo; Text[100])
    {
      ExternalName = 'adids_bpayno';
      ExternalType = 'String';
      Description = '';
      Caption = 'Bpay No.';
    }
    field(10076; adids_BankName; Text[100])
    {
      ExternalName = 'adids_bankname';
      ExternalType = 'String';
      Description = '';
      Caption = 'Bank Name';
    }
    field(10077; adids_BankAccountNumber; Text[100])
    {
      ExternalName = 'adids_bankaccountnumber';
      ExternalType = 'String';
      Description = '';
      Caption = 'Bank Account Number';
    }
    field(10078; adids_AccountBalance; Decimal)
    {
      ExternalName = 'adids_accountbalance';
      ExternalType = 'Decimal';
      Description = '';
      Caption = 'Account Balance';
    }
    field(10079; adids_PayableLimit; Text[100])
    {
      ExternalName = 'adids_payablelimit';
      ExternalType = 'String';
      Description = '';
      Caption = 'Payable Limit';
    }
    field(10080; adids_PaymentBlock; Boolean)
    {
      ExternalName = 'adids_paymentblock';
      ExternalType = 'Boolean';
      Description = '';
      Caption = 'Payment Block';
    }
    field(10082; adids_FederalTaxID; Text[100])
    {
      ExternalName = 'adids_federaltaxid';
      ExternalType = 'String';
      Description = '';
      Caption = 'Federal Tax ID';
    }
    field(10083; adids_TassLevel; Option)
    {
      ExternalName = 'adids_tasslevel';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Service Agreement';
      InitValue = " ";
      OptionMembers = " ", Basic, Pro;
      OptionOrdinalValues = -1, 888880000, 888880001;
    }
    field(10085; adids_BankCountry; Text[100])
    {
      ExternalName = 'adids_bankcountry';
      ExternalType = 'String';
      Description = '';
      Caption = 'Bank Country';
    }
    field(10086; new_JobTitle; Text[100])
    {
      ExternalName = 'new_jobtitle';
      ExternalType = 'String';
      Description = '';
      Caption = 'Job Title';
    }
    field(10087; msdyn_PrimaryTimeZone; Integer)
    {
      ExternalName = 'msdyn_primarytimezone';
      ExternalType = 'Integer';
      Description = 'Indicates the primary time zone that the client works on.';
      Caption = 'Primary Time Zone';
    }
    field(10088; adids_ContractManager; GUID)
    {
      ExternalName = 'adids_contractmanager';
      ExternalType = 'Lookup';
      Description = '';
      Caption = 'Contract Manager';
      TableRelation = "CDS Account".AccountId;
    }
    field(10094; adids_ImportSerialNo; Text[100])
    {
      ExternalName = 'adids_importserialno';
      ExternalType = 'String';
      Description = '';
      Caption = 'Import Serial No';
    }
    field(10095; adids_CapexFrom; Date)
    {
      ExternalName = 'adids_capexfrom';
      ExternalType = 'DateTime';
      Description = '';
      Caption = 'Capex From';
    }
    field(10096; adids_CapexTo; Date)
    {
      ExternalName = 'adids_capexto';
      ExternalType = 'DateTime';
      Description = '';
      Caption = 'Capex To';
    }
    field(10101; msdyn_externalaccountid; Text[100])
    {
      ExternalName = 'msdyn_externalaccountid';
      ExternalType = 'String';
      Description = 'External Account ID from other systems.';
      Caption = 'External ID';
    }
    field(10102; bim_fromphonenumber; Text[100])
    {
      ExternalName = 'bim_fromphonenumber';
      ExternalType = 'String';
      Description = '';
      Caption = 'From Phone Number';
    }
    field(10103; bim_isarchived; Boolean)
    {
      ExternalName = 'bim_isarchived';
      ExternalType = 'Boolean';
      Description = '';
      Caption = 'Is Archived';
    }
    field(10105; bim_optout; Boolean)
    {
      ExternalName = 'bim_optout';
      ExternalType = 'Boolean';
      Description = '';
      Caption = 'OptOut Status';
    }
    field(10107; bim_selectedcountry; Text[100])
    {
      ExternalName = 'bim_selectedcountry';
      ExternalType = 'String';
      Description = '';
      Caption = 'Selected Country';
    }
    field(10108; adigkb_bcid; Text[100])
    {
      ExternalName = 'adigkb_bcid';
      ExternalType = 'String';
      Description = 'BC record Integration reference ID';
      Caption = 'bcid';
    }
  }
  keys
  {
    key(PK; AccountId)
    {
      Clustered = true;
    }
    key(Name; Name)
    {
    }
  }
  fieldgroups
  {
    fieldgroup(DropDown; Name)
    {
    }
  }
}