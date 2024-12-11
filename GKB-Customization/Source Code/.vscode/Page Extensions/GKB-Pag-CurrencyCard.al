pageextension 50306 "Currencies Page Ext" extends Currencies
{
    layout
    {
        addafter(ExchangeRateAmt)
        {
            field("Custom Exchange Amount"; Rec."Custom Exchange Amount")
            {
                ApplicationArea = All;
                Caption = 'Custom Exchange Amount';
            }
            field("CRM ID"; Rec."CRM ID")
            {
                ApplicationArea = All;
                Caption = 'CRM ID';
            }
        }
    }
}