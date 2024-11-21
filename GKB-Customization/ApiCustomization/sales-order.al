page 50325 "API Sales Order"
{
    PageType = API;
    Caption = 'API Sales Order';
    APIPublisher = 'integration';
    APIGroup = 'api';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesorder';
    EntitySetName = 'salesorder';
    SourceTable = "Sales Header";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(crmid; Rec."CRM ID")
                {
                    Caption = 'CRM ID';
                }
                field(documenttype; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(code; Rec."No.")
                {
                    Caption = 'Code';
                }
                field(customerno; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(customername; Rec."Sell-to Customer Name")
                {
                    Caption = 'Customer No.';
                }
                field(customercrmid; Rec."Customer CRMID")
                {
                    Caption = 'Customer No.';
                }
                field(addressname; Rec."Address Name")
                {
                    Caption = 'Address Name';
                }
                field(city; Rec."Sell-to City")
                {
                    Caption = 'City';
                }
                field(country; Rec."Sell-to Country/Region Code")
                {
                    Caption = 'Country';
                }
                field(postcode; Rec."Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code';
                }
                field(address; Rec."Sell-to Address")
                {
                    Caption = 'Address';
                }
                field(address2; Rec."Sell-to Address 2")
                {
                    Caption = 'Address 2';
                }
                field(address3; Rec."Address 3")
                {
                    Caption = 'Address 3';
                }
                field(currency; Rec."Currency Code")
                {
                    Caption = 'Currency'; 
                }
                field(currencycrmid; Rec."Currency CRM ID")
                {
                    Caption = 'Currency CRM ID';
                }
                field(description; Rec."Work Description")
                {
                    Caption = 'Work Description';
                }
                field(email; Rec."Sell-to E-Mail")
                {
                    Caption = 'Work Description';
                }
                field(invoicediscountvalue; Rec."Invoice Discount Value")
                {
                    Caption = 'Invoice Discount Value';
                }
                field(invoicediscountamount; Rec."Invoice Discount Amount")
                {
                    Caption = 'Invoice Discount Amount';
                }
                field(ordertype; Rec."Order Type")
                {
                    Caption = 'Order Type';
                }
                field(owner; Rec.Owner)
                {
                    Caption = 'Owner';
                }
                field(ownercrmid; Rec."Owner CRMID")
                {
                    Caption = 'Owner CRMID';
                }
                field(dimension; Rec.Dimension)
                {
                    Caption = 'Dimension';
                }
                field(dimensioncrmid; Rec."Dimension CRM ID")
                {
                    Caption = 'Dimension CRM ID';
                }
                field(pricelist; Rec."Price List")
                {
                    Caption = 'Price List';
                }
                field(quote; Rec."Quote")
                {
                    Caption = 'Quote';
                }
                field(quotecrmid; Rec."Quote CRM ID")
                {
                    Caption = 'Quote';
                }
                field(opportunity; Rec."Opportunity")
                {
                    Caption = 'Opportunity';
                }
                field(opportunitycrmid; Rec."Opportunity CRM ID")
                {
                    Caption = 'Opportunity CRM ID';
                }
                field(requesteddeliverydate; Rec."Requested Delivery Date")
                {
                    Caption = 'Requested Delivery Date';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(totaldetailamount; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                }
                field(leadtype; Rec."Lead Type")
                {
                    Caption = 'Lead Type';
                }
                field(wotype; Rec."Work Order Type")
                {
                    Caption = 'Work Order Type';
                }
                field(freightamount; Rec."Freight Amount")
                {
                    Caption = 'Freight Amount';
                }
                field(freightterms; Rec."Freight Terms")
                {
                    Caption = 'Freight Terms';
                }
                field(creationmethod; Rec."Creation Method")
                {
                    Caption = 'Creation Method';
                }
                field(shiptocity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                }
                field(shiptocountry; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';
                }
                field(shiptoname; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field(shiptopostalcode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                }
                field(shiptoaddress; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                }
                field(shiptoaddress2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address 2';
                }
                field(shiptoaddress3; Rec."Ship-to Address 3")
                {
                    Caption = 'Ship-to Address 3';
                }
                field(uom; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(uomcrmid; Rec."Unit of Measure Code CRMID")
                {
                    Caption = 'Unit of Measure Code CRMID';
                }
                field(unitcostcrmid; Rec."Unit Cost CRMID")
                {
                    Caption = 'Unit Cost CRMID';
                }
            }
        }
    }
}

tableextension 50326 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50102; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50103; "Unit of Measure Code CRMID"; Text[100])
        {
            Caption = 'Unit of Measure Code CRMID';
            DataClassification = ToBeClassified;
        }
        field(50126; "Unit of Measure Code"; Text[100])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = ToBeClassified;
        }
        field(50104; "Unit Cost CRMID"; Text[100])
        {
            Caption = 'Unit Cost CRMID';
            DataClassification = ToBeClassified;
        }
        field(50105; "Customer CRMID"; Text[100])
        {
            Caption = 'Customer CRMID';
            DataClassification = ToBeClassified;
        }
        field(50106; "Address Name"; Text[100])
        {
            Caption = 'Address Name';
            DataClassification = ToBeClassified;
        }
        field(50107; "Currency CRM ID"; Text[100])
        {
            Caption = 'Currency CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50108; "Order Type"; Text[100])
        {
            Caption = 'Order Type';
            DataClassification = ToBeClassified;
        }
        field(50109; Owner; Text[100])
        {
            Caption = 'Owner';
            DataClassification = ToBeClassified;
        }
        field(50110; "Owner CRMID"; Text[100])
        {
            Caption = 'Owner CRMID';
            DataClassification = ToBeClassified;
        }
        field(50111; Dimension; Text[100])
        {
            Caption = 'Dimension';
            DataClassification = ToBeClassified;
        }
        field(50112; "Dimension CRM ID"; Text[100])
        {
            Caption = 'Dimension CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50113; "Price List"; Text[100])
        {
            Caption = 'Price List';
            DataClassification = ToBeClassified;
        }
        field(50114; "Quote"; Text[100])
        {
            Caption = 'Quote';
            DataClassification = ToBeClassified;
        }
        field(50115; "Quote CRM ID"; Text[100])
        {
            Caption = 'Quote CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50116; "Opportunity"; Text[100])
        {
            Caption = 'Opportunity';
            DataClassification = ToBeClassified;
        }
        field(50117; "Opportunity CRM ID"; Text[100])
        {
            Caption = 'Opportunity CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50118; "Lead Type"; Text[100])
        {
            Caption = 'Lead Type';
            DataClassification = ToBeClassified;
        }
        field(50119; "Work Order Type"; Text[100])
        {
            Caption = 'Work Order Type';
            DataClassification = ToBeClassified;
        }
        field(50120; "Freight Amount"; Text[100])
        {
            Caption = 'Freight Amount';
            DataClassification = ToBeClassified;
        }
        field(50121; "Freight Terms"; Option)
        {
            Caption = 'Freight Terms';
            OptionMembers=" ","100000001","100000000","100000002","100000003","100000004","100000005","100000006","100000007","100000008","100000009","100000010","100000011","100000012","100000013","1","2";
            OptionCaption=' ,CIF,CFR,CIP,CPT,DAF,DDP,DDU,DELIVERY,DEQ,DES,EXW,FAS,FCA,PICKUP,FOB,No Charge';
            DataClassification = ToBeClassified;
        }
        field(50122; "Creation Method"; Option)
        {
            Caption = 'Creation Method';
            OptionMembers="776160000","776160001";
            OptionCaption='Unknown,Win Quote';
            DataClassification = ToBeClassified;
        }
        field(50123; "Ship-to Address 3"; Text[100])
        {
            Caption = 'Ship-to Address 3';
            DataClassification = ToBeClassified;
        }
    }

    trigger OnAfterModify()
    var
        dimRec: Record Dimension;
        customerRec: Record Customer;
        currencyRec: Record Currency;
        dimensionCode: text;
        customerCode: text;
        modified:Integer;
    begin
        
        modified:=0;
        // Check if field has changed and is not empty
        if (Rec."Customer CRMID"<>'') and (xRec."Customer CRMID"<>Rec."Customer CRMID") then begin
            customerRec.SetFilter("CRM ID",Rec."Customer CRMID");
            if customerRec.FindFirst() then begin
                Rec."Sell-to Customer No." := customerRec."No.";
                modified:=modified+1;
            end;
        end;
        
        // Check if field has changed and is not empty
        if (Rec."Dimension CRM ID"<>'') and (xRec."Dimension CRM ID"<>Rec."Dimension CRM ID") then begin
            dimRec.SetFilter("CRM ID",Rec."Dimension CRM ID");
            if dimRec.FindFirst() then begin
                Rec."Sell-to Customer No." := dimRec.Code;
                modified:=modified+1;
            end;
        end;

        // Check if field has changed and is not empty
        if (Rec."Currency CRM ID"<>'') and (xRec."Currency CRM ID" <>Rec."Currency CRM ID") then begin
            currencyRec.SetFilter("CRM ID",Rec."Currency CRM ID");
            if currencyRec.FindFirst() then begin
                Rec."Currency Code" := currencyRec.Code;
                modified:=modified+1;
            end;
        end;

        // Nodify only if found atleast 1 CRM - BC match
        if modified>0 then begin
            Rec.Modify(false);
        end;
    end;
            
}

