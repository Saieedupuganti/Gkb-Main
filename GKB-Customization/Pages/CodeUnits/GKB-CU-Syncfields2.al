// codeunit 50101 VendorContactSync2
// {
//     procedure SyncVendorToContact(VendorRec: Record Vendor; var ContactRec: Record Contact)
//     var
//         VendorText: Text[100];
//     begin
//         // Convert Option to Text
//         VendorText := Format(VendorRec."Supplier account group", 0, '<Text>');

//         // Assign the converted text to the temporary field
//         ContactRec."Temp Description" := VendorText;

//         // Optionally, insert or modify the Contact record
//         if ContactRec.Insert() then
//             Message('Contact record created with Temp Description: %1', ContactRec."Temp Description")
//         else
//             Message('Contact record updated with Temp Description: %1', ContactRec."Temp Description");
//     end;
// }
