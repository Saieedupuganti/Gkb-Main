tableextension 50125 "GKBSales HeaderExt" extends "Sales Header"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50101; "Work Details"; Blob)
        {
            Caption = 'Work Details';
            DataClassification = ToBeClassified;
           // ExtendedDatatype= RichContent
        }
    }
   

    
}
