page 70102 "CDS Lab Book List"
{
    Caption = 'CDS Lab Book List';
    PageType = List;
    SourceTable = "CDS adigkb_LabBook";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    RefreshOnActivate = true;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(adigkb_No; Rec.adigkb_No)
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(adigkb_Title; Rec.adigkb_Title)
                {
                    Caption = 'Title';
                    ApplicationArea = All;
                }
                field(adigkb_Author; Rec.adigkb_Author)
                {
                    Caption = 'Author';
                    ApplicationArea = All;
                }
                field(adigkb_Hardcover; Rec.adigkb_Hardcover)
                {
                    Caption = 'Hardcover';
                    ApplicationArea = All;
                }
                field(adigkb_PageCount; Rec.adigkb_PageCount)
                {
                    Caption = 'Page Count';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(CreateFromCDS)
            {
                ApplicationArea = All;
                Caption = 'Create in Business Central';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Generate the table from the coupled Microsoft Dataverse lab book.';
                trigger OnAction()
                var
                    CDSLabBook: Record "CDS adigkb_LabBook";
                    CRMIntegrationManagement: Codeunit "CRM Integration Management";
                begin
                    CurrPage.SetSelectionFilter(CDSLabBook);
                    CRMIntegrationManagement.CreateNewRecordsFromCRM(CDSLabBook);
                end;
            }
        }
    }
    var
        CurrentlyCoupledCDSLabBook: Record "CDS adigkb_LabBook";
    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"CRM Integration Management");
    end;
    procedure SetCurrentlyCoupledCDSLabBook(CDSLabBook: Record "CDS adigkb_LabBook")
    begin
        CurrentlyCoupledCDSLabBook := CDSLabBook;
    end;
}