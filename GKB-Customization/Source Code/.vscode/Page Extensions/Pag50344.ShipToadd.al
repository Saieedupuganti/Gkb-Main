pageextension 50344 "ShipToAddExt" extends "Ship-to Address"
{
    layout
    {
        modify(City)
        {
            Visible = false;
        }
        modify("Country/Region Code")
        {
            Visible = false;
        }
        modify("Post Code")
        {
            Visible = false;
        }
        modify("Customer No.")
        {
            Visible = true;
        }
        addafter("Location Code")
        {
            field("Crm Id"; Rec."Crm Id")
            {
                ApplicationArea = All;
            }
            field("Customer CRM"; Rec."Customer CRM")
            {
                ApplicationArea = all;
            }
        }
        addafter("Address 2")
        {
            field("Address 3"; Rec."Address 3")
            {
                ApplicationArea = All;
            }
            field("D365 City"; Rec."D365 City")
            {
                ApplicationArea = All;
            }
            field("State"; Rec."D365 State")
            {
                ApplicationArea = all;
            }
            field("D365 Country"; Rec."D365 Country")
            {
                ApplicationArea = all;
            }
            field("Postal Code"; Rec."Postal Code")
            {
                ApplicationArea = all;
                Caption = 'Postal Code';
            }
        }
    }
    actions
    {
        addlast(Processing)
        {
            action("Update CRM Address")
            {
                ApplicationArea = All;
                Caption = 'Update Ship-to Address in CRM';
                Image = UpdateShipment;

                trigger OnAction()
                var

                    ShipToAddr: Record "Ship-to Address";
                    ShipToCRM: Codeunit "Ship-To Add Crm Management";
                begin
                    ShipToCRM.UpdateTheRecord();
                    Message('Successfully updated in CRM.');
                end;
            }
        }
    }
}