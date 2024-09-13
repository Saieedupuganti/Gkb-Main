tableextension 50131 "GKBSalesperson/PurchaserExt" extends "Salesperson/Purchaser"
{
    fields
    {
        field(50100; Comments2; Text[100])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
    }
}
