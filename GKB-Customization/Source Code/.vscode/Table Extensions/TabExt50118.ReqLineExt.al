tableextension 50118 "Requesion Line Ext" extends "Requisition Line"
{
    fields
    {
        modify("Vendor No.")
        {
            trigger OnAfterValidate()
            var
                PriceListLine: Record "Price List Line";
            begin
                if Rec."Vendor No." <> '' then begin
                    PriceListLine.Reset();
                    PriceListLine.SetRange("Source No.", Rec."Vendor No.");
                    PriceListLine.SetRange("Product No.", Rec."No.");
                    if PriceListLine.FindFirst() then
                        Rec.Validate("Direct Unit Cost", PriceListLine."Direct Unit Cost");
                end else begin
                    Rec."Direct Unit Cost" := 0;
                end;
            end;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                if Rec."No." <> xRec."No." then begin
                    Rec."Location Code" := '';
                    Rec."Item Availability By Location" := 0;
                end;
            end;
        }
        field(50102; "projectNo"; Code[30])
        {
            Caption = 'Project No.';
            TableRelation = Job;
        }
        field(50103; "AlternateVendorNo."; Code[30])
        {
            Caption = 'Vendor No';
            TableRelation = Vendor;
        }
        field(50130; "Crm Id"; Text[100])
        {
            Caption = 'Crm Id';
            DataClassification = ToBeClassified;
        }

        field(50104; "VendorName"; Text[100])
        {
            Caption = 'Vendor Name';
            TableRelation = Vendor.Name;
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                Vendor: Record Vendor;
                Item: Record Item;
            begin
                if Rec."VendorName" = '' then begin
                    Rec."Vendor No." := '';
                    exit;
                end;

                if (Rec.Type = Rec.Type::Item) and (Rec."No." <> '') then begin
                    if Item.Get(Rec."No.") then begin
                        if Item.Type = Item.Type::Inventory then begin
                            Error('Cannot modify vendor for Inventory items.');
                        end;
                    end;
                end;

                Vendor.Reset();
                Vendor.SetCurrentKey(Name);
                Vendor.SetRange(Name, Rec."VendorName");

                if Vendor.FindFirst() then begin
                    Rec."Vendor No." := Vendor."No.";
                end else
                    Error('Vendor with name %1 not found.', Rec."VendorName");
            end;
        }
        field(50105; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Vendor".Name WHERE("No." = FIELD("Vendor No.")));
            ObsoleteState = Removed;
        }
        field(50106; "Requested By Name"; Code[30])
        {
            Caption = 'Requested By Name';
            TableRelation = Employee."First Name";
            ValidateTableRelation = false;
        }
        field(50107; "Project Task No"; Code[30])
        {
            Caption = 'Project Task No';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD(projectNo));

            trigger OnValidate()
            var
                JobTask: Record "Job Task";
            begin
                if JobTask.Get(Rec.projectNo, Rec."Project Task No") then begin
                    Rec."Shortcut Dimension 1 Code" := JobTask."Global Dimension 1 Code";
                end else begin
                    Rec."Shortcut Dimension 1 Code" := '';
                end;
            end;
        }
        field(50108; "Dimension Value"; Code[30])
        {
            TableRelation = "Dimension Value";
            Caption = 'Dimension Value';
            DataClassification = ToBeClassified;
        }
        field(50109; "Work Order No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "GKB Work Order";
            trigger OnValidate()
            var
                WorkOrder: Record "GKB Work Order";
            begin
                if xRec."Work Order No" <> Rec."Work Order No" then begin
                    WorkOrder.Reset();
                    if WorkOrder.Get(Rec."Work Order No") then begin
                        Rec."Project Task No" := WorkOrder."Project Task No";
                        Rec.projectNo := WorkOrder."Job No.";
                        Rec."Shortcut Dimension 1 Code" := WorkOrder."Shortcut Dimension 1 Code";
                    end;
                end;
            end;
        }
        field(50110; "Stock Check"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Stock Check';
        }
        field(50111; "Ship To"; Option)
        {
            Caption = 'Ship To';
            DataClassification = ToBeClassified;
            OptionMembers = "Customer","Warehouse";
        }
        field(50112; "Alternate Vendor For Item"; Boolean)
        {
            Caption = 'Alternate Vendor For Item';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50113; "Item Availability By Location"; Decimal)
        {
            Caption = 'Item Availability By Location';

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if rec."Location Code" = '' then
                    Rec."Item Availability By Location" := 0;
                exit;
            end;
        }
        field(50114; "Item Inventory"; Decimal)
        {
            Caption = 'Item Inventory';
            DataClassification = CustomerContent;
            Editable = false;
            DecimalPlaces = 0 : 5;
            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if Rec."No." <> '' then begin
                    if Item.Get(Rec."No.") then begin
                        Rec."Item Inventory" := Item.Inventory;
                    end;
                end;
            end;
        }
        field(50115; "PO Created"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'PO Created';
        }
       
    }

    trigger OnInsert()
    var
        User: Record "User Setup";

    begin
        IF User.GET(USERID) THEN
            Rec."Requested By Name" := User."User ID";
        // Newly created requisition lines will have the same attachment ID as the requisition line

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePLInsert(var PurchaseLine: Record "Purchase Line"; var IsHandled: Boolean)
    begin
    end;


}