page 50151 "WorkOrderTypeCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Work Order Type";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Work Order Name"; Rec."Work Order Name")
                {
                    ApplicationArea = all;
                    Caption = 'Work Order Type Name';
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea =all;
                    Caption = 'Status';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}