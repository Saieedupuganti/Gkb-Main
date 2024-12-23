page 50152 "Work Order Lines List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Work Order Lines";
    Caption = 'Work Order Lines List';
    UsageCategory = Lists;
    //CardPageId = "Work Order Line Card";
    AboutTitle = 'About Customer Asset';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Work Order No"; Rec."Work Order No.")
                {
                    Caption = 'Work Order No.';
                    ApplicationArea = all;
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

                field(Code; rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                field("CRM ID"; Rec."CRM ID")
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
                field("Project Code"; rec."Project Code")
                {
                    ApplicationArea = All;
                }
                field("Project Task Code"; rec."Project Task Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Amount"; Rec."Unit Amount")
                {
                    ApplicationArea = all;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = all;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = all;

                }

            }
        }
    }

    actions
    {
    }
}