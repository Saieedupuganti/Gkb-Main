namespace Proejct.Proejct;

using Microsoft.Inventory.Requisition;



pageextension 50101 "Req Work" extends "Req. Worksheet"
{
    layout
    {
        modify(Control1903326807)
        {
            Visible = false;

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
    }

}



