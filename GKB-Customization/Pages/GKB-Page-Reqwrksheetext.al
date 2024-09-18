namespace Proejct.Proejct;

using Microsoft.Inventory.Requisition;
using System.Automation;
using System.Security.User;
using Microsoft.Purchases.Document;
using Microsoft.Inventory.Item;


pageextension 50100 "Req WO" extends "Req. Worksheet"
{
    layout
    {
        modify("Location Code")
        {
            Caption = 'Warehouse';  // Changing the location code to warehouse in req. worksheet.
        }

        addafter(Control1903326807)
        {
            part(ItemAvailability; "Req WO FactBox")
            {
                ApplicationArea = Planning;
                SubPageLink = "Worksheet Template Name" = field("Worksheet Template Name"), "Journal Batch Name" = field("Journal Batch Name"), "Line No." = field("Line No.");
                Visible = true;
            }
        }

    }

    actions
    {
        modify(CarryOutActionMessage)
        {
            Caption = 'Create Purchase Order';

        }
        addfirst(processing)
        {
            action(CreatePoAndSendApproval)
            {
                ApplicationArea = all;
                Caption = 'Create Po And Send Approval';
                Promoted = true;
                PromotedCategory = Process;
                AccessByPermission = tabledata 454 = rim;


                trigger OnAction()
                var
                    Ph: Record "Purchase Header";
                begin
                    CreatePo2(Ph);
                    SendApprovals(Ph)
                end;
            }
        }
    }
    var
        Approval: Codeunit "Approvals Mgmt.";
        CreatePuro: Codeunit "Carry Out Action";
        WorkflowMgmt: Record "Workflow Step Instance";
        Userset: Record "User Setup";
    // Here The Code for Creating Purchase Order.
    // local procedure CreatePO()
    // var
    //     CarryOutActionMsgReq: Report "Carry Out Action Msg. - Req.";
    //     IsHandled: Boolean;

    // begin
    //     IsHandled := false;
    //     OnBeforeCarryOutActionMsg1(Rec, IsHandled);
    //     if IsHandled then
    //         exit;

    //     CarryOutActionMsgReq.SetReqWkshLine(Rec);
    //     CarryOutActionMsgReq.RunModal();
    //     CarryOutActionMsgReq.GetReqWkshLine(Rec);
    //     PurchHeader."Purchaser Code":= Rec."Vendor No.";


    //     Message('Carryout Purchase Order Created Successfully.');
    // end;

    // [BusinessEvent(false)]
    // local procedure OnBeforeCarryOutActionMsg1(Rec: Record "Requisition Line"; var IsHandled: Boolean)
    // begin

    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnAfterLookupCurrentJnlBatchName1(var RequisitionLine: Record "Requisition Line"; var CurrJnlBatchName: Code[10])
    // begin
    // end;
    local procedure CreatePo2(var PH: Record "Purchase Header")
    var
        PL: Record "Purchase Line";
        Item: Record Item;
        LineNo: Integer;
    begin
        PH.Reset();
        PH.Init();
        //PH.InitFromVendor();
        PH."Document Type" := PH."Document Type"::Order;
        PH."No." := '';
        PH.Insert(true);

        if Rec."Vendor No." = '' then begin
            Item.Get(Rec."No.");
            PH.Validate("Buy-from Vendor No.", Item."Vendor No.");
        end else
            PH.Validate("Buy-from Vendor No.", Rec."Vendor No.");
        if Rec."Location Code" <> '' then
            PH.Validate("Location Code", Rec."Location Code");
        PH.Modify();

        Message('PH: %1 \ Vendor: %2, %3', PH."No.", PH."Buy-from Vendor No.", PH."Buy-from Vendor Name");

        if Rec.FindSet() then
            repeat
                PL.Init();
                PL."Document Type" := PL."Document Type"::Order;
                PL."Document No." := PH."No.";
                LineNo += 10000;
                PL."Line No." := LineNo;
                PL.Insert(true);

                PL.Validate("Type", PL.Type::Item);
                PL.Validate("No.", Rec."No.");
                PL.Validate(Quantity, Rec.Quantity);
                PL.Validate("Variant Code", Rec."Variant Code");
                PL.Validate("Unit of Measure Code", Rec."Unit of Measure Code");
                PL.Modify(true);
                Message('PL: %1, %2, %3, %4 \ PH: %5, %6', PL."Document Type", PL."Document No.", PL."Line No.", PL."No.", PH."Document Type", PH."No.");
            until Rec.Next() = 0;
    end;

    // Here the Code for Approvals
    // local procedure SendApprovals(var PH: Record "Purchase Header")
    // var
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    // begin
    //     if ApprovalsMgmt.CheckPurchaseApprovalPossible(PH) then
    //         ApprovalsMgmt.OnSendPurchaseDocForApproval(PH);
    // end;

    //     procedure SendApprovals(PurchaseHeader: Record "Purchase Header")
    // var
    //     WorkflowManagement: Codeunit "Workflow Management";
    //     WorkflowStepInstance: Record  "Workflow Step Instance";
    // begin
    //     // Check if the workflow is enabled for Purchase Orders
    //     if WorkflowManagement.WorkflowExists(PurchaseHeader, DATABASE::"Purchase Header") then begin
    //         // Create a new workflow step instance
    //         WorkflowStepInstance.Init();
    //         WorkflowStepInstance."table id" := DATABASE::"Purchase Header";
    //         WorkflowStepInstance."Record ID" := PurchaseHeader.RecordId;
    //         WorkflowStepInstance.Insert(true);

    //         // Start the approval workflow
    //         WorkflowManagement.CanExecuteWorkflow(WorkflowStepInstance);
    //     end else begin
    //         Error('No approval workflow for this record type is enabled.');
    //     end;
    // end;
    local procedure SendApprovals(var PH: Record "Purchase Header")
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.Init();
        ApprovalEntry."Table ID" := DATABASE::"Purchase Header";
        ApprovalEntry."Document Type" := ApprovalEntry."Document Type"::Order;
        ApprovalEntry."Document No." := ph."No.";
        ApprovalEntry.Insert(true);

        Message('Approval Sent Successfully');
    end;
}