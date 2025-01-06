table 50113 "CDS msdyn_FunctionalLocation"
{
  ExternalName = 'msdyn_functionallocation';
  TableType = CRM;
  Description = '';

  fields
  {
    field(1; msdyn_FunctionalLocationId; GUID)
    {
      ExternalName = 'msdyn_functionallocationid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Insert;
      Description = 'Unique identifier for entity instances';
      Caption = 'Functional Location';
    }
    field(2; CreatedOn; Datetime)
    {
      ExternalName = 'createdon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the record was created.';
      Caption = 'Created On';
    }
    field(3; CreatedBy; GUID)
    {
      ExternalName = 'createdby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the user who created the record.';
      Caption = 'Created By';
      TableRelation = "CRM Systemuser".SystemUserId;
    }
    field(4; ModifiedOn; Datetime)
    {
      ExternalName = 'modifiedon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the record was modified.';
      Caption = 'Modified On';
    }
    field(5; ModifiedBy; GUID)
    {
      ExternalName = 'modifiedby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the user who modified the record.';
      Caption = 'Modified By';
      TableRelation = "CRM Systemuser".SystemUserId;
    }
    field(6; CreatedOnBehalfBy; GUID)
    {
      ExternalName = 'createdonbehalfby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the delegate user who created the record.';
      Caption = 'Created By (Delegate)';
      TableRelation = "CRM Systemuser".SystemUserId;
    }
    field(7; ModifiedOnBehalfBy; GUID)
    {
      ExternalName = 'modifiedonbehalfby';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier of the delegate user who modified the record.';
      Caption = 'Modified By (Delegate)';
      TableRelation = "CRM Systemuser".SystemUserId;
    }
    field(16; OwnerId; GUID)
    {
      ExternalName = 'ownerid';
      ExternalType = 'Owner';
      Description = 'Owner Id';
      Caption = 'Owner';
    }
    field(21; OwningBusinessUnit; GUID)
    {
      ExternalName = 'owningbusinessunit';
      ExternalType = 'Lookup';
      Description = 'Unique identifier for the business unit that owns the record';
      Caption = 'Owning Business Unit';
      TableRelation = "CRM Businessunit".BusinessUnitId;
    }
    field(22; OwningUser; GUID)
    {
      ExternalName = 'owninguser';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier for the user that owns the record.';
      Caption = 'Owning User';
      TableRelation = "CRM Systemuser".SystemUserId;
    }
    field(23; OwningTeam; GUID)
    {
      ExternalName = 'owningteam';
      ExternalType = 'Lookup';
      ExternalAccess = Read;
      Description = 'Unique identifier for the team that owns the record.';
      Caption = 'Owning Team';
      TableRelation = "CRM Team".TeamId;
    }
    field(25; statecode; Option)
    {
      ExternalName = 'statecode';
      ExternalType = 'State';
      ExternalAccess = Modify;
      Description = 'Status of the Functional Location';
      Caption = 'Status';
      InitValue = " ";
      OptionMembers = " ", Active, Inactive;
      OptionOrdinalValues = -1, 0, 1;
    }
    field(27; statuscode; Option)
    {
      ExternalName = 'statuscode';
      ExternalType = 'Status';
      Description = 'Reason for the status of the Functional Location';
      Caption = 'Status Reason';
      InitValue = " ";
      OptionMembers = " ", Active, Inactive;
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
      Description = 'Sequence number of the import that created this record.';
      Caption = 'Import Sequence Number';
    }
    field(31; OverriddenCreatedOn; Date)
    {
      ExternalName = 'overriddencreatedon';
      ExternalType = 'DateTime';
      ExternalAccess = Insert;
      Description = 'Date and time that the record was migrated.';
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
      Description = 'Time zone code that was in use when the record was created.';
      Caption = 'UTC Conversion Time Zone Code';
    }
    field(34; msdyn_Name; Text[81])
    {
      ExternalName = 'msdyn_name';
      ExternalType = 'String';
      Description = 'Required name field';
      Caption = 'Name';
    }
    field(35; msdyn_ParentFunctionalLocation; GUID)
    {
      ExternalName = 'msdyn_parentfunctionallocation';
      ExternalType = 'Lookup';
      Description = '';
      Caption = 'Parent Functional Location';
      TableRelation = "CDS msdyn_FunctionalLocation".msdyn_FunctionalLocationId;
    }
    field(36; msdyn_Sequence; Integer)
    {
      ExternalName = 'msdyn_sequence';
      ExternalType = 'Integer';
      Description = 'Relative order of functional location entity node in hierarchy control';
      Caption = 'Sequence';
    }
    field(37; msdyn_ParentFunctionalLocationName; Text[81])
    {
      FieldClass = FlowField;
      CalcFormula = lookup("CDS msdyn_FunctionalLocation".msdyn_Name where(msdyn_FunctionalLocationId=field(msdyn_ParentFunctionalLocation)));
      ExternalName = 'msdyn_parentfunctionallocationname';
      ExternalType = 'String';
      ExternalAccess = Read;
    }
    field(38; msdyn_Address1; Text[250])
    {
      ExternalName = 'msdyn_address1';
      ExternalType = 'String';
      Description = '';
      Caption = 'Street 1';
    }
    field(39; msdyn_Address2; Text[250])
    {
      ExternalName = 'msdyn_address2';
      ExternalType = 'String';
      Description = 'Street 2';
      Caption = 'Street 2';
    }
    field(40; msdyn_Address3; Text[250])
    {
      ExternalName = 'msdyn_address3';
      ExternalType = 'String';
      Description = 'Street 3';
      Caption = 'Street 3';
    }
    field(41; msdyn_AddressName; Text[250])
    {
      ExternalName = 'msdyn_addressname';
      ExternalType = 'String';
      Description = 'Address Name';
      Caption = 'Address Name';
    }
    field(42; msdyn_City; Text[80])
    {
      ExternalName = 'msdyn_city';
      ExternalType = 'String';
      Description = 'City';
      Caption = 'City';
    }
    field(43; msdyn_Country; Text[80])
    {
      ExternalName = 'msdyn_country';
      ExternalType = 'String';
      Description = 'Country/Region';
      Caption = 'Country/Region';
    }
    field(44; msdyn_Latitude; Decimal)
    {
      ExternalName = 'msdyn_latitude';
      ExternalType = 'Double';
      Description = 'Latitude';
      Caption = 'Latitude';
    }
    field(45; msdyn_Longitude; Decimal)
    {
      ExternalName = 'msdyn_longitude';
      ExternalType = 'Double';
      Description = 'Longitude';
      Caption = 'Longitude';
    }
    field(46; msdyn_PostalCode; Text[20])
    {
      ExternalName = 'msdyn_postalcode';
      ExternalType = 'String';
      Description = 'Postal Code';
      Caption = 'Postal Code';
    }
    field(47; msdyn_StateOrProvince; Text[50])
    {
      ExternalName = 'msdyn_stateorprovince';
      ExternalType = 'String';
      Description = 'State Or Province';
      Caption = 'State Or Province';
    }
    field(48; msdyn_CostCenter; Text[100])
    {
      ExternalName = 'msdyn_costcenter';
      ExternalType = 'String';
      Description = '';
      Caption = 'Cost Center';
    }
    field(49; msdyn_EmailAddress; Text[100])
    {
      ExternalName = 'msdyn_emailaddress';
      ExternalType = 'String';
      Description = '';
      Caption = 'Email Address';
    }
    field(50; msdyn_LocationOpenDate; Date)
    {
      ExternalName = 'msdyn_locationopendate';
      ExternalType = 'DateTime';
      Description = '';
      Caption = 'Location Open Date';
    }
    field(52; msdyn_PrimaryTimeZone; Integer)
    {
      ExternalName = 'msdyn_primarytimezone';
      ExternalType = 'Integer';
      Description = '';
      Caption = 'Primary Time Zone';
    }
    field(53; msdyn_ShortName; Text[100])
    {
      ExternalName = 'msdyn_shortname';
      ExternalType = 'String';
      Description = '';
      Caption = 'Short Name';
    }
    field(55; adids_SiteID; Text[100])
    {
      ExternalName = 'adids_siteid';
      ExternalType = 'String';
      Description = 'Auto Numbering of Functional Location';
      Caption = 'Site ID';
    }
    field(56; adids_ImportSerialNo; Text[100])
    {
      ExternalName = 'adids_importserialno';
      ExternalType = 'String';
      Description = '';
      Caption = 'Import Serial No';
    }
  }
  keys
  {
    key(PK; msdyn_FunctionalLocationId)
    {
      Clustered = true;
    }
    key(Name; msdyn_Name)
    {
    }
  }
  fieldgroups
  {
    fieldgroup(DropDown; msdyn_Name)
    {
    }
  }
}