tableextension 50101 "GKB Contacts Ext " extends Contact
{
    fields
    {
        field(50100; "Contact ID"; Text[100])
        {
            Caption = 'Contact ID';
            DataClassification = ToBeClassified;
        }
        field(50101; "E-Mail Group Code"; Option)
        {
            Caption = 'E-Mail Group Code';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Account Payable,Accounts,Billing,Billing + Maintenance,Energy,Head Office Contact,Maintenance,Management,Managing Director,Orders,Sales,Statements,Training,Worksheet Email';
            OptionMembers = " ","Account Payable","Accounts","Billing","Billing + Maintenance","Energy","Head Office Contact","Maintenance","Management","Managing Director","Orders","Sales","Statements","Training","Worksheet Email";
        }
        field(70102; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(70103; "Address 3";Text[100])
        {
            Caption = 'Address 3';
        }
    }
}
