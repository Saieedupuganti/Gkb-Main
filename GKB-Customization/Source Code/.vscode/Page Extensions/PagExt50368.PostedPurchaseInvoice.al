pageextension 50368 "Posted Purch inv Ext" extends "Posted Purchase Invoice"
{
    layout
    { 
        modify("Order No.")
        {
            trigger OnDrillDown()
            var
                PurchHeadArchive: Record "Purchase Header Archive";
            begin
                PurchHeadArchive.Reset();
                PurchHeadArchive.SetRange("Document Type", PurchHeadArchive."Document Type"::Order);
                PurchHeadArchive.SetRange("No.", Rec."Order No.");

                if PurchHeadArchive.FindLast() then begin
                    Page.Run(Page::"Purchase Order Archive", PurchHeadArchive);
                end
            end;
        }
        addafter(Corrective)
        {
            field("Ordered By"; Rec."Ordered By")
            {
                ApplicationArea = all;
            }
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = all;
            }
            field("Work Order No"; Rec."Work Order No")
            {
                ApplicationArea = all;
            }
        }
    }
    
}