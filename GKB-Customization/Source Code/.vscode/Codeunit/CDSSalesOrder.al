codeunit 50505 "Sales Order"
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
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, SalesOrder.FieldNo("SAP SalesOrder Number"), CRMSalesOrder.FieldNo(adids_SAPSalesOrderNumber), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, SalesOrder.FieldNo("Service Agreement"), CRMSalesOrder.FieldNo(adids_TassLevel), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, SalesOrder.FieldNo("Supplier Account Groups"), CRMSalesOrder.FieldNo(adids_SupplierAccountGroups), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        //IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, SalesOrder.FieldNo("Service Agreement"), CRMSalesOrder.FieldNo(adids_SupplierAccountGroups), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    end;

    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
}