pageextension 50345 "Territory List Ext" extends Territories
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