tableextension 50127 "Dimension Values CRM" extends "Dimension Value"
{
    fields
    {
        field(50101; "CRM ID"; Text[100])
        {
            Caption = 'CRM Id';
        }
    }
}
pageextension 50500 "DimensionValExt" extends "Dimension Values"
{
    layout
    {
        addafter(Name)
        {
            field("CRM ID"; Rec."CRM ID")
            {
                ApplicationArea = all;
            }
        }
    }
}