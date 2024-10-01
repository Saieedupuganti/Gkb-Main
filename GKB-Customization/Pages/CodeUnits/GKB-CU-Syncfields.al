// codeunit 50100 VendorContactSync
// {
//     procedure SyncVendorToContact(VendorRec: Record Vendor; var ContactRec: Record Contact)
//     begin
//         // Assign the option value directly
//         ContactRec."Supplier Account Group" := VendorRec."Supplier account group";

//         // Optionally, insert or modify the Contact record
//         if ContactRec.Insert() then
//             Message('Contact record created with Supplier Account Group: %1', ContactRec."Supplier Account Group")
//         else
//             Message('Contact record updated with Supplier Account Group: %1', ContactRec."Supplier Account Group");
//     end;
// }