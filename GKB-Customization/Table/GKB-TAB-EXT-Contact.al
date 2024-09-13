tableextension 50101 "GKB Contacts Ext " extends Contact
{
    fields
    {
        field(70100; "Contact ID"; Text[100])
        {
            Caption = 'Contact ID';
            DataClassification = ToBeClassified;
        }
        field(70101; "E-Mail Group Code"; Option)
        {
            Caption = 'E-Mail Group Code';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Account Payable,Accounts,Billing,Billing + Maintenance,Energy,Head Office Contact,Maintenance,Management,Managing Director,Orders,Sales,Statements,Training,Worksheet Email';
            OptionMembers = " ", "Account Payable", "Accounts", "Billing", "Billing + Maintenance", "Energy", "Head Office Contact", "Maintenance", "Management", "Managing Director", "Orders", "Sales", "Statements", "Training", "Worksheet Email";
        }
    }
}
