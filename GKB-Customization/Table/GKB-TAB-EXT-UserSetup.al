tableextension 50139 "User Setup Extension" extends "User Setup"
{
    fields
    {
        field(50501; "Allow Edit Mode"; Boolean)
        {
            Caption = 'Allow Vendor Edit Mode';
            DataClassification = CustomerContent;
        }
        field(50102; "Allow Edit Vandor Bank"; Boolean)
        {
            Caption = 'Allow Vendor Bank Edit';
            DataClassification = CustomerContent;
        }
        field(50103; "Customer Card"; Boolean)
        {
            Caption = 'Customer Card Edit';
            DataClassification = ToBeClassified;
        }
        field(50104; "G\L Account"; Boolean)
        {
            Caption = 'G\L Account Edit';
            DataClassification = ToBeClassified;
        }
        field(50105; Location; Boolean)
        {
            Caption = 'Location Edit';
            DataClassification = ToBeClassified;
        }
        field(50106;"Sales Quote";Boolean)
        {
            Caption='Sales Quote';
            DataClassification=ToBeClassified;
        }
    }
}