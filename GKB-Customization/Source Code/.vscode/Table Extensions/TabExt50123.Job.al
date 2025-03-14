tableextension 50123 GKBJobExt extends Job
{
    fields
    {
        field(50100; Comments2; Text[200])
        {
            Caption = 'Comments2';
            DataClassification = ToBeClassified;
        }
        field(50010; Name; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Service Account"; Code[200])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer"; // Replace with the related table if different
        }
        field(50025; "Work Order Type"; Text[200])
        {
            DataClassification = CustomerContent;
            TableRelation = "GKB Work Order Type";
        }
        field(50002; "System Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Unscheduled,Scheduled,"In Progress",Completed,Invoiced,Cancelled;
        }
        field(50029; "Sales Order"; Code[200])
        {
            DataClassification = CustomerContent;
           Caption = 'Sales Order No.';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST(Order));
        }
          field(50006; "Billing Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","Charge Up","Quoted","Monthly Billing","Not Chargeable","N/A";
        }
         field(50032; "Customer PO Number"; Text[200])
        {
            Caption = 'Customer PO Number';
            DataClassification = ToBeClassified;
        }
        field(50003; "Substatus"; Text[200])
        {
            DataClassification = CustomerContent;
            TableRelation = "GKB Work Order Substatus";
        }
    }
}
