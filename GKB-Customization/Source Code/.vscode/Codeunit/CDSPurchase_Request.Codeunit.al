codeunit 50509 "Purchase_Requests"
{
[EventSubscriber(ObjectType::Codeunit, Codeunit::AddOnIntegrManagement, OnAfterResetReqLineFields, '', false, false)]
    local procedure AddOnIntegrManagement_OnAfterResetReqLineFields(var ReqLine: Record "Requisition Line")
    var
        Customer: Record "Requisition Line";
        CRMAccount: Record "CDS adigkb_PurchaseRequest";
    begin
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("Obrien Business Unit Code"), CRMAccount.FieldNo(global), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo(Quantity), CRMAccount.FieldNo(adigkb_Quantity), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo(Description), CRMAccount.FieldNo(adigkb_Description), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("Due Date"), CRMAccount.FieldNo(due), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("Vendor No."), CRMAccount.FieldNo(ven), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo(projectNo), CRMAccount.FieldNo(project), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo(VendorName), CRMAccount.FieldNo(adigkb_Name), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    end;
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
        IntegrationTableMappingName: Code[20];
        
}