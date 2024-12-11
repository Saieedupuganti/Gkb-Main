table 50112 "CDS adigkb_LabBook"
{
  ExternalName = 'adigkb_labbook';
  TableType = CDS;
  Description = '';

  fields
  {
    field(1; adigkb_LabBookId; GUID)
    {
      ExternalName = 'adigkb_labbookid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Insert;
      Description = 'Unique identifier for entity instances';
      Caption = 'Lab Book';
    }
    field(2; CreatedOn; Datetime)
    {
      ExternalName = 'createdon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the record was created.';
      Caption = 'Created On';
    }
    field(4; ModifiedOn; Datetime)
    {
      ExternalName = 'modifiedon';
      ExternalType = 'DateTime';
      ExternalAccess = Read;
      Description = 'Date and time when the record was modified.';
      Caption = 'Modified On';
    }
    field(25; statecode; Option)
    {
      ExternalName = 'statecode';
      ExternalType = 'State';
      ExternalAccess = Modify;
      Description = 'Status of the Lab Book';
      Caption = 'Status';
      InitValue = " ";
      OptionMembers = " ", Active, Inactive;
      OptionOrdinalValues = -1, 0, 1;
    }
    field(27; statuscode; Option)
    {
      ExternalName = 'statuscode';
      ExternalType = 'Status';
      Description = 'Reason for the status of the Lab Book';
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
    field(34; adigkb_No; Text[850])
    {
      ExternalName = 'adigkb_no';
      ExternalType = 'String';
      Description = '';
      Caption = 'No.';
    }
    field(35; adigkb_Author; Text[100])
    {
      ExternalName = 'adigkb_author';
      ExternalType = 'String';
      Description = '';
      Caption = 'Author';
    }
    field(36; adigkb_Hardcover; Boolean)
    {
      ExternalName = 'adigkb_hardcover';
      ExternalType = 'Boolean';
      Description = '';
      Caption = 'Hardcover';
    }
    field(38; adigkb_PageCount; Integer)
    {
      ExternalName = 'adigkb_pagecount';
      ExternalType = 'Integer';
      Description = '';
      Caption = 'Page Count';
    }
    field(39; adigkb_Title; Text[100])
    {
      ExternalName = 'adigkb_title';
      ExternalType = 'String';
      Description = '';
      Caption = 'Title';
    }
  }
  keys
  {
    key(PK; adigkb_LabBookId)
    {
      Clustered = true;
    }
    key(Name; adigkb_No)
    {
    }
  }
  fieldgroups
  {
    fieldgroup(DropDown; adigkb_No)
    {
    }
  }
}