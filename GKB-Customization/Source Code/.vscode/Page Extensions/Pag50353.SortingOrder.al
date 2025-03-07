pageextension 50353 "Blanket Order List" extends "Blanket Sales Orders"
{
    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        rec.Ascending(false);
    end;
}
pageextension 50354 "Sales invoice List ext" extends "Sales Invoice List"
{
    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        rec.Ascending(false);
    end;
}
pageextension 50355 " Posted Sales invoiceext" extends "Posted Sales Invoices"
{
    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        rec.Ascending(false);
    end;
}
pageextension 50356 "Sales Quotes ext" extends "Sales Quotes"
{
   trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        rec.Ascending(false);
    end;
}

pageextension 50357 "job list ext" extends "Job List"
{
    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        rec.Ascending(false);
    end;
}
pageextension 50358 "Purchase Qt ext" extends "Purchase Quotes"
{
    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        rec.Ascending(false);
    end;
}
pageextension 50359 "Purch. Inv ext" extends "Purchase Invoices"
{
    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("No.");
        rec.Ascending(false);
    end;
}

