table 50501 "CDS msdyn_workorder"
{
    ExternalName = 'msdyn_workorder';
    TableType = CDS;
    Description = 'Work orders store all information about the job performed for an account. Stores incident details, resource, expenses, tasks, communications, billing and more';

    fields
    {
        field(1; msdyn_workorderId; GUID)
        {
            ExternalName = 'msdyn_workorderid';
            ExternalType = 'Uniqueidentifier';
            ExternalAccess = Insert;
            Description = 'Shows the entity instances.';
            Caption = 'WO Number';
        }
        field(2; CreatedOn; Datetime)
        {
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Shows the date and time when the record was created. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
            Caption = 'Created On';
        }
        field(4; ModifiedOn; Datetime)
        {
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Shows the date and time when the record was last updated. The date and time are displayed in the time zone selected in Microsoft Dynamics 365 options.';
            Caption = 'Modified On';
        }
        field(25; statecode; Option)
        {
            ExternalName = 'statecode';
            ExternalType = 'State';
            ExternalAccess = Modify;
            Description = 'Status of the Work Order';
            Caption = 'Status';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 0, 1;
        }
        field(27; statuscode; Option)
        {
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            Description = 'Reason for the status of the Work Order';
            Caption = 'Status Reason';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 1, 2;
        }
        field(29; VersionNumber; BigInteger)
        {
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
            ExternalAccess = Read;
            Description = 'Version Number';
            Caption = 'Version Number';
        }
        field(30; ImportSequenceNumber; Integer)
        {
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
            ExternalAccess = Insert;
            Description = 'Shows the sequence number of the import that created this record.';
            Caption = 'Import Sequence Number';
        }
        field(31; OverriddenCreatedOn; Date)
        {
            ExternalName = 'overriddencreatedon';
            ExternalType = 'DateTime';
            ExternalAccess = Insert;
            Description = 'Shows the date and time that the record was migrated.';
            Caption = 'Record Created On';
        }
        field(32; TimeZoneRuleVersionNumber; Integer)
        {
            ExternalName = 'timezoneruleversionnumber';
            ExternalType = 'Integer';
            Description = 'For internal use only.';
            Caption = 'Time Zone Rule Version Number';
        }
        field(33; UTCConversionTimeZoneCode; Integer)
        {
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            Description = 'Shows the time zone code that was in use when the record was created.';
            Caption = 'UTC Conversion Time Zone Code';
        }
        field(34; msdyn_name; Text[100])
        {
            ExternalName = 'msdyn_name';
            ExternalType = 'String';
            Description = 'Enter the name of the custom entity.';
            Caption = 'Work Order Number';
        }
        field(35; processid; GUID)
        {
            ExternalName = 'processid';
            ExternalType = 'Uniqueidentifier';
            Description = 'Shows the ID of the process associated with the entity.';
            Caption = 'Process Id';
        }
        field(36; stageid; GUID)
        {
            ExternalName = 'stageid';
            ExternalType = 'Uniqueidentifier';
            Description = 'Shows the ID of the stage where the entity is located.';
            Caption = 'Stage Id';
        }
        field(37; traversedpath; Text[1250])
        {
            ExternalName = 'traversedpath';
            ExternalType = 'String';
            Description = 'Shows a comma-separated list of string values representing the unique identifiers of stages in a business process flow instance in the order that they occur.';
            Caption = 'Traversed Path';
        }
        field(38; msdyn_Address1; Text[250])
        {
            ExternalName = 'msdyn_address1';
            ExternalType = 'String';
            Caption = 'Street 1';
        }
        field(39; msdyn_Address2; Text[250])
        {
            ExternalName = 'msdyn_address2';
            ExternalType = 'String';
            Caption = 'Street 2';
        }
        field(40; msdyn_Address3; Text[250])
        {
            ExternalName = 'msdyn_address3';
            ExternalType = 'String';
            Caption = 'Street 3';
        }
        field(41; msdyn_AddressName; Text[250])
        {
            ExternalName = 'msdyn_addressname';
            ExternalType = 'String';
            Caption = 'Address Name';
        }
        field(43; msdyn_AutoNumbering; Text[100])
        {
            ExternalName = 'msdyn_autonumbering';
            ExternalType = 'String';
            Description = 'Internal field used to generate the next name upon entity creation. It is optionally copied to the msdyn_name field.';
            Caption = 'Auto-Numbering';
        }
        field(45; msdyn_BookingSummary; BLOB)
        {
            ExternalName = 'msdyn_bookingsummary';
            ExternalType = 'Memo';
            Description = 'This column is used internally, and also used to display the bookable resource bookings associated with a work order in the FieldService.WorkOrderList PCF component.';
            Caption = 'Booked Resources';
            Subtype = Memo;
        }
        field(46; msdyn_ChildIndex; Integer)
        {
            ExternalName = 'msdyn_childindex';
            ExternalType = 'Integer';
            Caption = 'Child Index';
        }
        field(47; msdyn_City; Text[80])
        {
            ExternalName = 'msdyn_city';
            ExternalType = 'String';
            Caption = 'City';
        }
        field(49; msdyn_Country; Text[80])
        {
            ExternalName = 'msdyn_country';
            ExternalType = 'String';
            Caption = 'Country/Region';
        }
        field(51; msdyn_DateWindowEnd; Date)
        {
            ExternalName = 'msdyn_datewindowend';
            ExternalType = 'DateTime';
            Caption = 'Date Window End';
        }
        field(52; msdyn_DateWindowStart; Date)
        {
            ExternalName = 'msdyn_datewindowstart';
            ExternalType = 'DateTime';
            Caption = 'Date Window Start';
        }
        field(53; msdyn_EstimateSubtotalAmount; Decimal)
        {
            ExternalName = 'msdyn_estimatesubtotalamount';
            ExternalType = 'Money';
            Description = 'Enter the summary of total estimated billing amount for this work order';
            Caption = 'Estimate Subtotal Amount';
        }
        field(56; ExchangeRate; Decimal)
        {
            ExternalName = 'exchangerate';
            ExternalType = 'Decimal';
            ExternalAccess = Read;
            Description = 'Shows the exchange rate for the currency associated with the entity with respect to the base currency.';
            Caption = 'Exchange Rate';
        }
        field(57; msdyn_estimatesubtotalamount_Base; Decimal)
        {
            ExternalName = 'msdyn_estimatesubtotalamount_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Shows the value of the estimate subtotal amount in the base currency.';
            Caption = 'Estimate Subtotal Amount (Base)';
        }
        field(58; msdyn_FollowUpNote; BLOB)
        {
            ExternalName = 'msdyn_followupnote';
            ExternalType = 'Memo';
            Description = 'Indicate the details of the follow up work';
            Caption = 'Follow Up Note (Deprecated)';
            Subtype = Memo;
        }
        field(59; msdyn_FollowUpRequired; Boolean)
        {
            ExternalName = 'msdyn_followuprequired';
            ExternalType = 'Boolean';
            Description = 'Allows indication if follow up work is required for a work order.';
            Caption = 'Follow Up Required (Deprecated)';
        }
        field(61; msdyn_Instructions; BLOB)
        {
            ExternalName = 'msdyn_instructions';
            ExternalType = 'Memo';
            Description = 'Shows instructions for booked resources. By default, this information is taken from the work order instructions field on the service account.';
            Caption = 'Instructions';
            Subtype = Memo;
        }
        field(62; msdyn_InternalFlags; BLOB)
        {
            ExternalName = 'msdyn_internalflags';
            ExternalType = 'Memo';
            Description = 'For internal use only.';
            Caption = 'Internal Flags';
            Subtype = Memo;
        }
        field(63; msdyn_IsFollowUp; Boolean)
        {
            ExternalName = 'msdyn_isfollowup';
            ExternalType = 'Boolean';
            Caption = 'Is FollowUp (Deprecated)';
        }
        field(65; msdyn_IsMobile; Boolean)
        {
            ExternalName = 'msdyn_ismobile';
            ExternalType = 'Boolean';
            Caption = 'Is Mobile';
        }
        field(67; msdyn_Latitude; Decimal)
        {
            ExternalName = 'msdyn_latitude';
            ExternalType = 'Double';
            Description = '';
            Caption = 'Latitude';
        }
        field(68; msdyn_Longitude; Decimal)
        {
            ExternalName = 'msdyn_longitude';
            ExternalType = 'Double';
            Description = '';
            Caption = 'Longitude';
        }
        field(69; msdyn_mapcontrol; Text[100])
        {
            ExternalName = 'msdyn_mapcontrol';
            ExternalType = 'String';
            ExternalAccess = Read;
            Description = '';
            Caption = 'This field should only be used to load the custom map control';
        }
        field(71; msdyn_ParentWorkOrder; GUID)
        {
            ExternalName = 'msdyn_parentworkorder';
            ExternalType = 'Lookup';
            Description = 'Unique identifier for Work Order associated with Work Order.';
            Caption = 'Parent Work Order';
            TableRelation = "CDS msdyn_workorder".msdyn_workorderId;
        }
        field(72; msdyn_PostalCode; Text[20])
        {
            ExternalName = 'msdyn_postalcode';
            ExternalType = 'String';
            Caption = 'Postal Code';
        }
        field(75; msdyn_PrimaryIncidentDescription; BLOB)
        {
            ExternalName = 'msdyn_primaryincidentdescription';
            ExternalType = 'Memo';
            Description = 'Incident description';
            Caption = 'Primary Incident Description';
            Subtype = Memo;
        }
        field(76; msdyn_PrimaryIncidentEstimatedDuration; Integer)
        {
            ExternalName = 'msdyn_primaryincidentestimatedduration';
            ExternalType = 'Integer';
            Description = 'Shows the time estimated to resolve this incident.';
            Caption = 'Primary Incident Estimated Duration';
        }
        field(83; msdyn_StateOrProvince; Text[50])
        {
            ExternalName = 'msdyn_stateorprovince';
            ExternalType = 'String';
            Caption = 'State Or Province';
        }
        field(85; msdyn_SubtotalAmount; Decimal)
        {
            ExternalName = 'msdyn_subtotalamount';
            ExternalType = 'Money';
            Description = 'Enter the summary of subtotal billing amount excluding tax for this work order.';
            Caption = 'Subtotal Amount';
        }
        field(86; msdyn_subtotalamount_Base; Decimal)
        {
            ExternalName = 'msdyn_subtotalamount_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Shows the value of the subtotal amount in the base currency.';
            Caption = 'Subtotal Amount (Base)';
        }
        field(88; msdyn_SystemStatus; Option)
        {
            ExternalName = 'msdyn_systemstatus';
            ExternalType = 'Picklist';
            Description = 'Tracks the current system status.';
            Caption = 'System Status';
            InitValue = " ";
            OptionMembers = " ",Unscheduled,Scheduled,InProgress,Completed,Invoiced,Canceled;
            OptionOrdinalValues = -1, 690970000, 690970001, 690970002, 690970003, 690970004, 690970005;
        }
        field(90; msdyn_Taxable; Boolean)
        {
            ExternalName = 'msdyn_taxable';
            ExternalType = 'Boolean';
            Description = 'Shows whether sales tax is to be charged for this work order.';
            Caption = 'Taxable';
        }
        field(93; msdyn_TimeClosed; Datetime)
        {
            ExternalName = 'msdyn_timeclosed';
            ExternalType = 'DateTime';
            Description = 'Enter the time this work order was last closed.';
            Caption = 'Closed On';
        }
        field(94; msdyn_TimeFromPromised; Datetime)
        {
            ExternalName = 'msdyn_timefrompromised';
            ExternalType = 'DateTime';
            Description = 'Enter the starting range of the time promised to the account that incidents will be resolved.';
            Caption = 'Time From Promised';
        }
        field(97; msdyn_TimeToPromised; Datetime)
        {
            ExternalName = 'msdyn_timetopromised';
            ExternalType = 'DateTime';
            Description = 'Enter the ending range of the time promised to the account that incidents will be resolved.';
            Caption = 'Time To Promised';
        }
        field(98; msdyn_TimeWindowEnd; Datetime)
        {
            ExternalName = 'msdyn_timewindowend';
            ExternalType = 'DateTime';
            Caption = 'Time Window End';
        }
        field(99; msdyn_TimeWindowStart; Datetime)
        {
            ExternalName = 'msdyn_timewindowstart';
            ExternalType = 'DateTime';
            Caption = 'Time Window Start';
        }
        field(100; msdyn_TotalAmount; Decimal)
        {
            ExternalName = 'msdyn_totalamount';
            ExternalType = 'Money';
            Description = 'Enter the summary of total billing amount for this work order.';
            Caption = 'Total Amount';
        }
        field(101; msdyn_totalamount_Base; Decimal)
        {
            ExternalName = 'msdyn_totalamount_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Shows the value of the total amount in the base currency.';
            Caption = 'Total Amount (Base)';
        }
        field(102; msdyn_TotalSalesTax; Decimal)
        {
            ExternalName = 'msdyn_totalsalestax';
            ExternalType = 'Money';
            Description = 'Enter the summary of total sales tax charged for this work order.';
            Caption = 'Total Sales Tax';
        }
        field(103; msdyn_totalsalestax_Base; Decimal)
        {
            ExternalName = 'msdyn_totalsalestax_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Shows the value of the total sales tax in the base currency.';
            Caption = 'Total Sales Tax (Base)';
        }
        field(105; msdyn_WorkLocation; Option)
        {
            ExternalName = 'msdyn_worklocation';
            ExternalType = 'Picklist';
            Caption = 'Work Location';
            InitValue = Onsite;
            OptionMembers = Onsite,Facility,LocationAgnostic;
            OptionOrdinalValues = 690970000, 690970001, 690970002;
        }
        field(109; msdyn_WorkOrderSummary; BLOB)
        {
            ExternalName = 'msdyn_workordersummary';
            ExternalType = 'Memo';
            Description = 'Type a summary description of the job.';
            Caption = 'Work Order Summary';
            Subtype = Memo;
        }
        field(128; msdyn_ParentWorkOrderName; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("CDS msdyn_workorder".msdyn_name where(msdyn_workorderId = field(msdyn_ParentWorkOrder)));
            ExternalName = 'msdyn_parentworkordername';
            ExternalType = 'String';
            ExternalAccess = Read;
        }
        field(138; msdyn_completedon; Datetime)
        {
            ExternalName = 'msdyn_completedon';
            ExternalType = 'DateTime';
            Description = 'When Bookings are used on a Work Order, this field is auto-populated based on the latest End Time from the related Bookings. Otherwise, this field is populated based on the change of System Status.';
            Caption = 'Completed On';
        }
        field(139; msdyn_CostNTEPercent; Integer)
        {
            ExternalName = 'msdyn_costntepercent';
            ExternalType = 'Integer';
            Description = 'Indicates the percentage proximity or overage of the work order cost based on applied Cost not-to-exceed (rounded up to the nearest whole number).';
            Caption = 'Cost not-to-exceed 1';
        }
        field(140; msdyn_firstarrivedon; Datetime)
        {
            ExternalName = 'msdyn_firstarrivedon';
            ExternalType = 'DateTime';
            Description = 'When Bookings are used on a Work Order, this field is auto-populated based on the earliest Actual Arrival Time from the related Bookings.';
            Caption = 'First Arrived On';
        }
        field(142; msdyn_nottoexceedcostamount; Decimal)
        {
            ExternalName = 'msdyn_nottoexceedcostamount';
            ExternalType = 'Money';
            Description = 'The value of not-to-exceed cost for the work order in base currency.';
            Caption = 'Cost not-to-exceed';
        }
        field(143; msdyn_nottoexceedcostamount_Base; Decimal)
        {
            ExternalName = 'msdyn_nottoexceedcostamount_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Cost not-to-exceed in base currency.';
            Caption = 'Cost not-to-exceed (Base)';
        }
        field(144; msdyn_nottoexceedpriceamount; Decimal)
        {
            ExternalName = 'msdyn_nottoexceedpriceamount';
            ExternalType = 'Money';
            Description = 'The value of not-to-exceed price for the work order in base currency.';
            Caption = 'Price not-to-exceed';
        }
        field(145; msdyn_nottoexceedpriceamount_Base; Decimal)
        {
            ExternalName = 'msdyn_nottoexceedpriceamount_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Price not-to-exceed in base currency.';
            Caption = 'Price not-to-exceed (Base)';
        }
        field(146; msdyn_phoneNumber; Text[250])
        {
            ExternalName = 'msdyn_phoneNumber';
            ExternalType = 'String';
            Caption = 'Customer Phone Number';
        }
        field(147; msdyn_PriceNTEPercent; Integer)
        {
            ExternalName = 'msdyn_pricentepercent';
            ExternalType = 'Integer';
            Description = 'Indicates the percentage proximity or overage of the work order price based on applied Price not-to-exceed (rounded up to the nearest whole number).';
            Caption = 'Price not-to-exceed 1';
        }
        field(149; msdyn_productsservicescost; Decimal)
        {
            ExternalName = 'msdyn_productsservicescost';
            ExternalType = 'Money';
            Description = 'The total actual cost of the products and services';
            Caption = 'Total Cost';
        }
        field(150; msdyn_productsservicescost_Base; Decimal)
        {
            ExternalName = 'msdyn_productsservicescost_base';
            ExternalType = 'Money';
            Description = 'Value of the Total Cost in base currency.';
            Caption = 'Total Cost (Base)';
        }
        field(151; msdyn_productsservicesestimatedcost; Decimal)
        {
            ExternalName = 'msdyn_productsservicesestimatedcost';
            ExternalType = 'Money';
            Description = 'The total estimated cost of the products and services';
            Caption = 'Total Estimated Cost';
        }
        field(152; msdyn_productsservicesestimatedcost_Base; Decimal)
        {
            ExternalName = 'msdyn_productsservicesestimatedcost_base';
            ExternalType = 'Money';
            Description = 'Value of the Total Estimated Cost in base currency.';
            Caption = 'Total Estimated Cost (Base)';
        }
        field(153; msdyn_totalestimatedaftertaxprice; Decimal)
        {
            ExternalName = 'msdyn_totalestimatedaftertaxprice';
            ExternalType = 'Money';
            Description = 'The estimated price after adding tax to the subtotal';
            Caption = 'Total Estimated After Tax Price';
        }
        field(154; msdyn_totalestimatedaftertaxprice_Base; Decimal)
        {
            ExternalName = 'msdyn_totalestimatedaftertaxprice_base';
            ExternalType = 'Money';
            Description = 'Value of the Total Estimated After Tax Price in base currency.';
            Caption = 'Total Estimated After Tax Price (Base)';
        }
        field(155; msdyn_totalestimatedduration; Integer)
        {
            ExternalName = 'msdyn_totalestimatedduration';
            ExternalType = 'Integer';
            Description = 'Calculated from the estimated duration of Work Order Incidents and Work Order Service Tasks not related to a Work Order Incident on the Work Order. Intended to be read-only.';
            Caption = 'Total Estimated Duration';
        }
        field(165; adids_ProjectManager; Option)
        {
            ExternalName = 'adids_projectmanager';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'Project Manager';
            InitValue = " ";
            OptionMembers = " ",AnthonySandorCsillag,AviAneja,BenjaminShamuel,BrendanOBrien,"DeniseLombardi-Carraro",FebinAnthony,JuanOgaz,MeerHassan,FebinAnthony1,JuanOgaz1,MeganDuniam,MichaelAland,MidhunJayakumar,MuhammadHassanMalik,NalgunalingamSatgunalingam,NikolinaMukevska,PhilipGiles,RavjotSingh,RoxanaCisternas,SabyBinjo,ShaneOBrien,SiljaTeles,TonyButler,VineetaGupta,YanXu,YuvrajKhanna,"N/A";
            OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004, 888880005, 888880006, 888880007, 888880008, 888880009, 888880010, 888880011, 888880012, 888880013, 888880014, 888880015, 888880016, 888880017, 888880018, 888880019, 888880020, 888880021, 888880022, 888880023, 888880024, 888880025, 888880026;
        }
        field(167; adids_CustomerPONumber; Text[100])
        {
            ExternalName = 'adids_customerponumber';
            ExternalType = 'String';
            Description = '';
            Caption = 'Customer PO Number';
        }
        field(171; adids_ServiceCallID; Integer)
        {
            ExternalName = 'adids_servicecallid';
            ExternalType = 'Integer';
            Description = 'Service Call ID';
            Caption = 'Service Call ID';
        }
        field(172; adids_AccountNumber; Text[100])
        {
            ExternalName = 'adids_accountnumber';
            ExternalType = 'String';
            Description = 'Account Number';
            Caption = 'Account Number';
        }
        field(173; adids_BillingType; Option)
        {
            ExternalName = 'adids_billingtype';
            ExternalType = 'Picklist';
            Description = 'Billing Type';
            Caption = 'Billing Type';
            InitValue = " ";
            OptionMembers = " ",ChargeUp,Quoted,MonthlyBilling,NotChargeable,"N/A";
            OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003, 888880004;
        }
        field(176; adids_SAPOpenPOCost; Decimal)
        {
            ExternalName = 'adids_sapopenpocost';
            ExternalType = 'Money';
            Description = 'SAP-Open PO Cost';
            Caption = 'SAP-Open PO Cost';
        }
        field(177; adids_sapopenpocost_Base; Decimal)
        {
            ExternalName = 'adids_sapopenpocost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the SAP-Open PO Cost in base currency.';
            Caption = 'SAP-Open PO Cost (Base)';
        }
        field(178; adids_SAPAPCost; Decimal)
        {
            ExternalName = 'adids_sapapcost';
            ExternalType = 'Money';
            Description = 'SAP-AP Cost';
            Caption = 'SAP-AP Cost';
        }
        field(179; adids_sapapcost_Base; Decimal)
        {
            ExternalName = 'adids_sapapcost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the SAP-AP Cost in base currency.';
            Caption = 'SAP-AP Cost (Base)';
        }
        field(180; adids_SAPBudgetRevenue; Decimal)
        {
            ExternalName = 'adids_sapbudgetrevenue';
            ExternalType = 'Money';
            Description = 'SAP - Budget Revenue';
            Caption = 'SAP - Budget Revenue';
        }
        field(181; adids_sapbudgetrevenue_Base; Decimal)
        {
            ExternalName = 'adids_sapbudgetrevenue_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the SAP - Budget Revenue in base currency.';
            Caption = 'SAP - Budget Revenue (Base)';
        }
        field(182; adids_SAPBudgetGP; Decimal)
        {
            ExternalName = 'adids_sapbudgetgp';
            ExternalType = 'Money';
            Description = 'SAP - Budget GP';
            Caption = 'SAP - Budget GP';
        }
        field(183; adids_sapbudgetgp_Base; Decimal)
        {
            ExternalName = 'adids_sapbudgetgp_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the SAP - Budget GP in base currency.';
            Caption = 'SAP - Budget GP (Base)';
        }
        field(184; adids_SAPBudgetCost; Decimal)
        {
            ExternalName = 'adids_sapbudgetcost';
            ExternalType = 'Money';
            Description = 'SAP - Budget Cost';
            Caption = 'SAP - Budget Cost';
        }
        field(185; adids_sapbudgetcost_Base; Decimal)
        {
            ExternalName = 'adids_sapbudgetcost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the SAP - Budget Cost in base currency.';
            Caption = 'SAP - Budget Cost (Base)';
        }
        field(186; adids_SAPARInvoice; Decimal)
        {
            ExternalName = 'adids_saparinvoice';
            ExternalType = 'Money';
            Description = 'SAP - AR Invoice ';
            Caption = 'SAP - AR Invoice ';
        }
        field(187; adids_saparinvoice_Base; Decimal)
        {
            ExternalName = 'adids_saparinvoice_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the SAP - AR Invoice  in base currency.';
            Caption = 'SAP - AR Invoice  (Base)';
        }
        field(188; adids_SAPLabourCost; Decimal)
        {
            ExternalName = 'adids_saplabourcost';
            ExternalType = 'Money';
            Description = 'SAP - Labour Cost';
            Caption = 'SAP - Labour Cost';
        }
        field(189; adids_saplabourcost_Base; Decimal)
        {
            ExternalName = 'adids_saplabourcost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the SAP - Labour Cost in base currency.';
            Caption = 'SAP - Labour Cost (Base)';
        }
        field(190; adids_SAPActualCommittedCosttodate; Decimal)
        {
            ExternalName = 'adids_sapactualcommittedcosttodate';
            ExternalType = 'Money';
            Description = 'SAP - Actual & Committed Cost to date ';
            Caption = 'SAP - Actual & Committed Cost to date ';
        }
        field(191; adids_sapactualcommittedcosttodate_Base; Decimal)
        {
            ExternalName = 'adids_sapactualcommittedcosttodate_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the SAP - Actual & Committed Cost to date  in base currency.';
            Caption = 'SAP - Actual & Committed Cost to date  (Base)';
        }
        field(192; adids_SAPRunningPL; Decimal)
        {
            ExternalName = 'adids_saprunningpl';
            ExternalType = 'Money';
            Description = ' SAP -  Running P&L ';
            Caption = ' SAP -  Running P&L ';
        }
        field(193; adids_saprunningpl_Base; Decimal)
        {
            ExternalName = 'adids_saprunningpl_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the  SAP -  Running P&L  in base currency.';
            Caption = ' SAP -  Running P&L  (Base)';
        }
        field(194; adids_QuotedChargeUp; Option)
        {
            ExternalName = 'adids_quotedchargeup';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'Quoted / Charge Up';
            InitValue = " ";
            OptionMembers = " ",ChargeUp,MonthlyBilling,NotChargeable,Quoted;
            OptionOrdinalValues = -1, 888880000, 888880001, 888880002, 888880003;
        }
        field(197; adids_WorkDescription; BLOB)
        {
            ExternalName = 'adids_workdescription';
            ExternalType = 'Memo';
            Description = '';
            Caption = 'Work Description';
            Subtype = Memo;
        }
        field(198; adids_Topic; Text[2048])
        {
            ExternalName = 'adids_topic';
            ExternalType = 'String';
            Description = '';
            Caption = 'Topic';
        }
        field(199; msdyn_DisplayAddress; Text[2048])
        {
            ExternalName = 'msdyn_displayaddress';
            ExternalType = 'String';
            ExternalAccess = Read;
            Description = 'Combined address field suitable for display';
            Caption = 'Display Address';
        }
        field(200; adids_AllocatedHours; Integer)
        {
            ExternalName = 'adids_allocatedhours';
            ExternalType = 'Integer';
            Description = 'Customer Buy Hours';
            Caption = 'Allocated Hours';
        }
        field(201; adids_BussinessPartnerAccountID; Text[100])
        {
            ExternalName = 'adids_bussinesspartneraccountid';
            ExternalType = 'String';
            Description = '';
            Caption = 'Bussiness Partner Account ID';
        }
        field(203; adids_CustomerAppoval; Option)
        {
            ExternalName = 'adids_customerappoval';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'Customer Appoval';
            InitValue = " ";
            OptionMembers = " ",Approved,Rejected;
            OptionOrdinalValues = -1, 888880000, 888880001;
        }
        field(205; adids_DateofEmail1; Date)
        {
            ExternalName = 'adids_dateofemail1';
            ExternalType = 'DateTime';
            Description = '';
            Caption = 'Date of Email 1';
        }
        field(206; adids_DateofEmail2; Date)
        {
            ExternalName = 'adids_dateofemail2';
            ExternalType = 'DateTime';
            Description = '';
            Caption = 'Date of Email 2';
        }
        field(207; adids_DateofEmail3; Date)
        {
            ExternalName = 'adids_dateofemail3';
            ExternalType = 'DateTime';
            Description = '';
            Caption = 'Date of Email 3';
        }
        field(208; adids_DateofEmail4; Date)
        {
            ExternalName = 'adids_dateofemail4';
            ExternalType = 'DateTime';
            Description = '';
            Caption = 'Date of Email 4';
        }
        field(209; adids_EffortCost; Decimal)
        {
            ExternalName = 'adids_effortcost';
            ExternalType = 'Money';
            Description = '';
            Caption = 'Effort Cost';
        }
        field(210; adids_effortcost_Base; Decimal)
        {
            ExternalName = 'adids_effortcost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Effort Cost in base currency.';
            Caption = 'Effort Cost (Base)';
        }
        field(211; adids_EffortHours; Integer)
        {
            ExternalName = 'adids_efforthours';
            ExternalType = 'Integer';
            Description = '';
            Caption = 'Effort Hours';
        }
        field(212; adids_Email1; Boolean)
        {
            ExternalName = 'adids_email1';
            ExternalType = 'Boolean';
            Description = '';
            Caption = 'Email 1';
        }
        field(214; adids_Email2; Boolean)
        {
            ExternalName = 'adids_email2';
            ExternalType = 'Boolean';
            Description = '';
            Caption = 'Email 2';
        }
        field(216; adids_Email3; Boolean)
        {
            ExternalName = 'adids_email3';
            ExternalType = 'Boolean';
            Description = '';
            Caption = 'Email 3';
        }
        field(218; adids_Email4; Boolean)
        {
            ExternalName = 'adids_email4';
            ExternalType = 'Boolean';
            Description = '';
            Caption = 'Email 4';
        }
        field(220; adids_ImportSerialNo; Text[100])
        {
            ExternalName = 'adids_importserialno';
            ExternalType = 'String';
            Description = '';
            Caption = 'Import Serial No';
        }
        field(221; adids_RevenueToDateActualCommittedCost; Decimal)
        {
            ExternalName = 'adids_revenuetodateactualcommittedcost';
            ExternalType = 'Money';
            Description = '';
            Caption = 'Revenue To Date - Actual & Committed Cost';
        }
        field(222; adids_revenuetodateactualcommittedcost_Base; Decimal)
        {
            ExternalName = 'adids_revenuetodateactualcommittedcost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Revenue To Date - Actual & Committed Cost in base currency.';
            Caption = 'Revenue To Date - Actual & Committed Cost (Base)';
        }
        field(223; adids_TotalMatCost; Decimal)
        {
            ExternalName = 'adids_totalmatcost';
            ExternalType = 'Money';
            Description = '';
            Caption = 'Total Mat Cost';
        }
        field(224; adids_totalmatcost_Base; Decimal)
        {
            ExternalName = 'adids_totalmatcost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Total Mat Cost in base currency.';
            Caption = 'Total Mat Cost (Base)';
        }
        field(229; adids_SAPServiceCallID; Text[100])
        {
            ExternalName = 'adids_sapservicecallid';
            ExternalType = 'String';
            Description = '';
            Caption = 'SAP - Service Call ID';
        }
        field(230; adids_OpenPoCost; Decimal)
        {
            ExternalName = 'adids_openpocost';
            ExternalType = 'Money';
            Description = '';
            Caption = 'Open Po Cost';
        }
        field(231; adids_openpocost_Base; Decimal)
        {
            ExternalName = 'adids_openpocost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Open Po Cost in base currency.';
            Caption = 'Open Po Cost (Base)';
        }
        field(234; adids_POBillCost; Decimal)
        {
            ExternalName = 'adids_pobillcost';
            ExternalType = 'Money';
            Description = '';
            Caption = 'PO Bill Cost';
        }
        field(235; adids_pobillcost_Base; Decimal)
        {
            ExternalName = 'adids_pobillcost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the PO Bill Cost in base currency.';
            Caption = 'PO Bill Cost (Base)';
        }
        field(236; adids_OpenPO; Boolean)
        {
            ExternalName = 'adids_openpo';
            ExternalType = 'Boolean';
            Description = '';
            Caption = 'Open PO';
        }
        field(238; adids_ProposedSolution; BLOB)
        {
            ExternalName = 'adids_proposedsolution';
            ExternalType = 'Memo';
            Description = '';
            Caption = 'Proposed Solution';
            Subtype = Memo;
        }
        field(239; adids_WorkOrderDuration; Integer)
        {
            ExternalName = 'adids_workorderduration';
            ExternalType = 'Integer';
            Description = '';
            Caption = 'Work Order Duration';
        }
        field(240; adids_BudgetRevenue; Decimal)
        {
            ExternalName = 'adids_budgetrevenue';
            ExternalType = 'Money';
            Description = '';
            Caption = 'Budget Revenue';
        }
        field(241; adids_budgetrevenue_Base; Decimal)
        {
            ExternalName = 'adids_budgetrevenue_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Budget Revenue in base currency.';
            Caption = 'Budget Revenue (Base)';
        }
        field(242; adids_BudgetCost; Decimal)
        {
            ExternalName = 'adids_budgetcost';
            ExternalType = 'Money';
            Description = '';
            Caption = 'Budget Cost';
        }
        field(243; adids_budgetcost_Base; Decimal)
        {
            ExternalName = 'adids_budgetcost_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Budget Cost in base currency.';
            Caption = 'Budget Cost (Base)';
        }
        field(244; adids_BudgetGP; Decimal)
        {
            ExternalName = 'adids_budgetgp';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = '';
            Caption = 'Budget GP';
        }
        field(245; adids_budgetgp_Base; Decimal)
        {
            ExternalName = 'adids_budgetgp_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Budget GP in base currency.';
            Caption = 'Budget GP (Base)';
        }
        field(250; adids_FixType; Option)
        {
            ExternalName = 'adids_fixtype';
            ExternalType = 'Picklist';
            Description = 'Mention weather the Booking is Completed on time';
            Caption = 'Fix Type';
            InitValue = " ";
            OptionMembers = " ",FirstTimeFix,FirstTimeFixWithMultipleBookings,NotAFirstTimeFix;
            OptionOrdinalValues = -1, 888880000, 888880001, 888880002;
        }
        field(254; adigkb_bcid; Text[100])
        {
            ExternalName = 'adigkb_bcid';
            ExternalType = 'String';
            Description = '';
            Caption = 'bcid';
        }
        field(50031; "Service Account Name"; text[160])
        {
            Description = 'Account to be serviced';
            Caption = 'Service Account Name';
            TableRelation = "CRM Account".Name;
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; msdyn_workorderId)
        {
            Clustered = true;
        }
        key(Name; msdyn_name)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; msdyn_name)
        {
        }
    }
}