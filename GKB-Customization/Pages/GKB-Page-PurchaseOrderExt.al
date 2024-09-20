pageextension 50156 "Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        modify("VAT Bus. Posting Group")
        {
            Caption = 'GST Bus. Posting Group';
        }
        modify("VAT Reporting Date")
        {
            Caption = 'GST Reporting Date';
        }
        modify("Prices Including VAT")
        {
            Caption = 'Prices Including GST';
        }
    }

    // actions
    // {
    //     addafter(Warehouse)
    //     {
    //         action("Archive And Post")
    //         {
    //             Caption = 'Archive And Post';

    //             trigger OnAction()
    //             begin
    //                 am.ArchivePurchDocument(Rec);
    //                 CurrPage.Update(false);
    //                 PostDocument(CODEUNIT::"Purch.-Post (Yes/No)", Enum::"Navigate After Posting"::"Posted Document");
    //             end;
    //         }
    //     }
    // }


    // var
    //     //pd: Codeunit 
    //     am: Codeunit ArchiveManagement;
    //     ph: Page "Purchase Order";
    //     DocumentIsPosted: Boolean;
    //     //OpenPostedPurchaseOrderQst: Boolean;
    //     OpenPostedPurchaseOrderQst: Label 'The order is posted as number %1 and moved to the Posted Purchase Invoices window.\\Do you want to open the posted invoice?', Comment = '%1 = posted document number';

    // local procedure PostDocument(PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting")
    // var
    //     PurchaseHeader: Record "Purchase Header";
    //     InstructionMgt: Codeunit "Instruction Mgt.";
    //     LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
    //     IsScheduledPosting: Boolean;
    //     IsHandled: Boolean;
    // begin
    //     LinesInstructionMgt.PurchaseCheckAllLinesHaveQuantityAssigned(Rec);

    //     Rec.SendToPosting(PostingCodeunitID);

    //     IsScheduledPosting := Rec."Job Queue Status" = Rec."Job Queue Status"::"Scheduled for Posting";
    //     //  DocumentIsPosted := (not PurchaseHeader.Get(Rec."Document Type", Rec."No.")) or IsScheduledPosting;

    //     if IsScheduledPosting then
    //         CurrPage.Close();
    //     CurrPage.Update(false);

    //     IsHandled := false;
    //     OnPostDocumentBeforeNavigateAfterPosting1(Rec, PostingCodeunitID, Navigate, DocumentIsPosted, IsHandled);
    //     if IsHandled then
    //         exit;

    //     if PostingCodeunitID <> CODEUNIT::"Purch.-Post (Yes/No)" then
    //         exit;

    //     case Navigate of
    //         Enum::"Navigate After Posting"::"Posted Document":
    //             begin
    //                 if InstructionMgt.IsEnabled(InstructionMgt.ShowPostedConfirmationMessageCode()) then
    //                     ShowPostedConfirmationMessage();

    //                 if IsScheduledPosting or DocumentIsPosted then
    //                     CurrPage.Close();
    //             end;
    //         Enum::"Navigate After Posting"::"New Document":
    //             if DocumentIsPosted then begin
    //                 Clear(PurchaseHeader);
    //                 PurchaseHeader.Init();
    //                 PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::Order);
    //                 OnPostDocumentOnBeforePurchaseHeaderInsert1(PurchaseHeader);
    //                 PurchaseHeader.Insert(true);
    //                 PAGE.Run(PAGE::"Purchase Order", PurchaseHeader);
    //             end;
    //     end;
    // end;

    // [IntegrationEvent(true, false)]
    // local procedure OnPostDocumentBeforeNavigateAfterPosting1(var PurchaseHeader: Record "Purchase Header"; var PostingCodeunitID: Integer; var Navigate: Enum "Navigate After Posting"; DocumentIsPosted: Boolean; var IsHandled: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnPostDocumentOnBeforePurchaseHeaderInsert1(var PurchaseHeader: Record "Purchase Header")
    // begin
    // end;

    // local procedure ShowPostedConfirmationMessage()
    // var
    //     OrderPurchaseHeader: Record "Purchase Header";
    //     PurchInvHeader: Record "Purch. Inv. Header";
    //     InstructionMgt: Codeunit "Instruction Mgt.";
    //     ICFeedback: Codeunit "IC Feedback";
    // begin
    //     if not OrderPurchaseHeader.Get(Rec."Document Type", Rec."No.") then begin
    //         PurchInvHeader.SetRange("No.", Rec."Last Posting No.");
    //         if PurchInvHeader.FindFirst() then begin
    //             ICFeedback.ShowIntercompanyMessage(Rec, Enum::"IC Transaction Document Type"::Order);
    //             if InstructionMgt.ShowConfirm(StrSubstNo(OpenPostedPurchaseOrderQst, PurchInvHeader."No."),
    //                  InstructionMgt.ShowPostedConfirmationMessageCode())
    //             then
    //                 InstructionMgt.ShowPostedDocument(PurchInvHeader, Page::"Purchase Order");
    //         end;
    //     end;
    // end;
}