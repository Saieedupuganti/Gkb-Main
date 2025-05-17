pageextension 50108 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {
        addfirst(factboxes)
        {
            part(ItemDetailsFactBox; "Item Details Fact Box")
            {
                ApplicationArea = All;
                Provider = PurchLines;
                SubPageLink = "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("Document No."),
                              "Line No." = FIELD("Line No.");
            }
        }
        addafter(ItemDetailsFactBox)
        {
            part(AlternateVendorFactbox; "Alternate Vendor Factbox")
            {
                ApplicationArea = All;
                Provider = PurchLines;
                SubPageLink = "Item No." = field("No.");

            }
        }
        moveafter("Status"; "Shortcut Dimension 1 Code")
        modify("Shortcut Dimension 1 Code")
        {
            ShowMandatory = true;
        }
        modify("Vendor Invoice No.")
        {
            ShowMandatory = false;
        }
        addlast(General)
        {
            field("Ordered By"; Rec."Ordered By")
            {
                ApplicationArea = all;
                Caption = 'Ordered By';

            }
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = all;
                Caption = 'Created By';
                Editable = false;
            }
            field("Job No"; Rec."Job No")
            {
                ApplicationArea = all;
                Caption = 'Work Order No.';
            }
            field("Delivery Docket No."; Rec."Delivery Docket No.")
            {
                ApplicationArea = all;
                Caption = 'Delivery Docket No.';
            }
        }
        addafter("Buy-from Address 2")
        {
            field("Address 3"; Rec."Address 3")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        modify("&Print")
        {
            Enabled = (Rec.Status = Rec.Status::Released);
            trigger OnBeforeAction()
            begin
                if Rec.Status <> Rec.Status::Released then begin
                    Message('Cannot print. The Purchase Order status must be Released.');
                    exit;
                end;
            end;
        }
        modify(SendCustom)
        {
            Enabled = (Rec.Status = Rec.Status::Released);
            trigger OnBeforeAction()
            var
                myInt: Integer;
            begin
                if Rec.Status <> Rec.Status::Released then begin
                    Message('Cannot Send. The Purchase Order status must be Released.');
                    exit;
                end;
            end;
        }
        modify(Release)
        {
            Enabled = (Rec.Status = Rec.Status::Released);
            trigger OnBeforeAction()
            begin
                if Rec.Status <> Rec.Status::Released then begin
                    Message('Cannot Release. The Purchase Order status must be Released.');
                    exit;
                end;
            end;
        }
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                if Rec."Shortcut Dimension 1 Code" = '' then begin
                    Error('Obrien Business Unit Code must have a value');
                end;
            end;
        }
    }

    trigger OnAfterGetRecord()
    var
        VendorRec: Record Vendor;
    begin
        if VendorRec.Get(Rec."Buy-from Vendor No.") then begin
            Rec."Address 3" := VendorRec."Address 3";
            CurrPage.Update(false);
        end;
    end;

}