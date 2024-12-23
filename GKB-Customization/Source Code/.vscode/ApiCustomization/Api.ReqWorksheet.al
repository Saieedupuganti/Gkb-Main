page 50308 "Req.Worksheet API"
{
    PageType = API;
    Caption = 'Req.Worksheet API';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0';
    EntityName = 'PurchaseRequest';
    EntitySetName = 'PurcchaseRequest';
    SourceTable = "Requisition Line";
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("VendorItemNo";Rec."Vendor Item No.")
                {
                    Caption = 'fieldCaption';                   
                }
                field(Type;Rec.Type)
                {
                    Caption = 'Type';
                }
                field("No";Rec."No.")
                {
                    Caption = 'No.';
                }
                field(Description;Rec.Description){
                    Caption = 'Description';
                }
                field("ObrienBusinessUnitCode";Rec."Obrien Business Unit Code")
                {
                    Caption = 'Obrien Business Unit Code';
                }
                field("LocationCode";Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field("VendorNo";Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                }
                field(Quantity;Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field("UnitofMeasureCode";Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field("DueDate";Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field("DirectUnitCost";Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                }
                field(VendorName;Rec.VendorName)
                {
                    Caption = 'Vendor Name';
                }
                field(projectNo;Rec.projectNo)
                {
                    Caption = 'Project No.';
                }
            }
        }
    }
}