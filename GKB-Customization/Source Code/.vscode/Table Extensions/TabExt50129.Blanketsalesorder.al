tableextension 50129 "GKB Blanketsalesorder" extends "Sales Header"
{
    fields
    {
        field(50201; Percentage; Decimal)
        {
            Caption = 'Percentage to Update';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if (Percentage < 0) or (Percentage > 100) then
                    Error('Please enter a value between 0 and 100.');
            end;
        }
    }
}