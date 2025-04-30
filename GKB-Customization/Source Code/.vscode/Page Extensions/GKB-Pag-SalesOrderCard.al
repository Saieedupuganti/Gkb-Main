pageextension 50341 "Sales Order Card Ext" extends "Sales Order"
{
    layout
    {
        modify("Work Description")
        {
            Visible = false;
        }
        addafter(General)
        {
            group("Dynamics")
            {
                Caption = 'Dynamics';

                field("CRM ID"; Rec."CRM ID")
                {
                    ApplicationArea = All;
                    Caption = 'CRM ID';
                }
                field("Owner"; Rec."Owner")
                {
                    ApplicationArea = All;
                    Caption = 'Owner';
                }
                field("Owner CRMID"; Rec."Owner CRMID")
                {
                    ApplicationArea = All;
                    Caption = 'Owner CRMID';
                }
                field("Dimension"; Rec."Dimension")
                {
                    ApplicationArea = All;
                    Caption = 'Dimension';
                }
                field("Dimension CRM ID"; Rec."Dimension CRM ID")
                {
                    ApplicationArea = All;
                    Caption = 'Dimension CRM ID';
                }
                field("Price List"; Rec."Price List")
                {
                    ApplicationArea = All;
                    Caption = 'Price List';
                }
                field("Quote"; Rec."Quote")
                {
                    ApplicationArea = All;
                    Caption = 'Quote';
                }
                field("Opportunity"; Rec."Opportunity")
                {
                    ApplicationArea = All;
                    Caption = 'Opportunity';
                }
                field("Freight Amount"; Rec."Freight Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Freight Amount';
                }
                field("Freight Terms"; Rec."Freight Terms")
                {
                    ApplicationArea = All;
                    Caption = 'Freight Terms';
                }
                field("Creation Method"; Rec."Creation Method")
                {
                    ApplicationArea = All;
                    Caption = 'Creation Method';
                }
                field("Customer PO Number"; Rec."Customer PO Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer PO Number';
                }
                field("GST Prod Posting Group"; Rec."GST Prod Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'GST Prod Posting Group';
                }

            }
        }
        addafter("Ship-to Address 2")
        {
            field("Ship-to Address 3"; Rec."Ship-to Address 3")
            {
                ApplicationArea = All;
                Caption = 'Ship-to Address 3';
            }
        }
        addbefore("Sell-to Address")
        {
            field("Address Name"; Rec."Bill-to address name")
            {
                ApplicationArea = All;
                Caption = 'Address Name';
            }
        }
        addafter("Currency Code")
        {
            field("Currency CRM ID"; Rec."Currency CRM ID")
            {
                ApplicationArea = All;
                Caption = 'Currency CRM ID';
            }
        }
        addafter("Sell-to Customer Name")
        {
            field("Customer CRMID"; Rec."Customer CRMID")
            {
                ApplicationArea = All;
                Caption = 'Customer CRMID';
            }
        }
        addafter(Status)
        {
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
                Caption = 'Description';
            }
        }
    }
}