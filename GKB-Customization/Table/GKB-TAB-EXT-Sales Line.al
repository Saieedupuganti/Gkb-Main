tableextension 50128 "GKBSales LineExt" extends "Sales Line"
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
        field(50104;"SalesOrderCreated";Boolean)
        {
            Caption='Sales Order Created';
            DataClassification=ToBeClassified;

        }
    }
   
}
