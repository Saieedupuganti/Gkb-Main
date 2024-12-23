page 50157 "Work Order Lines ListPart"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "Work Order Lines";
    Caption = 'Work Order Lines';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Work Order No."; rec."Work Order No.")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;

                    trigger OnValidate()
                    var
                        WorkOrder: Record "Work Order";
                    begin
                        if xRec."Work Order No." <> Rec."Work Order No." then begin
                            WorkOrder.Reset();
                            if WorkOrder.Get(Rec."Work Order No.") then begin
                                Rec."Project Task Code" := WorkOrder."Project Task No";
                                Rec."Project Code" := WorkOrder."Project No";
                            end;
                        end;
                    end;
                }
                field("Project Code"; rec."Project Code")
                {
                    ApplicationArea = All;
                }
                field("Project Task Code"; rec."Project Task Code")
                {
                    ApplicationArea = All;
                }
                field(Code; rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                field("Unit Code"; rec."Unit Code")
                {
                    ApplicationArea = All;
                }
                field("Line Status"; rec."Line Status")
                {
                    ApplicationArea = All;
                }
                field("Estimate Quantity"; rec."Estimate Quantity")
                {
                    ApplicationArea = All;
                }
                field("Quantity to Build"; rec."Quantity to Build")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action("New Line")
            {
                ApplicationArea = All;
                Caption = 'New Line';
                ToolTip = 'Create a new work order line.';
                Image = GetLines;
                trigger OnAction()
                begin
                    Rec.Insert(true);
                end;
            }
        }
    }
}
