pageextension 50108 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {
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
        }
    }
    actions
    {
        modify("&Print")
        {
            Enabled = (Rec.Status = Rec.Status::Released);
            trigger OnBeforeAction()
            var
                myInt: Integer;
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
            var
                myInt: Integer;
            begin
                if Rec.Status <> Rec.Status::Released then begin
                    Message('Cannot Release. The Purchase Order status must be Released.');
                    exit;
                end;
            end;
        }
    }
}