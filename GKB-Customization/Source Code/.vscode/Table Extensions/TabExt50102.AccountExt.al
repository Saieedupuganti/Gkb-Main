tableextension 50102 AccountExt extends "CRM Account"
{
    Description = 'Business that represents a customer or potential customer. The company that is billed in business transactions.';

    fields
    {
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
            TableRelation = "CRM Account".AccountId;
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
            TableRelation = "CRM Account".AccountId;
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
        field(10039; msdyn_PreferredResource; GUID)
        {
            ExternalName = 'msdyn_preferredresource';
            ExternalType = 'Lookup';
            Description = '';
            Caption = 'Preferred Resource (Deprecated)';
           // TableRelation = "FS Bookable Resource".BookableResourceId;
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
            OptionMembers = Hourly,Mileage,Fixed,None;
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
            OptionMembers = " ",Agriculture,Beverages,Buildings,Chemical,Competition,Concrete,Consultants,Education,EngineerProcureConstruct,Food,GovernmentOrganisation,HealthCare,"Hotel&Casinos","Laundry&Clean",Manufacturing,"MaterialsConstruction&Packaging",MiningAndPreciousMetals,"N/A",OEMMachinery,"Oil&Gas",Other,Packaging,PetFood,"Pharma&Biotech",PowerGeneration,"Pulp&Paper",Recycling,"Rubber&Plastic",SIGAffiliations,ServiceProviders,ServiceRetail,SocialServices,SpecialOutboundTradeContractors,SpecialtyRealty,Textiles,TimberAndForestry,Transportation,UtilityCreationAndDistribution,VehicleRetail,WaterAndWaste,Wholesale;
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
            OptionMembers = " ",Platinum,Gold,Silver,Bronze,"N/A";
            OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004;
        }
        field(10060; adids_AccountManager; Option)
        {
            ExternalName = 'adids_accountmanager';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'Account Manager';
            InitValue = " ";
            OptionMembers = " ",AnthonySandorCsillag,AviAneja,BenjaminShamuel,BrendanOBrien,"DeniseLombardi-Carraro",FebinAnthony,JuanOgaz,MeerHassan,FebinAnthony1,JuanOgaz1,MeganDuniam,MichaelAland,MidhunJayakumar,MuhammadHassanMalik,NalgunalingamSatgunalingam,NikolinaMukevska,PhilipGiles,RavjotSingh,RoxanaCisternas,SabyBinjo,ShaneOBrien,SiljaTeles,TonyButler,VineetaGupta,YanXu,YuvrajKhanna,"N/A";
            OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005, 888880006, 888880007, 888880008, 888880009, 888880010, 888880011, 888880012, 888880013, 888880014, 888880015, 888880016, 888880017, 888880018, 888880019, 888880020, 888880021, 888880022, 888880023, 888880024, 888880025, 888880026;
        }
        field(10062; adids_SupplierAccountGroups; Option)
        {
            ExternalName = 'adids_supplieraccountgroups';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'Supplier Account Groups';
            InitValue = " ";
            OptionMembers = " ",Accounting,Amenities,BoilerAncillaries,BoilerManufacturer,BurnerManagement,Communication,Competition,Consultants,CreditCards,Electrical,Employees,Engineering,EquipmentRental,"Freight&Transport",GasComponents,"Inspection&Certification",IT,Legal,MotorVehicles,Plumbing,SafetyEquipment,Subcontractor,Tooling,Travel,Other,"N/A";
            OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005, 888880006, 888880007, 888880008, 888880009, 888880010, 888880011, 888880012, 888880013, 888880014, 888880015, 888880016, 888880017, 888880018, 888880019, 888880020, 888880021, 888880022, 888880023, 888880024, 888880025;
        }
        field(10064; adids_PAYMENTTERMS; Option)
        {
            ExternalName = 'adids_paymentterms';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'PAYMENT TERMS';
            InitValue = " ";
            OptionMembers = " ",ARCOD,AR7DaysINV,AR14DaysINV,AR28DaysEOM,AR30DaysEOM,AR30DaysINV,AR45DaysEOM,AR60DaysEOM,AR60DaysINV,AR90DaysEOM,AR90DaysINV,APCOD,AP7DaysINV,AP14DaysINV,AP30DaysEOM,AP30DaysINV,AP60DayEOM,AP60DaysINV;
            OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005, 888880006, 888880007, 888880008, 888880009, 888880010, 888880011, 888880012, 888880013, 888880014, 888880015, 888880016, 888880017;
        }
        field(10066; adids_PaymentMethod; Option)
        {
            ExternalName = 'adids_paymentmethod';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'Payment Method';
            InitValue = " ";
            OptionMembers = " ",Cheque,DirectDeposit,"NAB-Eftpos",CreditCard,Other,"N/A";
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
            OptionMembers = " ","List-A1","List-A2","Active-A3","Active-B1","Active-B2","""Active-B2""1","Active-C1","Active-C2","Active-C3","N/A";
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
            OptionMembers = " ",Basic,Pro;
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
            TableRelation = "CRM Account".AccountId;
        }
        field(10091; adids_AccountContractManager; GUID)
        {
            ExternalName = 'adids_accountcontractmanager';
            ExternalType = 'Lookup';
            Description = '';
            Caption = 'Account Contract Manager';
            TableRelation = "CRM Systemuser".SystemUserId;
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
}