page 50154 "Work Order Substatus Type"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Work Order Substatus";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Name"; Rec."Name")
                {
                    Caption = 'Name';
                    ApplicationArea = all;
                }
                field("System Substatus"; Rec."System Substatus")
                {
                    Caption = 'System Substatus';
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