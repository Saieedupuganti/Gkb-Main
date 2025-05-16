pageextension 50370 "Purch Inv Ext" extends "Purchase invoice"
{
    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                if rec."Shortcut Dimension 1 Code" = '' then begin
                    Error('Cannot Post. The Obrien Business Unit Code must have a value.');
                    exit;
                end;
            end;
        }
    }
}