page 50508 "Work Order Lines ListPart"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "GKB Work Order Lines";
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
                        WorkOrder: Record "GKB Work Order";
                    begin
                        if xRec."Work Order No." <> Rec."Work Order No." then begin
                            if WorkOrder.Get(Rec."Work Order No.") then begin
                                Rec."Work OrDER No." := WorkOrder."Project Task No";
                                Rec."Job No." := WorkOrder."Job No.";
                            end;
                        end;
                    end;
                }
                field("Project Code"; rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field("Project Task Code"; rec."Work Order No.")
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
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
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
