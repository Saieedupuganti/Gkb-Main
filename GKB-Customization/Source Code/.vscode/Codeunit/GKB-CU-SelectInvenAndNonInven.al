// codeunit 50200 "VendorNoforNon-Inven"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Requisition Line", 'OnAfterCopyFromItem', '', false, false)]
//     local procedure OnAfterCopyFromItemHandler(var RequisitionLine: Record "Requisition Line"; Item: Record Item)
//     begin
//         if Item.Type = Item.Type::Inventory then begin
//             RequisitionLine."Vendor No." := Item."Vendor No.";
//         end else begin
//             RequisitionLine."Vendor No." := ''; // Clear Vendor No. for Non-Inventory
//         end;

//         NonInventVendorNo(RequisitionLine);
//     end;

//     local procedure NonInventVendorNo(var RequisitionLine: Record "Requisition Line")
//     var
//         Vendor: Record Vendor;
//         //IsInventoryItem: Boolean;
        
//     begin
//         // Check if Type is Item but not Inventory
//         if RequisitionLine.Type = RequisitionLine.Type::Item then begin
//             if RequisitionLine."No." <> '' then begin
//                 // Check if the Item is non-inventory (e.g., by checking an Item field)
//                 //if not IsInventoryItem(RequisitionLine."No.") then begin
                
//                     if Vendor.Get(RequisitionLine."Vendor Name") then begin
//                         RequisitionLine."Vendor No." := Vendor."No."; // Populate Vendor No.
//                     end else begin
//                         RequisitionLine."Vendor No." := ''; // Clear Vendor No. if vendor not found
//                     end;
//                 end;
//             end;
//         end;
// }