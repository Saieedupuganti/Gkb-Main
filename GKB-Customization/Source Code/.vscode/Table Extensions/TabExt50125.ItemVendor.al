tableextension 50125 GKBItemVendorExt extends "Item Vendor"
{
    fields
    {
        field(50100; "Current Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = CustomerContent;
            Description = 'Stores the Direct Unit Cost of Alternate Vendors from price list line';
            AutoFormatType = 1;
            DecimalPlaces = 0 : 5;
            Editable = false;

            trigger OnValidate()
            begin
                UpdateCurrentCost();
            end;
        }
        field(50101; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No." = FIELD("Vendor No.")));
        }
    }
    local procedure UpdateCurrentCost()
    var
        PriceListLine: Record "Price List Line";
        PriceListHeader: Record "Price List Header";
    begin
        // Find active price lists for purchases
        PriceListHeader.Reset();
        PriceListHeader.SetRange("Price Type", PriceListHeader."Price Type"::Purchase);
        PriceListHeader.SetRange(Status, PriceListHeader.Status::Active);

        if PriceListHeader.FindSet() then
            repeat
                // Check each active price list for matching line
                PriceListLine.Reset();
                PriceListLine.SetRange("Price List Code", PriceListHeader.Code);
                PriceListLine.SetRange("Asset Type", PriceListLine."Asset Type"::Item);
                PriceListLine.SetRange("Asset No.", Rec."Item No.");
                PriceListLine.SetRange("Source Type", PriceListLine."Source Type"::Vendor);
                PriceListLine.SetRange("Source No.", Rec."Vendor No.");

                if PriceListLine.FindFirst() then begin
                    // Found matching price, update and exit
                    Rec."Current Cost" := PriceListLine."Direct Unit Cost";
                    //  Rec.Modify(false);  // false = don't trigger OnModify again
                    exit;
                end;
            until PriceListHeader.Next() = 0;
    end;
}
