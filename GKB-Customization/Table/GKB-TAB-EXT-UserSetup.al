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
    }
}