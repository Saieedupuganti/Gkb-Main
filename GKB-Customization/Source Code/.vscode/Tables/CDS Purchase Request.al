table 50511 "CDS adigkb_PurchaseRequest"
{
  ExternalName = 'adigkb_purchaserequest';
  TableType = CDS;
  Description = 'This table contains records of purchase requests made by users.';

  fields
  {
    field(1; adigkb_PurchaseRequestId; GUID)
    {
      ExternalName = 'adigkb_purchaserequestid';
      ExternalType = 'Uniqueidentifier';
      ExternalAccess = Insert;
      Description = 'Unique identifier for entity instances';
      Caption = 'Purchase Request';
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
      Description = 'Status of the Purchase Request';
      Caption = 'Status';
      InitValue = " ";
      OptionMembers = " ", Active, Inactive;
      OptionOrdinalValues = -1, 0, 1;
    }
    field(27; statuscode; Option)
    {
      ExternalName = 'statuscode';
      ExternalType = 'Status';
      Description = 'Reason for the status of the Purchase Request';
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
    field(34; adigkb_Name; Text[400])
    {
      ExternalName = 'adigkb_name';
      ExternalType = 'String';
      Description = '';
      Caption = 'Name';
    }
    field(35; adigkb_Quantity; Decimal)
    {
      ExternalName = 'adigkb_quantity';
      ExternalType = 'Decimal';
      Description = '';
      Caption = 'Quantity';
    }
    field(36; adigkb_RequestDate; Date)
    {
      ExternalName = 'adigkb_requestdate';
      ExternalType = 'DateTime';
      Description = '';
      Caption = 'Request Date';
    }
    field(37; adigkb_Status; Option)
    {
      ExternalName = 'adigkb_status';
      ExternalType = 'Picklist';
      Description = '';
      Caption = 'Status';
      InitValue = Pending;
      OptionMembers = Pending, Approved, Rejected;
      OptionOrdinalValues = 777770000, 777770001, 777770002;
    }
    field(39; adigkb_Description; Text[100])
    {
      ExternalName = 'adigkb_description';
      ExternalType = 'String';
      Description = '';
      Caption = 'Description';
    }
    field(40; adigkb_ExistingProduct; GUID)
    {
      ExternalName = 'adigkb_existingproduct';
      ExternalType = 'Lookup';
      Description = '';
      Caption = 'Existing Product';
      TableRelation = "CDS Product".ProductId;
    }
    field(46; adigkb_ProductType; Boolean)
    {
      ExternalName = 'adigkb_producttype';
      ExternalType = 'Boolean';
      Description = '';
      Caption = 'Product Type';
    }
  }
  keys
  {
    key(PK; adigkb_PurchaseRequestId)
    {
      Clustered = true;
    }
    key(Name; adigkb_Name)
    {
    }
  }
  fieldgroups
  {
    fieldgroup(DropDown; adigkb_Name)
    {
    }
  }
}