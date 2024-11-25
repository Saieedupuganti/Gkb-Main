pageextension 50122 "GKB Contacts" extends "Contact Card"
{
    layout
    {
        addafter(General)
        {
            group("D365 CUSTOM FIELDS")
            {
                field("Contact ID"; Rec."Contact ID")
                {
                    ApplicationArea = All;
                    Caption = 'Contact ID';
                }
                field("E-Mail Group Code"; Rec."E-Mail Group Code")
                {
                    ApplicationArea = All;
                    Caption = 'E-Mail Group Code';
                }
                // field("Description";Rec."Description")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Description';
                // }
                field("Primary Contact"; Rec."Primary Contact")
                {
                    ApplicationArea = All;
                    Caption = 'Primary Contact';
                }
                field("Dimension"; Rec.Dimension)
                {
                    ApplicationArea = All;
                    Caption = 'Dimension';
                    TableRelation="Dimension Value".Code;
                }
                field("Dimension Crm Id"; Rec."Dimension ID")
                {
                    ApplicationArea = All;
                    Caption = 'Dimension ID';
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
        addafter("Contact ID")
        {
            field("Description"; Rec.Description)
            {
                Caption='Description';
                ApplicationArea=All;
            }
            field("CRM Id"; Rec."CRM ID")
            {
                Caption='CRM Id';
                ApplicationArea=All;
            }
        }
    }
}
