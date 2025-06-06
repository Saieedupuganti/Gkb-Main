codeunit 50130 "Create Order helper"
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
        index: Integer;   // Added newly
        PurchaseHeaderNo: Code[20];
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowManagement: Codeunit "Workflow Management";
        PurhaseHeaderNoList: list of [Code[20]];
        Part: Code[20];
        MessageText: Text;
    begin
        Clear(PurhaseHeaderNoList);
        RequisitionLine.Reset();
        RequisitionLine.SetCurrentKey("Vendor No.", "Location Code", "Shortcut Dimension 1 Code");
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

            // Process approvals
            foreach Part in PurhaseHeaderNoList do begin
                PurchaseOrderHdr1.Reset();
                PurchaseOrderHdr1.SetRange("Document Type", PurchaseOrderHdr1."Document Type"::Order);
                PurchaseOrderHdr1.SetRange("No.", Part);
                if PurchaseOrderHdr1.FindFirst() then begin
                    if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseOrderHdr1) then
                        ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseOrderHdr1);
                end;
            end;

            if PurhaseHeaderNoList.Count > 0 then begin
                MessageText := 'Purchase Order(s) created with No.: ';
                Index := 1;
                foreach Part in PurhaseHeaderNoList do begin
                    if StrLen(MessageText) > 100 then begin
                        MessageText += '...';
                        break;
                    end;

                    MessageText += Part;
                    if Index < PurhaseHeaderNoList.Count then
                        MessageText += ', ';
                    Index += 1;
                end;
                Message(MessageText);
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
        if IMpurchReqline.Quantity = 0 then
            Error('Cannot create a Purchase Order Line with Quantity = 0 for item %1.', IMpurchReqline."No.");

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
        PurchLine.Validate("Expected Receipt Date", IMpurchReqline."Due Date");
        PurchLine.Validate("Ordered By", IMpurchReqline."Requested By Name");
        PurchLine.Validate("expected Receipt Date", IMpurchReqline."Due Date");
        PurchLine.Modify(true);
    end;

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

// codeunit 50130 "Create Order helper"
// {
//     trigger OnRun()
//     begin
//         CreatePurchpurchaseorder();
//     end;

//     procedure CreatePurchpurchaseorder()
//     var
//         vendorNo: Code[20];
//         PurchaseOrderHdr: Record "Purchase Header";
//         PurchaseOrderHdr1: Record "Purchase Header";
//         NextLine: Integer;
//         RequisitionLine: Record "Requisition Line";
//         LocationCode: Code[10];
//         DimensionCode: Code[20];
//         Count: Integer;
//         Index: Integer;
//         PurchaseHeaderNo: Code[20];
//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//         PurhaseHeaderNoList: list of [Code[20]];
//         Part: Code[20];
//         MessageText: Text;
//     begin
//         Clear(PurhaseHeaderNoList);
//         RequisitionLine.Reset();
//         RequisitionLine.SetCurrentKey("Vendor No.", "Location Code", "Shortcut Dimension 1 Code");
//         RequisitionLine.SetRange("Accept Action Message", true);

//         if RequisitionLine.FindSet() then begin
//             repeat
//                 if (RequisitionLine."Vendor No." <> vendorNo) or
//                    (RequisitionLine."Location Code" <> LocationCode) or
//                    (RequisitionLine."Shortcut Dimension 1 Code" <> DimensionCode) then begin
//                     PurchaseHeaderNo := CreatePurchaseHeader(RequisitionLine, PurchaseOrderHdr);
//                     vendorNo := RequisitionLine."Vendor No.";
//                     LocationCode := RequisitionLine."Location Code";
//                     DimensionCode := RequisitionLine."Shortcut Dimension 1 Code";
//                     NextLine := 0;
//                     Count += 1;
//                     PurhaseHeaderNoList.Add(PurchaseHeaderNo);
//                 end;

//                 NextLine += 10000;
//                 CreatePurchaseLine(PurchaseHeaderNo, RequisitionLine);
//                 RequisitionLine.Delete();
//             until RequisitionLine.Next() = 0;

//             // Process approvals
//             foreach Part in PurhaseHeaderNoList do begin
//                 PurchaseOrderHdr1.Reset();
//                 PurchaseOrderHdr1.SetRange("Document Type", PurchaseOrderHdr1."Document Type"::Order);
//                 PurchaseOrderHdr1.SetRange("No.", Part);
//                 if PurchaseOrderHdr1.FindFirst() then begin
//                     if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseOrderHdr1) then
//                         ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseOrderHdr1);
//                 end;
//             end;

//             if PurhaseHeaderNoList.Count > 0 then begin
//                 MessageText := 'Purchase Order(s) created with No.: ';
//                 Index := 1;
//                 foreach Part in PurhaseHeaderNoList do begin
//                     if StrLen(MessageText) > 100 then begin
//                         MessageText += '...';
//                         break;
//                     end;

//                     MessageText += Part;
//                     if Index < PurhaseHeaderNoList.Count then
//                         MessageText += ', ';
//                     Index += 1;
//                 end;
//                 Message(MessageText);
//             end;
//         end;
//     end;

//     local procedure CreatePurchaseHeader(IMpurchReqline: Record "Requisition Line"; var PurchaseHDR: Record "Purchase Header"): Code[20]
//     var
//         PurchaseReceivableSetup_LRec: Record "Purchases & Payables Setup";
//     begin
//         PurchaseReceivableSetup_LRec.Get();
//         PurchaseHDR.Init();
//         PurchaseHDR."No." := NoSeriesManagment.GetNextNo(PurchaseReceivableSetup_LRec."Order Nos.", Today, true);
//         PurchaseHDR.Validate("Document Type", PurchaseHDR."Document Type"::Order);
//         PurchaseHDR.Validate("Buy-from Vendor No.", IMpurchReqline."Vendor No.");
//         PurchaseHDR.Insert(true);
//         PurchaseHDR.Validate(Status, PurchaseHDR.Status::Open);
//         PurchaseHDR.Validate("Location Code", IMpurchReqline."Location Code");
//         PurchaseHDR.Validate("Shortcut Dimension 1 Code", IMpurchReqline."Shortcut Dimension 1 Code");

//         if PurchaseHDR.Modify(true) then
//             exit(PurchaseHDR."No.");
//     end;

//     local procedure CreatePurchaseLine(PurchaseHeaderNo: Code[20]; IMpurchReqline: Record "Requisition Line")
//     var
//         PurchLine: Record "Purchase Line";
//         Lineno: Integer;
//         PurchaseLine: Record "Purchase Line";
//     begin
//         if IMpurchReqline.Quantity = 0 then
//             Error('Cannot create a Purchase Order Line with Quantity = 0 for item %1.', IMpurchReqline."No.");

//         PurchaseLine.Reset();
//         PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
//         PurchaseLine.SetRange("Document No.", PurchaseHeaderNo);
//         if PurchaseLine.FindLast() then
//             Lineno := PurchaseLine."Line No." + 10000
//         else
//             Lineno := 10000;

//         PurchLine.Init();
//         PurchLine."Document Type" := PurchLine."Document Type"::Order;
//         PurchLine."Document No." := PurchaseHeaderNo;
//         PurchLine."Line No." := Lineno;
//         PurchLine.Insert(true);
//         PurchLine.Validate("Buy-from Vendor No.", IMpurchReqline."Vendor No.");
//         PurchLine.Type := IMpurchReqline.Type;
//         PurchLine.Validate("No.", IMpurchReqline."No.");
//         PurchLine.Validate("Job No.", IMpurchReqline.projectNo);
//         PurchLine.Validate("Job Task No.", IMpurchReqline."Project Task No");
//         PurchLine.Validate("Location Code", IMpurchReqline."Location Code");
//         PurchLine.Validate("Shortcut Dimension 1 Code", IMpurchReqline."Shortcut Dimension 1 Code");
//         PurchLine.Validate(Quantity, IMpurchReqline.Quantity);
//         PurchLine.Validate("Direct Unit Cost", IMpurchReqline."Direct Unit Cost");
//         PurchLine.Validate("Expected Receipt Date", IMpurchReqline."Due Date");
//         PurchLine.Validate("Ordered By", IMpurchReqline."Requested By Name");
//         PurchLine.Modify(true);

//         // Copy Attachment
//         CopyAttachmentsFromRequisitionToPurchaseLine(IMpurchReqline, PurchLine);
//     end;

//     local procedure CopyAttachmentsFromRequisitionToPurchaseLine(ReqLine: Record "Requisition Line"; PurchLine: Record "Purchase Line")
//     var
//         SourceAttachment: Record "Document Attachment";
//         NewAttachment: Record "Document Attachment";
//         TenantMedia: Record "Tenant Media";
//         MediaId: Guid;
//         EmptyGuid: Guid;
//     begin
//         SourceAttachment.Reset();
//         SourceAttachment.SetRange("Table ID", DATABASE::"Requisition Line");
//         SourceAttachment.SetRange("No.", Format(ReqLine."Line No."));

//         if SourceAttachment.FindSet() then begin
//             repeat
//                 MediaId := SourceAttachment.Attachment; // This is a GUID

//                 // Validate that the media exists
//                 if MediaId = EmptyGuid then
//                     exit; // Using exit instead of continue

//                 if not TenantMedia.Get(MediaId) then
//                     exit; // Using exit instead of continue

//                 // Create new Document Attachment linked to Purchase Line
//                 NewAttachment.Init();
//                 NewAttachment."Table ID" := DATABASE::"Purchase Line";
//                 NewAttachment."No." := PurchLine."Document No.";
//                 NewAttachment."Line No." := PurchLine."Line No.";
//                 NewAttachment."File Name" := SourceAttachment."File Name";
//                 NewAttachment."File Extension" := SourceAttachment."File Extension";
//                 NewAttachment."File Type" := SourceAttachment."File Type";
//                 NewAttachment.Attachment := MediaId; // Link the same media
//                 NewAttachment.Insert(true);
//             until SourceAttachment.Next() = 0;
//         end;
//     end;

//     local procedure HasField(RecVariant: Variant; FieldName: Text): Boolean
//     var
//         RecRef: RecordRef;
//         FldRef: FieldRef;
//     begin
//         if RecVariant.IsRecord then begin
//             RecRef.GetTable(RecVariant);
//             exit(FindFieldByName(RecRef, FieldName));
//         end;
//         exit(false);
//     end;

//     local procedure FindFieldByName(RecRef: RecordRef; FieldName: Text): Boolean
//     var
//         FldRef: FieldRef;
//         i: Integer;
//     begin
//         for i := 1 to RecRef.FieldCount do begin
//             FldRef := RecRef.FieldIndex(i);
//             if FldRef.Name = FieldName then
//                 exit(true);
//         end;
//         exit(false);
//     end;

//     local procedure CopyFieldValue(FromRec: Variant; var ToRec: Variant; FieldName: Text)
//     var
//         FromRecRef: RecordRef;
//         ToRecRef: RecordRef;
//         FromFldRef: FieldRef;
//         ToFldRef: FieldRef;
//         i: Integer;
//         j: Integer;
//     begin
//         if not (FromRec.IsRecord and ToRec.IsRecord) then
//             exit;

//         FromRecRef.GetTable(FromRec);
//         ToRecRef.GetTable(ToRec);

//         for i := 1 to FromRecRef.FieldCount do begin
//             FromFldRef := FromRecRef.FieldIndex(i);
//             if FromFldRef.Name = FieldName then begin
//                 for j := 1 to ToRecRef.FieldCount do begin
//                     ToFldRef := ToRecRef.FieldIndex(j);
//                     if ToFldRef.Name = FieldName then begin
//                         ToFldRef.Value := FromFldRef.Value;
//                         ToRecRef.Modify();
//                         ToRecRef.SetTable(ToRec);
//                         exit;
//                     end;
//                 end;
//             end;
//         end;
//     end;

//     procedure GetPercentageValue(PriceListHeader: Record "Price List Header"; Item_lRec: Record Item): Decimal
//     var
//         PercentageValue: Decimal;
//         UnitPrice: Decimal;
//     begin
//         Clear(PercentageValue);
//         Clear(UnitPrice);
//         if PriceListHeader."D01 Percentage" <> 0 then
//             UnitPrice := Item_lRec."Unit Price" + (Item_lRec."Unit Price" * PriceListHeader."D01 Percentage") / 100
//         else
//             UnitPrice := Item_lRec."Unit Price";
//         exit(UnitPrice);
//     end;

//     var
//         NoSeriesManagment: Codeunit "No. Series";
// }

// tableextension 60100 DocumentAttachmentExt extends "Document Attachment"
// {
//     fields
//     {
//         field(50100; "Attachment"; Guid)
//         {
//             Caption = 'Attachment GUID';
//         }
//     }
// }