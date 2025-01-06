pageextension 50143 "GKB Location Card" extends "Location Card"
{
    layout
    {
        modify(City)
        {
            Visible = false;
        }
        modify(County)
        {
            visible = false;
        }
        modify("Country/Region Code")
        {
            visible = false;
        }
        modify("Post Code")
        {
            visible = false;
        }
        modify("Address 2")
        {
            Visible = true;
            ApplicationArea = all;
        }
        addbefore(Address)
        {
            field("Address Name"; Rec."Address Name")
            {
                ApplicationArea = all;
            }
        }
        addafter("Address 2")
        {
            field("Address 3"; Rec."Address 3")
            {
                ApplicationArea = all;
            }
            field("D365 City"; Rec."D365 City")
            {
                ApplicationArea = all;
            }
            field("D365 Country"; Rec."D365 Country")
            {
                ApplicationArea = all;
            }
            field("D365 State"; Rec."D365 State")
            {
                ApplicationArea = all;
            }
            field("D365 Post Code"; Rec."D365 Postal Code")
            {
                ApplicationArea = all;
            }

        }
    }
    trigger OnOpenPage();
    var
        UserSetupRec: Record "User Setup";
        IsUserAllowed: Boolean;
    begin
        // Check if the current user has permission to edit the Vendor Card
        if UserSetupRec.Get(UserId()) then begin
            IsUserAllowed := UserSetupRec.Location;
        end else begin
            IsUserAllowed := false;
        end;

        // If the user does not have permission, make the fields non-editable
        if not IsUserAllowed then
            CurrPage.Editable(false);  // Set the entire page to non-editable
    end;
}