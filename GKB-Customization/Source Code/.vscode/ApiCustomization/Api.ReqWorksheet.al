page 50308 "Req.Worksheet API"
{
    PageType = API;
    Caption = 'Req.Worksheet API';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0';
    EntityName = 'PurchaseRequest';
    EntitySetName = 'PurchaseRequest';
    SourceTable = "Requisition Line";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("CrmId"; Rec."Crm Id")
                {
                    Caption = 'Crm Id';
                }
                field("WorksheetTemplateName"; Rec."Worksheet Template Name") { }
                field("JournalBatchName"; Rec."Journal Batch Name") { }

                field(Type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field("No"; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field("ObrienBusinessUnitCode"; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Obrien Business Unit Code';
                }
                field("LocationCode"; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field("VendorNo"; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field("UnitofMeasureCode"; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field("BaseUnitOfMeasure"; Item."Base Unit of Measure") { }   //From item Table.
                field("WorkOrderNo"; Rec."Work Order No")
                {
                    Caption = 'Work Order No.';
                }
                field("DueDate"; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
            }
        }
    }
    var
        Item: Record Item;
}