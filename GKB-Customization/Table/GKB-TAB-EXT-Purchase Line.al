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
        
    }
}
