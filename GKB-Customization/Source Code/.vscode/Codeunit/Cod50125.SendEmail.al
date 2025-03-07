codeunit 55000 "Inventory Reorder"
{
    trigger OnRun()
    begin
        CheckItemsReorderPoint();
    end;

    var
        EmailAccount: Record "Email Account";
        EmailMessage: Codeunit "Email Message";
        UserPersonalization: Record "User Personalization";
        User: Record User;
        BodyMessage: Text;
        EmailSend: Codeunit Email;
        Recipients: List of [Text];

    local procedure CheckItemsReorderPoint()
    var
        Item: Record Item;
    begin
        Item.Reset();
        Item.SetFilter("Reorder Point", '<>0');
        Item.SetFilter(Inventory, '<=%1', Item."Reorder Point");
        if Item.FindSet() then
            repeat
                if Item.Inventory <= Item."Reorder Point" then
                    SendingAnEmail(Item);
            until Item.Next() = 0;
    end;

    local procedure SendingAnEmail(Item: Record Item)
    begin
        Clear(Recipients);
        Clear(EmailMessage);
        // Find SMTP email account
        EmailAccount.Reset();
        EmailAccount.SetFilter(Connector, 'Current User');
        if EmailAccount.FindLast() then
            UserPersonalization.Reset();
        UserPersonalization.SetRange("Role", 'Inventory Manager');
        if UserPersonalization.FindSet() then
            repeat
                User.Reset();
                User.SetRange("User Name", UserPersonalization."User ID");
                User.SetFilter("Contact Email", '<>%1', '');
                if User.FindSet() then
                    repeat
                        Recipients.Add(User."Contact Email");
                    until User.Next() = 0;

                if Recipients.Count >= 0 then
                    exit;

                //  User.SetRange("User Name", 'TESTA');
                //  User.SetFilter("Contact Email", '<>%1', '');
                // if User.FindSet() then begin
                //     repeat
                //         Clear(BodyMessage);
                //         Clear(EmailAccount);
                //         Clear(Recipients);
                //         User.Reset();
                //         User.SetRange("User Name", UserPersonalization."User ID");
                //         User.SetFilter("Contact Email", '<>''''');
                //         if User.FindSet() then
                //             repeat
                //                 Recipients.Add(User."Contact Email");
                //             until User.Next() = 0;
                //     until UserPersonalization.Next() = 0;
                // if Recipients.Count() = 0 then
                //     exit;
                Clear(EmailAccount);
                Recipients.add(User."Contact Email");
                BodyMessage := 'Dear User,<br><br>The Item <strong>%1</strong> has reached its reorder point. Current inventory is <strong>%2</strong> which is less than or equal to the reorder point of <strong>%3</strong>.<br><br>Please take necessary action.<br><br>This is a system generated email. Please do not reply to this mail.<br>';
                BodyMessage := StrSubstNo(BodyMessage, Item."No.", Format(Item.Inventory), Format(Item."Reorder Point"));
                EmailMessage.Create(Recipients, 'Inventory Reorder Point Alert', BodyMessage, true);
                EmailSend.Send(EmailMessage, Enum::"Email Scenario"::"Default");
            until User.Next() = 0;
    end;
    //end;
}