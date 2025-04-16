codeunit 50130 "Create Order helper"              // Jathin's Code.
{
    trigger OnRun()
    var
    begin
        CreatePurchpurchaseorder();
    end;

    procedure CreatePurchpurchaseorder()
    var
        vendorNo: Code[20];
        PurchaseOrderHdr: Record "Purchase Header";
        PurchaseOrderHdr1: Record "Purchase Header";
        NextLine: Integer;
        RequisitionLine: Record "Requisition Line";
        RequisitionLine1: Record "Requisition Line";
        RequisitionLine2: Record "Requisition Line";
        LocationCode: Code[10];
        DimensionCode: Code[20];
        Count: Integer;
        PurchaseHeaderNo: Code[20];
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowManagement: Codeunit "Workflow Management";
        PurhaseHeaderNoList: list of [Code[20]];
        Part: Code[20];
    begin
        // Clear(PurchaseOrderHdr);
        Clear(PurhaseHeaderNoList);
        RequisitionLine.Reset();
        RequisitionLine.SetCurrentKey("Vendor No.", "Location Code", "Shortcut Dimension 1 Code"); //20000
        // RequisitionLine.SetRange("Worksheet Template Name", RequisitionLineRec."Worksheet Template Name");
        // RequisitionLine.SetRange("Journal Batch Name", RequisitionLineRec."Journal Batch Name");
        RequisitionLine.SetRange("Accept Action Message", true);
        if RequisitionLine.FindSet() then begin
            repeat
                if (RequisitionLine."Vendor No." <> vendorNo) or (RequisitionLine."Location Code" <> LocationCode) or (RequisitionLine."Shortcut Dimension 1 Code" <> DimensionCode) then begin
                    PurchaseHeaderNo := CreatePurchaseHeader(RequisitionLine, PurchaseOrderHdr);
                    vendorNo := RequisitionLine."Vendor No.";
                    LocationCode := RequisitionLine."Location Code";
                    DimensionCode := RequisitionLine."Shortcut Dimension 1 Code";
                    NextLine := 0;
                    Count += 1;
                    PurhaseHeaderNoList.Add(PurchaseHeaderNo);
                end;
                NextLine += 10000;
                CreatePurchaseLine(PurchaseHeaderNo, RequisitionLine);
                RequisitionLine.Delete();
            until RequisitionLine.Next() = 0;
            foreach Part in PurhaseHeaderNoList do begin
                PurchaseOrderHdr1.Reset();
                PurchaseOrderHdr1.SetRange("Document Type", PurchaseOrderHdr1."Document Type"::Order);
                PurchaseOrderHdr1.SetRange("No.", Part);
                if PurchaseOrderHdr1.FindFirst() then begin
                    if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseOrderHdr1) then //DCS::Ik Code Added for the Send Approval
                        ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseOrderHdr1);
                end;
            end;
        end;
    end;

    local procedure CreatePurchaseHeader(IMpurchReqline: Record "Requisition Line"; PurchaseHDR: Record "Purchase Header"): Code[20]
    var
        PurchaseReceivableSetup_LRec: Record "Purchases & Payables Setup";
    begin
        PurchaseReceivableSetup_LRec.Get();
        PurchaseHDR.Init();
        PurchaseHDR."No." := NoSeriesManagment.GetNextNo(PurchaseReceivableSetup_LRec."Order Nos.", Today, true);
        PurchaseHDR.Validate("Document Type", PurchaseHDR."Document Type"::Order);
        PurchaseHDR.Validate("Buy-from Vendor No.", IMpurchReqline."Vendor No.");
        PurchaseHDR.Insert(true);
        PurchaseHDR.Validate(Status, PurchaseHDR.Status::Open);
        PurchaseHDR.Validate("Location Code", IMpurchReqline."Location Code");
        PurchaseHDR.Validate("Shortcut Dimension 1 Code", IMpurchReqline."Shortcut Dimension 1 Code");
        PurchaseHDR.Validate("Ordered By", IMpurchReqline."Requested By Name");
        PurchaseHDR.Validate("Due Date", IMpurchReqline."Due Date");

        if PurchaseHDR.Modify(true) then begin
            exit(PurchaseHDR."No.");
        end;
    end;

    local procedure CreatePurchaseLine(PurchaseHeaderNo: Code[20]; IMpurchReqline: Record "Requisition Line")
    var
        PurchLine: Record "Purchase Line";
        Lineno: Integer;
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.Reset();
        PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
        PurchaseLine.SetRange("Document No.", PurchaseHeaderNo);
        if PurchaseLine.FindLast() then
            Lineno := PurchaseLine."Line No." + 10000
        else
            Lineno := 10000;
        PurchLine.Init();
        PurchLine."Document Type" := PurchLine."Document Type"::Order;
        PurchLine."Document No." := PurchaseHeaderNo;
        PurchLine."Line No." := Lineno;
        PurchLine.Insert(true);
        PurchLine.Validate("Buy-from Vendor No.", IMpurchReqline."Vendor No.");
        PurchLine.type := IMpurchReqline.Type;
        PurchLine.Validate("No.", IMpurchReqline."No.");
        PurchLine.Validate("Job No.", IMpurchReqline.projectNo);
        PurchLine.Validate("Job Task No.", IMpurchReqline."Project Task No");
        PurchLine.Validate("Location Code", IMpurchReqline."Location Code");
        PurchLine.Validate("Shortcut Dimension 1 Code", IMpurchReqline."Shortcut Dimension 1 Code");
        PurchLine.Validate(Quantity, IMpurchReqline.Quantity);
        PurchLine.Validate("Direct Unit Cost", IMpurchReqline."Direct Unit Cost");
        PurchLine.Modify(true);
    end;
    //Calculate the unit Price based on the percentage and Add it into Price list Line
    procedure GetPercentageValue(PriceListHeader: Record "Price List Header"; Item_lRec: Record Item): Decimal
    var
        PercentageValue: Decimal;
        UnitPrice: Decimal;
    begin
        Clear(PercentageValue);
        Clear(UnitPrice);
        if PriceListHeader."D01 Percentage" <> 0 then begin
            PercentageValue := (Item_lRec."Unit Price" * PriceListHeader."D01 Percentage") / 100;
            UnitPrice := Item_lRec."Unit Price" + PercentageValue;
        end
        else
            UnitPrice := Item_lRec."Unit Price";
        exit(UnitPrice);
    end;

    var
        NoSeriesManagment: Codeunit "No. Series";
}