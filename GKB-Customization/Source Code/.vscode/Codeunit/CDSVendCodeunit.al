codeunit 50503 "Vendor"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", OnAfterResetVendorAccountMapping, '', false, false)]
    local procedure OnAfterResetVendorAccountMapping(IntegrationTableMappingName: Code[20])
    var
        Vendor: Record Vendor;
        CRMAccount: Record "CRM Account";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("Account Contract Manager"), CRMAccount.FieldNo(adids_AccountContractManager), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("Address Name"), CRMAccount.FieldNo(Address1_Name), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("Address 3"), CRMAccount.FieldNo(Address1_Line3), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("Contact Groups"), CRMAccount.FieldNo(CustomerTypeCode), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("Service Agreement"), CRMAccount.FieldNo(adids_TassLevel), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("Credit Hold"), CRMAccount.FieldNo(CreditOnHold), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("Vendor Profile"), CRMAccount.FieldNo(adids_CustomerProfile), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("Customer Group"), CRMAccount.FieldNo(adids_CustomerGroup), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("D365 Account ID"), CRMAccount.FieldNo(AccountId), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo(Description), CRMAccount.FieldNo(Description), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
       // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("SAP Vendor No"), CRMAccount.FieldNo(adids_SAPCustomerNumber), IntegrationFieldMapping.Direction::Bidirectional, '', true, false); Replace sap vendor no with sap vendor number
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("Supplier account Group"), CRMAccount.FieldNo(adids_SupplierAccountGroups), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
       // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Vendor.FieldNo("SAP Vendor No"), CRMAccount.FieldNo(adids_SAPCustomerNumber), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

    end;

    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
}