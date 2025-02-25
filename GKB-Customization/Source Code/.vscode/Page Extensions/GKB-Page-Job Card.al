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
            field("System Status";Rec."System Status")
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
            field("Sales Order"; Rec."Sales Order")
            {
                ApplicationArea = All;
                Caption = 'Sales Order';
            }
            field("Substatus"; Rec."Substatus")
            {
                ApplicationArea = All;
                Caption = 'Substatus';
            }
        }
    }
}