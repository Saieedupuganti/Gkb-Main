tableextension 50310 "Item Integration" extends Item
{
  fields
  {
    field(50301; "Unit"; Code[30])
    {
      DataClassification = ToBeClassified;
      TableRelation = "Unit of Measure".Code;
    }
    field(50509; "Vendor Id CRM"; Text[100])
    {
        DataClassification = ToBeClassified;
    }
  }
  
  keys
  {
    // Add changes to keys here
  }
  
  fieldgroups
  {
    // Add changes to field groups here
  }
  
  var
    myInt: Integer;
}