codeunit 50127 "Create PO From Req"
{
    Subtype = Normal;

    procedure CreatePOFromReq(Rec: Record "Requisition Line")

    var
        ReqLine: Record "Requisition Line";
        PurchaseHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        NewPurchNo: Code[20];
    begin

        ReqLine.Reset();
        ReqLine.SetRange("Vendor No.", Rec."Vendor No.");
        ReqLine.SetRange("Shortcut Dimension 1 Code", Rec."Shortcut Dimension 1 Code");
        ReqLine.SetRange("PO Created", false);
        if ReqLine.FindSet() then begin
            PurchaseHeader.Init();
            PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Order;
            PurchaseHeader.Insert(true);
            PurchaseHeader.Validate("Buy-from Vendor No.", ReqLine."Vendor No.");
            PurchaseHeader.Validate("Gen. Bus. Posting Group", ReqLine."Gen. Business Posting Group");
            //PurchaseHeader."Shortcut Dimension 1 Code" := ReqLine."Shortcut Dimension 1 Code";
            PurchaseHeader.Validate("Location Code", ReqLine."Location Code");
            PurchaseHeader.Modify();
            NewPurchNo := PurchaseHeader."No.";
        end;

        repeat
            PurchLine.Init();
            PurchLine."Document Type" := PurchLine."Document Type"::Order;
            PurchLine."Document No." := NewPurchNo;
            PurchLine.Type := PurchLine.Type::Item;
            PurchLine."Line No." := GetNextPurchLineNo(PurchaseHeader);
            PurchLine.Validate("No.", ReqLine."No."); // Item No.
            PurchLine.Validate(Quantity, ReqLine.Quantity);
            PurchLine.Validate("Unit of Measure Code", ReqLine."Unit of Measure Code");
            PurchLine.Validate("Direct Unit Cost", ReqLine."Direct Unit Cost");
            PurchLine.Validate("Shortcut Dimension 1 Code", ReqLine."Shortcut Dimension 1 Code");

            if PurchLine."Shortcut Dimension 1 Code" <> '' then
                PurchaseHeader.Validate("Shortcut Dimension 1 Code", ReqLine."Shortcut Dimension 1 Code");
            PurchLine.Insert(true);

            ReqLine."PO Created" := true;
            ReqLine.Modify();

            ReqLine.Delete();

            Commit();
        until ReqLine.Next() = 0;

        if Dialog.Confirm('Purchase Order Created. Do you want to open the Purchase Order?', true, NewPurchNo) then begin
            PurchaseHeader.Reset();
            PurchaseHeader.SetRange("No.", NewPurchNo);
            if PurchaseHeader.FindFirst() then
                Page.RunModal(Page::"Purchase Order", PurchaseHeader);
        end;
    end;

    local procedure GetNextPurchLineNo(var PurchHeader: Record "Purchase Header"): Integer
    var
        PurchLine: Record "Purchase Line";
    begin
        PurchLine.SetRange("Document Type", PurchHeader."Document Type"::Order);
        PurchLine.SetRange("Document No.", PurchHeader."No.");
        if PurchLine.FindLast() then
            exit(PurchLine."Line No." + 10000)
        else
            exit(10000);
    end;
}
