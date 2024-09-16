pageextension 50104 VendorCardExt extends "Vendor Card"
{
    layout
    {
        modify("VAT Bus. Posting Group")
        {
            Caption = 'GST Bus. Posting Group';
            ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
        }
        modify("VAT Registration No.")
        {
            Caption = 'GST Registration No.';
            ToolTip = 'Specifies the GST specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
        }
        modify("Prices Including VAT")
        {
            Caption = 'Prices Including GST';
        }
    }
    trigger OnOpenPage();
    var
        UserSetupRec: Record "User Setup";
        IsUserAllowed: Boolean;
    begin
        // Check if the current user has permission to edit the Vendor Card
        if UserSetupRec.Get(UserId()) then begin
            IsUserAllowed := UserSetupRec."Allow Edit Mode";
        end else begin
            IsUserAllowed := false;
        end;

        // If the user does not have permission, make the fields non-editable
        if not IsUserAllowed then
            CurrPage.Editable(false);  // Set the entire page to non-editable
    end;
}