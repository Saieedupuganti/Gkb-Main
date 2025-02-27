tableextension 50114 "GKBSales LineExt" extends "Sales Line"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Remaining Quantity"; Decimal)
        {
            Caption = 'Remaining Quantity';
            DataClassification = ToBeClassified;
        }
        field(50102; "QuantityShippedtillnow"; Decimal)
        {
            Caption = 'Quantity Shipped till now';
            DataClassification = ToBeClassified;
            
        }
        field(50104; "SalesOrderCreated"; Boolean)
        {
            Caption = 'Sales Order Created';
            DataClassification = ToBeClassified;
        }
        // Fields For API Table
        field(50105; "Product"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
        }
        field(50107; "CRM ID"; Text[100])
        {
            Caption = 'CRM ID';
            DataClassification = ToBeClassified;
        }
        field(50108; Topic; Text[100])
        {
            Caption = 'Topic';
            DataClassification = ToBeClassified;
        }
        field(50204; "Invoice Created"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Invoice Created';
        }

    }
    }
   

