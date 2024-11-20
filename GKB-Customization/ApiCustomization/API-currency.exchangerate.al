tableextension 50361 "Exchange Rates Ext" extends "Currency Exchange Rate"
{
  fields
  {
    field(50101;"CRM ID";Text[100])
    {
      Caption='CRM ID';
    }
  }
}

pageextension 50362 "Exchange Rates List" extends "Currency Exchange Rates"
{
  layout
  {
    addlast(Control1)
    {
      field("CRM ID";Rec."CRM ID")
      {
        Caption='CRM ID';
        ApplicationArea=All;
      }
    }
  }
}

page 50363 "API Currency Exchange"
{
    PageType = API;
    Caption = 'API Currency Exchange';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'currencyexchange';
    EntitySetName = 'currencyexchange';
    SourceTable = "Currency Exchange Rate";
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(code; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field(startingdate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }
                field(exchangeRateAmount; Rec."Exchange Rate Amount")
                {
                    Caption = 'Exchange Rate Amount';
                }
                field(relationalCurrencyCode; Rec."Relational Currency Code")
                {
                    Caption = 'Relational Currency Code';
                }
                field(relationalExchangeRateAmount; Rec."Relational Exch. Rate Amount")
                {
                    Caption = 'Relational Exch. Rate Amount';
                }
            }
        }
    }
}
