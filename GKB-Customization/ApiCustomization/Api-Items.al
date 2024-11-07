page 50312 "API Items"
{
    PageType = API;
    Caption = 'API Item';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'Item';
    EntitySetName = 'Item';
    SourceTable = Item;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field(code; Rec."No.")
                {
                    Caption = 'no';
                }
            }
        }
    }
}