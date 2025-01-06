codeunit 50102 "Accounts"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetCustomerAccountMapping', '', false, false)]
    local procedure OnAfterResetVendorAccountMapping(IntegrationTableMappingName: Code[20])
    var
        Customer: Record Customer;
        CRMAccount: Record "CRM Account";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("Block Payment Tolerance"), CRMAccount.FieldNo(adids_PaymentBlock), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("Customer group"), CRMAccount.FieldNo(adids_CustomerGroup), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("Customer Profile"), CRMAccount.FieldNo(adids_CustomerProfile), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("SAP Customer Number"), CRMAccount.FieldNo(adids_SAPCustomerNumber), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("Service Agreement"), CRMAccount.FieldNo(adids_TassLevel), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("Supplier Account Groups"), CRMAccount.FieldNo(adids_SupplierAccountGroups), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
      //IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Customer.FieldNo("Service Agreement"), CRMAccount.FieldNo(adids_SupplierAccountGroups), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    end;
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
}