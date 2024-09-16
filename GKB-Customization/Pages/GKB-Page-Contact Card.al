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
            }
        }
    }
}
