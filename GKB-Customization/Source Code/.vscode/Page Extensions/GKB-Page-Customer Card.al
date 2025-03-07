pageextension 50121 "customercustom/mandatory" extends "Customer Card"
{
    layout
    {
        modify(ABN)             // Used Custom Field ABN No. instead of ABN
        {
            Editable = true;
            Enabled = true;
            Visible = true;
            
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
        // modify("Primary Contact No.")
        // {
        //  CalcFormula = Lookup(Contact."No." WHERE ("CRM ID" = Field("Primary Contact CRMID")));
        // }

        addafter(General)
        {
            group("D365 CUSTOM FIELDS")
            {

                field("Customer Profile"; Rec."Customer Profile")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Profile';
                }
                field("Supplier account Group"; Rec."Supplier account Group")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier account Group';
                    ShowMandatory = true;
                    Editable = true;
                    Visible = true;
                }
                field("D365 Account ID"; Rec."D365 Account ID")
                {
                    ApplicationArea = All;
                    Caption = 'D365 Account ID';
                }
                field("SAP Customer Number"; Rec."SAP Customer Number")
                {
                    ApplicationArea = All;
                    Caption = 'SAP Customer Number';
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
                field("Contact Group"; Rec."Contact Group")
                {
                    ApplicationArea = all;
                }
                field("Credit Hold"; Rec."Credit Hold")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field("Import Serial No"; Rec."Import Serial No")
                {
                    ApplicationArea = all;
                }
                field("Owner Ship"; Rec."Owner Ship")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("crmid"; Rec."CRM ID")
                {
                    ApplicationArea = all;
                }
                field(WEB; Rec.WEB)
                {
                    ApplicationArea = all;
                    Caption = 'Web';
                }
                field("Territory"; Rec.Territory)
                {
                    ApplicationArea = all;
                    Caption = 'Territory';
                    TableRelation = Territory.Code;
                }
                field("Primary Contact"; Rec."Company Contact")
                {
                    ApplicationArea = all;
                    Caption = 'Company Contact';
                }
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

            field("D365 PostCode"; Rec."D365 PostCode")
            {
                ApplicationArea = All;
                Caption = 'PostCode';
                trigger OnValidate()
                begin
                    if Rec."D365 PostCode" <> '' then
                        Rec."Post Code" := Rec."D365 PostCode";
                end;
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
        }
        

    }

    actions
    {
        addlast(navigation)
        {
            action(UpadateCRM)
            {
                Caption = 'Update To CRM';
                ApplicationArea = All;
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Update this to CRM';

                trigger OnAction()
                var
                    CustomerCRM: Codeunit "Customer Crm Management";
                begin
                    CustomerCRM.UpdateCRMAccount(Rec);
                    Message('Successfully updated in CRM.');
                end;
            }
        }
    }


    trigger OnOpenPage();
    var
        UserSetupRec: Record "User Setup";
        IsUserAllowed: Boolean;
        ContactRec: Record Contact;
        
    begin
        if UserSetupRec.Get(UserId()) then begin
            IsUserAllowed := UserSetupRec."Customer Card";
        end else begin
            IsUserAllowed := false;
        end;

        if not IsUserAllowed then
            CurrPage.Editable(false);
    end;
}

