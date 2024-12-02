page 70004 "Work Order Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Work Order";
    UsageCategory = Administration;
    Caption = 'Work Order Card';
    AboutTitle = 'Work Order Card';
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group("General")
            {
                field("Work Order Number"; rec."Work Order Number")
                {
                    ApplicationArea = All;
                    Caption = 'Work Order Number';
                }
                field("Service Account"; rec."Service Account")
                {
                    ApplicationArea = All;
                    Caption = 'Service Account';
                }
                field("System Status"; Rec."System Status")
                {
                    ApplicationArea = All;
                    Caption = 'System Status';
                }
                field("Substatus"; Rec.Substatus)
                {
                    ApplicationArea = All;
                    Caption = 'Substatus';
                }
                field("Agreement"; rec.Agreement)
                {
                    ApplicationArea = All;
                    Caption = 'Agreement';
                }
                field("Project No";Rec."Project No")
                {
                    ApplicationArea = all;
                    Caption = 'Project No.';
                }
                field("Project Task No";Rec."Project Task No")
                {
                    ApplicationArea = all;
                    Caption = 'Project Task No.';
                }
                field("Billing Account"; Rec."Billing Account")
                {
                    ApplicationArea = All;
                    Caption = 'Billing Account';
                }
                field("Billing Type"; rec."Billing Type")
                {
                    ApplicationArea = All;
                    Caption = 'Billing Type';
                }
                field("Case"; rec."Case")
                {
                    ApplicationArea = All;
                    Caption = 'Case';
                }
                field("Completed On"; rec."Completed On")
                {
                    ApplicationArea = All;
                    Caption = 'Completed On';
                }
                field("Contact"; rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact';
                }
                field("Currency"; rec.Currency)
                {
                    ApplicationArea = All;
                    Caption = 'Currency';
                }
                field("Fix Type"; rec."Fix Type")
                {
                    ApplicationArea = All;
                    Caption = 'Fix Type';
                }
                field("Functional Location"; rec."Functional Location")
                {
                    ApplicationArea = All;
                    Caption = 'Functional Location';
                }
                field("Opportunity"; rec.Opportunity)
                {
                    ApplicationArea = All;
                    Caption = 'Opportunity';
                }
                field("Owner"; rec.Owner)
                {
                    ApplicationArea = All;
                    Caption = 'Owner';
                }
                field("Owning Business Unit"; rec."Owning Business Unit")
                {
                    ApplicationArea = All;
                    Caption = 'Owning Business Unit';
                }
                field("Parent Work Order"; rec."Parent Work Order")
                {
                    ApplicationArea = All;
                    Caption = 'Parent Work Order';
                }
                field("Taxable"; rec.Taxable)
                {
                    ApplicationArea = All;
                    Caption = 'Taxable';
                }
                field("Time Window Start"; rec."Time Window Start")
                {
                    ApplicationArea = All;
                    Caption = 'Time Window Start';
                }
                field("Time Window End"; rec."Time Window End")
                {
                    ApplicationArea = All;
                    Caption = 'Time Window End';
                }
                field("Topic"; rec.Topic)
                {
                    ApplicationArea = All;
                    Caption = 'Topic';
                }
                field("Work Description"; rec."Work Description")
                {
                    ApplicationArea = All;
                    Caption = 'Work Description';
                }
                field("Work Location"; rec."Work Location")
                {
                    ApplicationArea = All;
                    Caption = 'Work Location';
                }
                field("Work Order Type"; rec."Work Order Type")
                {
                    ApplicationArea = All;
                    Caption = 'Work Order Type';
                }
                field("Work Order Summary"; rec."Work Order Summary")
                {
                    ApplicationArea = All;
                    Caption = 'Work Order Summary';
                }
                field("Status"; rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }
            }
        }

        area(FactBoxes)
        {
            part("Attachments"; "Document Attachment FactBox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
            }
        }
    }

    actions
    {
        area(Processing)
    {
    }
    }

    var
        myBool: Boolean;
}
