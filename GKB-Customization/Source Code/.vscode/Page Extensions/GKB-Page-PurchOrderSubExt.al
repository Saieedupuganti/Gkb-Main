pageextension 50118 PurchOrderSubExt extends "Purchase Order Subform"
{
    layout
    {
        modify("Job No.")
        {
            ShowMandatory = true;
        }
        modify("Job Task No.")
        {
            ShowMandatory = true;
        }
        addlast(Control1)
        {
            field(VendorCatalogueNo; Rec.VendorCatalogueNo)
            {
                Caption = 'Vendor Catologue No';
                ApplicationArea = all;
            }
        }

    }
    
}