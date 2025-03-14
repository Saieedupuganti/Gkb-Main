codeunit 50124 "Event Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Create-Invoice", OnCreateSalesInvoiceLinesOnBeforeCreateSalesLine, '', false, false)]
    local procedure "Job Create-Invoice_OnCreateSalesInvoiceLinesOnBeforeCreateSalesLine"(var JobPlanningLine: Record "Job Planning Line"; SalesHeader: Record "Sales Header"; SalesHeader2: Record "Sales Header"; NewInvoice: Boolean; var NoOfSalesLinesCreated: Integer)
    var
        job: Record Job;
    begin
        SalesHeader."Job No." := JobPlanningLine."Job No.";
        SalesHeader."Job Task No" := JobPlanningLine."Job Task No.";
        job.Reset();
        job.SetRange("No.", JobPlanningLine."Job No.");
        if job.FindFirst() then begin
            SalesHeader."Customer PO Number" := job."Customer PO Number";
            SalesHeader."Sales Order No." := job."Sales Order";
            SalesHeader.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Create-Invoice", OnBeforeShowMessageLinesTransferred, '', false, false)]
    local procedure OnBeforeShowMessageLinesTransferred(var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Create-Invoice", OnAfterCreateSalesInvoiceLines, '', false, false)]
    local procedure "OnAfterCreateSalesInvoiceLines"(NewInvoice: Boolean; SalesHeader: Record "Sales Header")
    var
        Text000: Label 'The lines were successfully transferred to an invoice. Do you wan to open Invoice %1?';
        SalesHeader2: Record "Sales Header";
        salesinvoice: Page "Sales Invoice";
        answer: Decimal;
        no: text;
    begin
        SalesHeader2.Reset();
        SalesHeader2.SetRange("No.", SalesHeader."No.");
        if SalesHeader2.FindFirst() then begin
            no := SalesHeader2."No.";
            if Confirm(Text000, true, no) then begin
                salesinvoice.SetTableView(SalesHeader2);
                salesinvoice.SetRecord(SalesHeader2);
                salesinvoice.Run();
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales line", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertJobPlanningLine(var Rec: Record "Sales Line")
    var
        Item: Record Item;
    begin
        if (Rec.Type = Rec.Type::Item) and (Rec."No." <> '') and (Rec."Gen. Prod. Posting Group" = '') and (Rec."Unit of Measure" <> '') then begin
            if Item.Get(Rec."No.") then begin
                Rec."Gen. Prod. Posting Group" := Item."Gen. Prod. Posting Group";
                Rec."Unit of Measure":= Item."Base Unit of Measure";
               // Rec.Validate(Quantity,Rec."");
                Rec.Modify();
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterInsertInvoiceHeader', '', false, false)]
    local procedure OnAfterInsertSalesInvHeader(var SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header")
    begin
        SalesInvHeader."Customer PO Number" := SalesHeader."Customer PO Number";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Job Planning Line", OnBeforeInsertEvent, '', false, false)]
    local procedure OnBeforeCreateSalesInvoice1(var rec: Record "Job Planning Line")
    var
        Item: Record Item;
    begin
        if (Rec.Type = Rec.Type::Item) and (Rec."No." <> '') then begin
            if Item.Get(Rec."No.") then begin
                Rec."Unit of Measure Code" := Item."Base Unit of Measure";
                Rec."Gen. Prod. Posting Group" := Item."Gen. Prod. Posting Group";
            end;
        end;
    end;

}

