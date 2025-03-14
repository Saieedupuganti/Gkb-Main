pageextension 50108 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {
        moveafter("Status"; "Shortcut Dimension 1 Code")
        modify("Shortcut Dimension 1 Code")
        {
            ShowMandatory = true;
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
            }
            field("Job No"; Rec."Job No")
            {
                ApplicationArea = all;
                Caption = 'Work Order No.';
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
        addafter(SendApprovalRequest)
        {
            action("Send Line Approvals")
            {
                Caption = 'Send Line Approvals';
                ApplicationArea = All;

                trigger OnAction()
                var
                    LineApproval: Codeunit "Lines Instruction Mgt.";
                begin
                    LineApproval.PurchaseCheckAllLinesHaveQuantityAssigned(Rec);
                    Message('Line-level approvals sent successfully.');
                end;
            }
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