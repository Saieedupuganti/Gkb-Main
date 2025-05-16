pageextension 50142 "GKB Job Card" extends "Job Card"
{
    layout
    {
        addafter(Description)
        {
            field("Work Order Type"; Rec."Work Order Type")
            {
                ApplicationArea = all;
                Caption = 'Work Order Type';
                Visible = true;
            }
            field("Service Account"; Rec."Service Account")
            {
                ApplicationArea = all;
                Caption = 'Service Account';
                Visible = false;
            }
        }
        addlast(General)
        {
            field("System Status"; Rec."System Status")
            {
                ApplicationArea = All;
                Caption = 'System Status';
            }
            field("Billing Type"; Rec."Billing Type")
            {
                ApplicationArea = All;
                Caption = 'Billing Type';
            }
            field("Customer PO Number"; Rec."Customer PO Number")
            {
                ApplicationArea = All;
                Caption = 'Customer PO Number';
            }
            field("Sales Order No."; Rec."Sales Order")
            {
                ApplicationArea = All;
                Caption = 'Blanket Order No.';
            }
            field("Substatus"; Rec."Substatus")
            {
                ApplicationArea = All;
                Caption = 'Substatus';
            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                Caption = 'Obrien Business Unit Code';
            }
        }
    }
}