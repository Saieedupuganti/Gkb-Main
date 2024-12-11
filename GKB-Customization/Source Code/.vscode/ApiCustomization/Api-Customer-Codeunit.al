codeunit 50301 "Get Customer by CRMid"
{
    procedure GetCustomerByCRMid()
    var
        ContactRec: Record Contact;
        CustomerRec: Record Customer;
        territoryRec: Record Territory;
        dimensionRec: Record "Dimension Value";
    begin

        if CustomerRec.FindSet() then begin
            repeat
                if CustomerRec."Primary Contact CRMID"<>'' then begin
                  ContactRec.Reset();
                  ContactRec.SetRange("crm id", CustomerRec."Primary Contact CRMID");

                  if ContactRec.FindFirst() then begin
                      if CustomerRec."Primary Contact" <> ContactRec."No." then begin
                          CustomerRec."Primary Contact" := ContactRec."No.";
                      end;
                  end;
                end;

                
                if CustomerRec."Territory Id"<>'' then begin
                  territoryRec.Reset();
                  territoryRec.SetRange("crm id", CustomerRec."Territory Id");

                  if territoryRec.FindFirst() then begin
                      if CustomerRec.Territory <> territoryRec.Code then begin
                          CustomerRec.Territory := territoryRec.Code;
                      end;
                  end;
                end;


                if CustomerRec."Dimension ID"<>'' then begin
                  dimensionRec.Reset();
                  dimensionRec.SetRange("CRM ID", CustomerRec."Dimension ID");

                  if dimensionRec.FindFirst() then begin
                      if CustomerRec.Dimension <> dimensionRec.Code then begin
                          CustomerRec.Dimension := dimensionRec.Code;
                      end;
                  end;
                end;

                CustomerRec.Modify(false);

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
codeunit 50302 "Get Vendor by CRMid"
{
    procedure GetCustomerByCRMid()
    var
        ContactRec: Record Contact;
        VendorRec: Record Vendor;
        territoryRec: Record Territory;
        dimensionRec: Record "Dimension Value";
    begin

        if VendorRec.FindSet() then begin
            repeat
            // Message('Hello'+VendorRec."Dimension ID");
                if VendorRec."Primary Contact No Id"<>'' then begin
                  ContactRec.Reset();
                  ContactRec.SetRange("crm id", VendorRec."Primary Contact No Id");

                  if ContactRec.FindFirst() then begin
                      if VendorRec."Primary Contact No." <> ContactRec."No." then begin
                          VendorRec."Primary Contact No." := ContactRec."No.";
                          // Message('Modified');
                      end;
                    // Message('ID Match found');
                  end;
                end;

                
                if VendorRec."Territory Code Id"<>'' then begin
                  territoryRec.Reset();
                  territoryRec.SetRange("crm id", VendorRec."Territory Code Id");

                  if territoryRec.FindFirst() then begin
                      if VendorRec."Territory Code" <> territoryRec.Code then begin
                          VendorRec."Territory Code" := territoryRec.Code;
                          VendorRec.Modify(false);
                          // Message('Modified');
                      end;
                  end;
                end;

                if VendorRec."Dimension ID"<>'' then begin
                  dimensionRec.Reset();
                  dimensionRec.SetRange("crm id", VendorRec."Dimension ID");

                  if dimensionRec.FindFirst() then begin
                        // Message(dimensionRec.Code);
                      if VendorRec.Dimension <> dimensionRec.Code then begin
                          VendorRec.Dimension := dimensionRec.Code;
                          VendorRec.Modify(false);
                          // Message('Modified');
                      end;
                  end else begin
                    // Message('Not-Found');
                  end;
                end;

                VendorRec.Modify(false);

            until VendorRec.Next() = 0;
        end;

    end;
}

pageextension 50302 "Vendor List Ext." extends "Vendor List"
{
    actions
    {
        addlast("Ven&dor")
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
                    cunit: Codeunit 50302;
                begin
                    cunit.GetCustomerByCRMid();
                end;
            }
        }
    }
}
