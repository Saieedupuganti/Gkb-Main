pageextension 50150 ItemListExt extends "Item List"
{
    layout
    {
        addafter("Vendor No.")
        {
            field(VendorName; Rec.VendorName)
            {
                Caption = 'Vendor Name';
                ApplicationArea = All;
            }
            field("CRM ID";Rec."CRM ID"){ApplicationArea =all;}
        }
    }
}