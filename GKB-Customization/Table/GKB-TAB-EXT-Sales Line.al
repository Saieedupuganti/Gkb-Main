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
        field(50102; "QuantityShipped"; Decimal)
        {
            Caption = 'Quantity Shipped';
            DataClassification = ToBeClassified;
        }
    }

    
   
}