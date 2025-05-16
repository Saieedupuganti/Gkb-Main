tableextension 50120 "GKBPurchase LineExt" extends "Purchase Line"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; VendorCatalogueNo; Code[20])
        {
            ToolTip = 'Specifies vendor given name to the item';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                item: Record Item;
            begin
                item."Vendor 1 Catalogue Number" := Rec.VendorCatalogueNo;
            end;
        }
        field(50102; "Line Approval Sent"; Boolean)
        {
            Caption = 'Approval Sent';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(50103; "Obrien_Business_Unit"; Code[40])
        {
            Caption = 'Obrien_Business_Unit_Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value";
        }
        field(50107; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50108; "ItemDescription"; Text[100])
        {
            Caption = 'Item Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("No.")));
            Editable = false;
        }
        field(50109; "ItemAvailability"; Decimal)
        {
            Caption = 'Item Availability';
            Editable = false;
        }
        field(50110; "Alternate Vendor for Item"; Code[50])
        {
            Caption = 'Alternate Vendor for Item';
            DataClassification = ToBeClassified;
            TableRelation = "Item Vendor"."Vendor No." where("Item No." = field("No."));
        }
        field(50111; "Work Order No."; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Work Order No.';
        }
        field(50112; "Ordered By"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ordered By';
            // TableRelation = Employee."First Name";
            // ValidateTableRelation = false;
        }
    }
}
