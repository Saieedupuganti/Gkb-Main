codeunit 50103 "AutomateInvoiceFrmBSO"
{
    Subtype = Normal;
    Access = Public;
    // Job que related Code Start
    trigger OnRun()
    var
        SalesHeaderBOS: Record "Sales Header";
        SingalRecord: Boolean;
        PostingDate: Date;

    begin
        PostingDate := CalcDate('3D', Today);
        SalesHeaderBOS.Reset();
        SalesHeaderBOS.SetRange("Document Type", SalesHeaderBOS."Document Type"::"Blanket Order");
        SalesHeaderBOS.SetRange("Posting Date", PostingDate);
        SalesHeaderBOS.SetRange("Invoice Created", false);
        if SalesHeaderBOS.FindSet() then
            repeat
                SingalRecord := false;
                CreateSalesInvFromBOS(SalesHeaderBOS, SingalRecord)
            until SalesHeaderBOS.Next() = 0;
    end;
    // Job que related Code End


    // CreateInvformBOS Code Start
    procedure CreateSalesInvFromBOS(var SalesHeader: Record "Sales Header"; SingalRecord: Boolean)
    var
        PostingDate: Date;
    begin
        if not ISAnyErrorValidation(SalesHeader, SingalRecord) then begin
            Clear(PostingDate);
            PostingDate := CalcDate('3D', Today);
            SalesHeader.Reset();
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Blanket Order");
            SalesHeader.SetRange("Posting Date", PostingDate);
            SalesHeader.SetRange("Invoice Created", false);
            if SalesHeader.FindSet() then
                repeat
                    CreateInvoiceFromBlnktOrderBsdOnPstngDt(SalesHeader, SingalRecord);
                until SalesHeader.Next() = 0;
        end;
    end;

    local procedure CreateInvoiceFromBlnktOrderBsdOnPstngDt(Var SalesHeaderBSO: Record "Sales Header"; SingalRecord: Boolean)
    var
        SalesLineBSO: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LineNo: Integer;
    begin
        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader.Validate("Sell-to Customer No.", SalesHeaderBSO."Sell-to Customer No.");
        SalesHeader."Order Date" := Today;
        SalesHeader."Posting Date" := SalesHeaderBSO."Posting Date";
        SalesHeader."Document Date" := Today;
        SalesHeader.Insert(true);
        Commit();
        SalesLineBSO.Reset();
        SalesLineBSO.SetRange("Document Type", SalesLineBSO."Document Type"::"Blanket Order");
        SalesLineBSO.SetRange("Document No.", SalesHeaderBSO."No.");
        SalesLineBSO.SetFilter(Quantity, '>%1', 0);
        if SalesLineBSO.FindSet() then begin
            repeat
                SalesLine.Init();
                SalesLine."Document Type" := SalesLine."Document Type"::Invoice;
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine.Validate("Sell-to Customer No.", SalesHeaderBSO."Sell-to Customer No.");
                SalesLine.Validate("Line No.", SalesLineBSO."Line No.");
                SalesLine.Validate(Type, SalesLineBSO.Type);
                SalesLine.Validate("No.", SalesLineBSO."No.");
                SalesLine.Validate(Quantity, SalesLineBSO.Quantity);
                SalesLine.Validate("Unit Price", SalesLineBSO."Unit Price");
                SalesLine."Blanket Order No." := SalesLineBSO."No.";
                SalesLine."Blanket Order Line No." := SalesLineBSO."Line No.";
                SalesLine.Insert(true);
            until SalesLineBSO.Next() = 0;
        end;
        SalesHeaderBSO.Validate("Invoice Created", true);
        SalesHeaderBSO.Modify(true);
        if SingalRecord = true then
            Message('Sales Invoice %1 created from Blanket Order %2', SalesHeader."No.", SalesHeaderBSO."No.");
    end;
    // CreateInvformBOS Code End

    // Error Log validation Code Start
    procedure ISAnyErrorValidation(var SalesHeaderBSO: Record "Sales Header"; SingalRecord: Boolean): Boolean
    var
        Customer: Record Customer;
        Item: Record Item;
        SalesLineBSO: Record "Sales Line";
        PostingDate: Date;
        EntryNo: Integer;
        Des: Text;
    begin
        if not Customer.Get(SalesHeaderBSO."Sell-to Customer No.") then begin
            Des := 'Customer not available in customer master';
            CreateErrorLog(Des, SalesHeaderBSO."No.", 0);
        end;
        if SalesHeaderBSO."Posting Date" = 0D then begin
            Des := 'Posting date must have a some value';
            CreateErrorLog(Des, SalesHeaderBSO."No.", 0);
        end;
        if SingalRecord = false then begin
            PostingDate := CalcDate('3D', Today);
            if SalesHeaderBSO."Posting Date" <> PostingDate then begin
                Des := 'Posting date must be 3 days ago';
                CreateErrorLog(Des, SalesHeaderBSO."No.", 0);
            end;
        end;
        SalesLineBSO.Reset();
        SalesLineBSO.SetRange("Document Type", SalesLineBSO."Document Type"::"Blanket Order");
        SalesLineBSO.SetRange("Document No.", SalesHeaderBSO."No.");
        if SalesLineBSO.FindSet() then
            repeat
                if not item.Get(SalesLineBSO."No.") then begin
                    Des := 'Item not available in item master';
                    CreateErrorLog(Des, SalesLineBSO."Document No.", SalesLineBSO."Line No.");
                end;
                if SalesLineBSO.Quantity = 0 then begin
                    Des := 'Quantity must have a some value';
                    CreateErrorLog(Des, SalesLineBSO."Document No.", SalesLineBSO."Line No.");
                end;
            until SalesLineBSO.Next() = 0;
        if Des = '' then
            exit(false)
        else
            exit(true);
    end;

    local procedure CreateErrorLog(Des: text; No: code[30]; Lineno: Integer)
    var
        ErrorLog: Record "Error Log";
        EntryNo: Integer;
    begin
        ErrorLog.Reset();
        if ErrorLog.FindLast() then
            EntryNo := ErrorLog."Entry No" + 1
        else
            EntryNo := 1;
        ErrorLog.Init();
        ErrorLog."Entry No" := EntryNo;
        ErrorLog.Description := des;
        ErrorLog."Document No" := No;
        ErrorLog."Line No" := Lineno;
        ErrorLog.Insert();
    end;

    // Error Log validation Code Start

}