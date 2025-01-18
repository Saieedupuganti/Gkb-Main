pageextension 70125 "GKB Vendor EXT" extends "Vendor Card"
{
    layout
    {
        modify(ABN)
        {
            Editable = true;
            Enabled = true;
            Visible = true;
            ShowMandatory = true;
        }
        modify("Post Code")
        {
            Visible = false;
        }
        modify("Country/Region Code")
        {
            Visible = false;
        }
        modify(City)
        {
            Visible = false;
        }

        addafter(General)
        {
            group("D365 CUSTOM FIELDS")
            {
                field("Vendor Profile"; Rec."Vendor Profile")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Profile';
                }
                field("D365 Account ID"; Rec."D365 Account ID")
                {
                    ApplicationArea = All;
                    Caption = 'D365 Account ID';
                }
                field("SAP Vendor Number"; Rec."SAP Vendor Number")
                {
                    ApplicationArea = All;
                    Caption = 'SAP Vendor Number';
                }
                field("Service Agreement"; Rec."Service Agreement")
                {
                    Caption = 'Service Agreement';
                    ApplicationArea = All;
                }
                field("Account Contract Manager"; Rec."Account Contract Manager")
                {
                    ApplicationArea = All;
                    Caption = 'Account Contract Manager';
                }
                field("Capex From"; Rec."Capex From")
                {
                    ApplicationArea = All;
                }
                field("Capex To"; Rec."Capex To")
                {
                    ApplicationArea = All;
                    Caption = 'Capex To';
                }
                field("Customer Group"; Rec."Customer Group")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Group';
                }
                field("Contact Groups"; Rec."Contact Groups")
                {
                    ApplicationArea = All;
                    Caption = 'Contact Group';
                }
                field("CreditHold"; Rec."Credit Hold")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Hold';

                }
                field("Owner Ship"; Rec."Owner Ship")
                {
                    ApplicationArea = all;
                }
                field("Credit Holds"; Rec."Credit Holds")
                {
                    ApplicationArea = all;
                }
                field("Supplier account Group"; Rec."Supplier account Group")
                {
                    ApplicationArea = all;
                    Caption = 'Supplier Account Group';
                }
                field(WEB; Rec.WEB)
                {
                    ApplicationArea = all;
                    Caption = 'Web';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    Caption = 'Description';
                }
                field("Company Conatct"; Rec."Company Conatct")
                {
                    ApplicationArea = all;
                    Caption = 'Company Contact';
                }
                field("CRM ID"; Rec."CRM Id")
                {
                    ApplicationArea = all;
                    Caption = 'CRM ID';
                    Editable = false;
                    ToolTip = 'Specifies the CRM ID for this vendor';
                }
                field("Territory"; Rec."Territory Code")
                {
                    ApplicationArea = all;
                    Caption = 'Territory Code';
                    TableRelation = Territory.Code;
                }
            }
        }

        addafter("Address 2")
        {
            field("Address 3"; Rec."Address 3")
            {
                ApplicationArea = all;
            }
        }
        addbefore(Address)
        {
            field("Address Name"; Rec."Address Name")
            {
                ApplicationArea = all;
            }
            field(Dimension; Rec.Dimension)
            {
                ApplicationArea = all;
                Caption = 'Dimension';
                TableRelation = "Dimension Value".Code;
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = all;
                Caption = 'Global Dimension 1 Code';
            }
        }
        addlast("Address & Contact")
        {
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

    actions
    {
        addlast(navigation)
        {
            action(SyncWithCRM)
            {
                Caption = 'Update To CRM';
                Image = UpdateXML;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    VendorCRMIntegration: Codeunit "Vendor CRM Integration";
                    ConfirmQst: Label 'Do you want to sync this vendor with CRM?';
                    SuccessMsg: Label 'Vendor successfully %1 in CRM.';
                begin
                    if not Confirm(ConfirmQst) then
                        exit;

                    if Rec.Blocked <> Rec.Blocked::" " then
                        Error('Cannot sync blocked vendors with CRM');

                    if Rec."CRM ID" = '' then begin
                        // Create new record in CRM
                        if VendorCRMIntegration.CreateVendorInCRM(Rec) then
                            Message(SuccessMsg, 'created')
                        else
                            Error('Failed to create vendor in CRM');
                    end else begin
                        // Update existing record in CRM
                        if VendorCRMIntegration.UpdateVendorInCRM(Rec) then
                            Message(SuccessMsg, 'updated')
                        else
                            Error('Failed to update vendor in CRM');
                    end;
                end;
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
            IsUserAllowed := UserSetupRec."Allow Edit Mode";
        end else begin
            IsUserAllowed := false;
        end;

        // If the user does not have permission, make the fields non-editable
        if not IsUserAllowed then
            CurrPage.Editable(false);  // Set the entire page to non-editable
    end;
}
