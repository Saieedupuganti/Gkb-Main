tableextension 50159 "Job Planning Line Ext" extends "Job Planning Line"
{
    fields
    {
        field(50100; "Service Duration"; Decimal)
        {
            Caption = 'Service Duration';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
            trigger OnValidate()
            begin
                if (Rec."Service Duration" <> 0) and (Rec."Service Duration" <> xRec."Service Duration") then
                    Rec."Total Cost For Service" := Round("Unit Price" * "Service Duration");
            end;
        }
        field(50101; "Total Cost For Service"; Decimal)
        {
            Caption = 'Total Service Cost';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50103; "Total Line Cost"; Decimal)
        {
            FieldClass = FlowField;
            DecimalPlaces = 0 : 5;
            CalcFormula = Sum("Job Planning Line"."Total Cost" WHERE("Job No." = FIELD("Job No.")));
            Caption = 'Total Line Cost';
            Editable = false;
        }
        field(50104; "Total Line Amount"; Decimal)
        {
            FieldClass = FlowField;
            DecimalPlaces = 0 : 5;
            CalcFormula = Sum("Job Planning Line"."Line Amount" WHERE("Job No." = FIELD("Job No.")));
            Caption = 'Total Line Amount';
            Editable = false;
        }
    }
}
pageextension 50363 "Job Planning Line Lst" extends "Job Planning Lines Part"
{
    layout
    {
        addafter("Line Amount")
        {
            field("Service Duration"; Rec."Service Duration")
            {
                ApplicationArea = All;
            }
            field("Total Cost For Service"; Rec."Total Cost For Service")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the total cost for the Service';
            }
            
        }
    }
}