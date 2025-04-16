namespace Proejct.Proejct;

using Microsoft.Inventory.Requisition;
using System.Automation;
using Microsoft.Integration.Dataverse;
using System.Security.User;
using Microsoft.Purchases.Document;
using Microsoft.Projects.Project.Job;
using Microsoft.Foundation.Enums;
using Microsoft.Inventory.Availability;
using Microsoft.Inventory.Item;
using Microsoft.Purchases.Vendor;
using Microsoft.Inventory.Item.Catalog;

pageextension 50100 "Req WO" extends "Req. Worksheet"
{
    Caption = 'Purchase Request';
    layout
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                ItemVendorCat: Record "Item Vendor";
            begin
                ItemVendorCat.SetRange("Item No.", Rec."No.");
                Rec."Unit Cost" := ItemVendorCat."Current Cost";
            end;
        }
        modify("Location Code")
        {
            Caption = 'Warehouse';  // Changing the location code to warehouse in req. worksheet.
            ShowMandatory = true;
        }
        modify("Requester ID")
        {
            Caption = 'Current User';
        }
        modify("Buy-from Vendor Name")
        {
            Visible = false;
        }
        modify("Description 2")
        {
            Visible = false;
        }
        modify(Control1903326807)
        {
            Visible = false;
        }
        modify("Due Date")
        {
            Caption = 'Required by date';
            ShowMandatory = true;
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Obrien_Business Unit Code';
            ApplicationArea = all;
        }
        addlast(Control1)
        {
            field("Obrien Business Unit Code"; Rec."Shortcut Dimension 1 Code")
            {
                ApplicationArea = all;
                Visible = false;
            }
        }
        addafter("Vendor No.")
        {
            field(VendorName; Rec.VendorName)
            {
                ApplicationArea = all;
                Visible = true;
            }
            field("Requested By Name"; Rec."Requested By Name")
            {
                ApplicationArea = all;
            }
            field(Availability; CalcAvailability(Rec))
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Total Availability';
                DecimalPlaces = 0 : 5;
                DrillDown = true;
                Editable = true;
                ToolTip = 'Specifies how many units of the item on the Requisition line are available.';

                trigger OnDrillDown()
                var
                    ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
                begin
                    ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByEvent());
                    CurrPage.Update(true);
                end;
            }
            field("Alternate Vendor For Item"; Rec."Alternate Vendor For Item")
            {
                ApplicationArea = all;
                ToolTip = 'Checks item has alternate vendor or not';
            }
            field("Ship To"; Rec."Ship To")
            {
                ApplicationArea = all;

            }
        }
        addafter(Control1903326807)
        {
            part(ItemAvailability; "Req WO FactBox")
            {
                ApplicationArea = Planning;
                SubPageLink = "Worksheet Template Name" = field("Worksheet Template Name"), "Journal Batch Name" = field("Journal Batch Name"), "Line No." = field("Line No.");
                Visible = true;
            }
        }
        addafter(Control1)
        {
            part(Inventory; "Req WO FactBox")
            {
                ApplicationArea = Planning;
                SubPageLink = "Worksheet Template Name" = field("Worksheet Template Name"), "Journal Batch Name" = field("Journal Batch Name"), "Line No." = field("Line No.");
                Visible = false;
            }
        }
        addafter("Location Code")
        {
            field("Item Availability By Location"; Rec."Item Availability By Location")
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
        addafter("Vendor Item No.")
        {
            field("project no"; Rec.projectNo)
            {
                ApplicationArea = all;

            }
            field("Project Task No"; Rec."Project Task No")
            {
                ApplicationArea = all;

            }
        }
    }
    actions
    {
        // Jathin's Code strts from here
        addafter(Reserve)
        {
            action("Create Purchase Order")
            {
                ApplicationArea = All;
                Caption = 'Create Purchase Order', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CreateDocuments;

                trigger OnAction()
                var
                    CreatedOrderHelper: Codeunit "Create Order helper";
                // RequisitionLine: Record "Requisition Line";
                begin
                    //DCS:SK 01/04/2025 NS
                    if Confirm('Do you want to create purchase orders?', false) then begin
                        CreatedOrderHelper.CreatePurchpurchaseorder();
                        // RequisitionLine.Reset();
                        // RequisitionLine.SetRange("Worksheet Template Name", Rec."Worksheet Template Name");
                        // RequisitionLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                        // RequisitionLine.DeleteAll();
                        //DCS:SK 01/04/2025 NE
                    end;
                end;
            }
        }


        // Jathin's code ends here
    }

    // Item Availability Code Starts From here.
    local procedure CalcAvailability(var ReqLine: Record "Requisition Line"): Decimal
    var
        AvailableToPromise: Codeunit "Available to Promise";
        GrossRequirement: Decimal;
        ScheduledReceipt: Decimal;
        AvailableQuantity: Decimal;
        PeriodType: Enum "Analysis Period Type";
        AvailabilityDate: Date;
        LookaheadDateformula: DateFormula;
        IsHandled: Boolean;
        Item: Record Item;
    begin
        if Item.Get(Rec."No.") then begin
            if ReqLine."Due Date" <> 0D then //"Expected Receipt Date"
                AvailabilityDate := ReqLine."Due Date" //"Expected Receipt Date"
            else
                AvailabilityDate := WorkDate();
            Item.Reset();
            Item.SetRange("Date Filter", 0D, AvailabilityDate);
            Item.SetRange("Variant Filter", ReqLine."Variant Code");
            Item.SetRange("Location Filter", ReqLine."Location Code");
            Item.SetRange("Drop Shipment Filter", false);
            IsHandled := false;
            if IsHandled then exit(AvailableQuantity);
            exit(AvailableToPromise.CalcQtyAvailabletoPromise(Item, GrossRequirement, ScheduledReceipt, AvailabilityDate, PeriodType, LookaheadDateformula));
        end;
    end;

    procedure ShowItemAvailFromPurchLine(var ReqLine: Record "Requisition Line"; AvailabilityType: Option Date,Variant,Location,Bin,"Event",BOM,UOM)
    var
        Item: Record Item;
        NewDate: Date;
        NewVariantCode: Code[10];
        NewLocationCode: Code[10];
        NewUnitOfMeasureCode: Code[10];
        IsHandled: Boolean;
        ItemAvailCU: Codeunit "Item Availability Forms Mgt";
    begin
        ReqLine.TestField(Type, ReqLine.Type::Item);
        ReqLine.TestField("No.");
        Item.Reset();
        Item.Get(ReqLine."No.");
        FilterItem(Item, ReqLine."Location Code", ReqLine."Variant Code", ReqLine."Due Date"); //"Expected Receipt Date");
        IsHandled := false;
        //OnBeforeShowItemAvailFromPurchLine(Item, ReqLine, IsHandled, AvailabilityType);
        if IsHandled then exit;
        case AvailabilityType of
            AvailabilityType::Date:
                if ItemAvailCU.ShowItemAvailByDate(Item, ReqLine.FieldCaption(ReqLine."Due Date"), ReqLine."Due Date", NewDate) then
                    ReqLine.Validate(ReqLine."Due Date", NewDate);
            AvailabilityType::Variant:
                if ItemAvailCU.ShowItemAvailVariant(Item, ReqLine.FieldCaption(ReqLine."Variant Code"), ReqLine."Variant Code", NewVariantCode) then
                    ReqLine.Validate(ReqLine."Variant Code", NewVariantCode);
            AvailabilityType::Location:
                if ItemAvailCU.ShowItemAvailByLoc(Item, ReqLine.FieldCaption(ReqLine."Location Code"), ReqLine."Location Code", NewLocationCode) then
                    ReqLine.Validate(ReqLine."Location Code", NewLocationCode);
            AvailabilityType::"Event":
                if ItemAvailCU.ShowItemAvailByEvent(Item, ReqLine.FieldCaption(ReqLine."Due Date"), ReqLine."Due Date", NewDate, false) then
                    ReqLine.Validate(ReqLine."Due Date", NewDate);
            AvailabilityType::BOM:
                if ItemAvailCU.ShowItemAvailByBOMLevel(Item, ReqLine.FieldCaption(ReqLine."Due Date"), ReqLine."Due Date", NewDate) then
                    ReqLine.Validate(ReqLine."Due Date", NewDate);
            AvailabilityType::UOM:
                if ItemAvailCU.ShowItemAvailByUOM(Item, ReqLine.FieldCaption(ReqLine."Unit of Measure Code"), ReqLine."Unit of Measure Code", NewUnitOfMeasureCode) then
                    ReqLine.Validate(ReqLine."Unit of Measure Code", NewUnitOfMeasureCode);
        end;
    end;

    local procedure FilterItem(var Item: Record Item; LocationCode: Code[20]; VariantCode: Code[20]; Date: Date)
    begin
        // Do not make global
        // Request to make function global has been rejected as it is a skeleton function of the codeunit
        Item.SetRange("No.", Item."No.");
        Item.SetRange("Date Filter", 0D, Date);
        Item.SetRange("Variant Filter", VariantCode);
        Item.SetRange("Location Filter", LocationCode);
    end;


}