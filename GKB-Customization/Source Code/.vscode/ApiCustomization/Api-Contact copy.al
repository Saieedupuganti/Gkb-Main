// page 50358 "API Contact 2"
// {
//     PageType = API;
//     Caption = 'API Contact';
//     APIPublisher = 'integration';
//     APIGroup = 'api';
//     APIVersion = 'v2.0', 'v1.0';
//     EntityName = 'Contacts';
//     EntitySetName = 'Contacts';
//     SourceTable = Contact;
//     DelayedInsert = true;

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field(crmid; Rec."CRM ID")
//                 {
//                     Caption = 'CRM ID';
//                 }
//                 field(CompanyID; Rec."Company No.")
//                 {
//                     Caption = 'Company ID';
//                 }
//                 field(Dimension; Rec.Dimension)
//                 {
//                     Caption = 'Dimension Code';
//                 }
//                 field(Dimensioncrmid; Rec."Dimension ID")
//                 {
//                     Caption = 'Dimension CRM Id';
//                 }
//             }
//         }
//     }
// }


// tableextension 50315 "API Contact Fields" extends Contact
// {
//     fields
//     {
//         field(50155; "CrmId"; Text[100])
//         {
//             Caption = 'Crm Id';
//             DataClassification = ToBeClassified;
//         }
//     }



//     trigger OnAfterModify()
//     var
//         dimRec: Record "Dimension Value";
//         customerRec: Record Customer;
//         currencyRec: Record Currency;
//         dimensionCode: text;
//         customerCode: text;
//         modified:Integer;
//     begin
        
//         modified:=0;


//         // Check if field has changed and is not empty
//         if (Rec."Dimension ID"<>'') and (xRec."Dimension ID" <> Rec."Dimension ID") then begin
            
//             dimRec.SetFilter("CRM ID",Rec."Dimension ID");

//             if dimRec.FindFirst() then begin

//                 Rec.Dimension := dimRec.Code;

//                 modified:=modified+1;
//             end;
//         end;

//         // Modify only if found atleast 1 CRM - BC match
//         if modified>0 then begin
//             Rec.Modify(false);
//         end;
//     end;
// }




// pageextension 50351 "Contact Card Extension" extends "Contact Card"
// {
//     layout
//     {
//         addafter("Contact ID")
//         {
//             field("CRMid"; Rec."CrmId")
//             {
//                 Caption='Crm Id';
//                 ApplicationArea=All;
//             }
//             field("Dimension Code"; Rec.Dimension)
//             {
//                 ApplicationArea=All;
//                 Caption='Dimension Code';
//                 ToolTip='Dimension Code Lookup';

//                 TableRelation=Dimension.Code;
//             }
//             field("Dimension ID"; Rec."Dimension ID")
//             {
//                 Caption='Dimension ID';
//                 ApplicationArea=All;
//             }
//             field("Primary Account"; Rec.CrmId)
//             {
//                 Caption='Primary Account';
//                 ApplicationArea=All;
//             }
//         }
//     }
// }