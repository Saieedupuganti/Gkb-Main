codeunit 50120 "Line-Level Approval Manager"
{
    procedure ProcessLineApprovals(PurchOrder: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
        ApprovalEntry: Record "Approval Entry";
        ApprovedWarehouses: List of [Code[10]];
    begin
        PurchLine.SetRange("Document Type", PurchOrder."Document Type");
        PurchLine.SetRange("Document No.", PurchOrder."No.");

        if PurchLine.FindSet() then
            repeat
                // Skip lines without a short
                if PurchLine."Shortcut Dimension 1 Code" = '' then
                    Error('Line %1 is missing a short. Approval cannot be sent.', PurchLine."Line No.");

                // Avoid duplicate approvals for the same short
                if ApprovedWarehouses.Contains(PurchLine."Shortcut Dimension 1 Code") then
                

                // Logic to create approval entry (example for "Approval Entry" table)
                ApprovalEntry.Init();
                ApprovalEntry."Table ID" := Database::"Purchase Line";
                ApprovalEntry."Document Type" := PurchLine."Document Type";
                ApprovalEntry."Document No." := PurchLine."Document No.";
             //   ApprovalEntry. := PurchLine."Line No.";
                ApprovalEntry."Approver ID" := GetApproverForWarehouse(PurchLine."Shortcut Dimension 1 Code"); // Custom logic to fetch approver
                ApprovalEntry.Insert();

                // Track approved warehouses to avoid duplicates
                ApprovedWarehouses.Add(PurchLine."Shortcut Dimension 1 Code");

                // Log message for testing
                Message('Approval sent for Line %1, Business Unit: %2', PurchLine."Line No.", PurchLine."Shortcut Dimension 1 Code");
            until PurchLine.Next() = 0;
    end;

    procedure GetApproverForWarehouse(BusinessUnitCode: Code[10]): Code[20]
    begin
        // Replace with logic to fetch the approver for the given warehouse
        case BusinessUnitCode of
            'NSW': exit('ApproverNSW');
            'VIC': exit('ApproverVIC');
            'QLD': exit('ApproverQLD');
            else
                Error('No approver found for short: %1', BusinessUnitCode);
        end;
    end;
}
