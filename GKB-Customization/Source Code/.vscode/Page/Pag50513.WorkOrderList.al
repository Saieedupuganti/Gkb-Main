page 50513 "Work Order List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Work Order Card";
    SourceTable = "GKB Work Order";
    Caption = 'Work Order List';
    Editable = false;
    QueryCategory = 'Work Order List';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Work Order Number"; Rec."Work Order No.")
                {
                    ApplicationArea = All;
                }
                field("Service Account"; rec."Service Account")
                {
                    ApplicationArea = All;
                }
                field("System Status"; rec."System Status")
                {
                    ApplicationArea = All;
                }
                field("Substatus"; rec.Substatus)
                {
                    ApplicationArea = All;
                }
                field("Agreement"; Rec.Agreement)
                {
                    ApplicationArea = All;
                }
                field("Billing Account"; Rec."Billing Account")
                {
                    ApplicationArea = All;
                }
                field("Billing Type"; rec."Billing Type")
                {
                    ApplicationArea = All;
                }
                field("Completed On"; rec."Completed On")
                {
                    ApplicationArea = All;
                }
                field("Time Window Start"; rec."Time Window Start")
                {
                    ApplicationArea = All;
                }
                field("Time Window End"; rec."Time Window End")
                {
                    ApplicationArea = All;
                }
                field("Project No"; Rec."Job No.")
                {
                    ApplicationArea = all;
                }
                field("Project Task No"; Rec."Project Task No")
                {
                    ApplicationArea = all;
                }
                field("Status"; rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewWorkOrder)
            {
                ApplicationArea = All;
                Caption = 'New Work Order';
                Image = New;

                trigger OnAction()
                begin
                    PAGE.RunModal(PAGE::"Work Order Card");
                end;
            }
        }

        area(Navigation)
        {
            action(ViewDetails)
            {
                ApplicationArea = All;
                Caption = 'View Details';
                Image = View;

                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Work Order Card");
                end;
            }
        }
    }

    var
        myInt: Integer;
}
