
codeunit 50301 "Get Customer by CRMid"
{
    procedure GetCustomerByCRMid()
    var
        ContactRec: Record Contact;
        CustomerRec: Record Customer;
    begin

        if CustomerRec.FindSet() then begin
            repeat
                if CustomerRec."Primary Contact CRMID"<>'' then begin
                  ContactRec.Reset();
                  ContactRec.SetRange("crm id", CustomerRec."Primary Contact CRMID");

                  if ContactRec.FindFirst() then begin
                      if CustomerRec."Primary Contact" <> ContactRec."No." then begin
                          CustomerRec."Primary Contact" := ContactRec."No.";
                          CustomerRec.Modify(false);
                          // Message('Modified');
                      end;
                    // Message('ID Match found');
                  end;
                end;
            until CustomerRec.Next() = 0;
        end;

    end;
}

pageextension 50301 "Customer List Ext." extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {
            action("Setup Lookups")
            {
                ApplicationArea = All;
                Image = CustomerRating;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Configure Lookups';
                Enabled=true;
                trigger OnAction();
                var
                    cunit: Codeunit 50301;
                begin
                    cunit.GetCustomerByCRMid();
                end;
            }
        }
    }
}
