page 50150 "Work Order Type"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Work Order Type";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Work Order Name"; Rec."Work Order Name")
                {
                    Caption = 'Work Order Type Name';
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}