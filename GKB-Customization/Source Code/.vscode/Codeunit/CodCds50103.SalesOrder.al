codeunit 50103 "Sales Order"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", OnResetSalesOrderMappingOnAfterInsertFieldsMapping, '', false, false)]
    local procedure OnAfterResetVendorAccountMapping(IntegrationTableMappingName: Code[20])
    var
        SalesOrder: Record "Sales Header";
        CRMSalesOrder: Record "CRM Salesorder";
        SalesLine: Record "Sales Line";

    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, SalesOrder.FieldNo("Work Order Type"), CRMSalesOrder.FieldNo(msdyn_ordertype), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, SalesOrder.FieldNo("Lead Type"), CRMSalesOrder.FieldNo(adigkb_Type), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, SalesOrder.FieldNo("Sales Order Name"), CRMSalesOrder.FieldNo(Name), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    end;

    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
}