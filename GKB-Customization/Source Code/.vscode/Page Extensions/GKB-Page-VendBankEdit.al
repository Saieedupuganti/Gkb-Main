pageextension 50116 VendBankEdit extends "Vendor Bank Account Card"
{
    trigger OnOpenPage();
    var
        UserSetupRec: Record "User Setup";
        IsUserAllowed: Boolean;
    begin

        if UserSetupRec.Get(UserId()) then begin
            IsUserAllowed := UserSetupRec."Allow Edit Vandor Bank";
        end else begin
            IsUserAllowed := false;
        end;

        if not IsUserAllowed then
            CurrPage.Editable(false);
    end;
}