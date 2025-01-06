tableextension 50123 GKBJobExt extends Job
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50010; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Service Account"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer"; // Replace with the related table if different
        }
        field(50025; "Work Order Type"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "GKB Work Order Type";
        }
    }
    //trigger OnInsert()

}
