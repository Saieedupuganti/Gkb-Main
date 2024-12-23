pageextension 50122 "GKB Contacts" extends "Contact Card"
{
    layout
    {

        addafter(General)
        {
            group("D365 CUSTOM FIELDS")
            {
                field("D365 Contact ID"; Rec."D365 Contact ID")
                {
                    ApplicationArea = All;
                    Caption = 'D365 Contact ID';
                }
                field("E-Mail Group Code"; Rec."E-Mail Group Code")
                {
                    ApplicationArea = All;
                    Caption = 'E-Mail Group Code';
                }
            }
        }
        addbefore(Address)
        {
            field("Adress Name"; Rec."Adress Name")
            {
                Caption = 'Address Name';
                ApplicationArea = all;
            }
        }

        addafter("Address 2")
        {
            field("Address 3"; Rec."Address 3")
            {
                ApplicationArea = all;
            }


        }
        addafter("D365 Contact ID")
        {
            field("Description"; Rec.Description)
            {
                Caption = 'Description';
                ApplicationArea = All;
            }
            field("CRM Id"; Rec."CRM ID")
            {
                Caption = 'CRM Id';
                ApplicationArea = All;
            }
            field("D365 State"; Rec."D365 State")
            {
                ApplicationArea = All;
                Caption = 'State';
            }

            field("D365 Country"; Rec."D365 Country")
            {
                ApplicationArea = All;
                Caption = 'Country';
            }

            field("D365 City"; Rec."D365 City")
            {
                ApplicationArea = All;
                Caption = 'City';
            }

            field("D365 Postal Code"; Rec."D365 Postal Code")
            {
                ApplicationArea = All;
                Caption = 'PostCode';
            }
        }
    }
}







