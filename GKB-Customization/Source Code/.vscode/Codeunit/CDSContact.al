codeunit 70502 "Contacts"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", OnAfterResetContactContactMapping, '', false, false)]
    local procedure OnAfterResetContactMapping(IntegrationTableMappingName: Code[20])
    var
        Contact: Record Contact;
        CRMContact: Record "CDS Contact";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("Contact ID"), CRMContact.FieldNo(ContactId), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo(Name), CRMContact.FieldNo(Address1_Name), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("Address 2 Street 3"), CRMContact.FieldNo(Address1_Line3), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo(Description), CRMContact.FieldNo(Description), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("E-Mail Group Code"), CRMContact.FieldNo(adids_EMailGroupCode), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("Supplier Account Groups"), CRMContact.FieldNo(adids_TassLevel), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("Service Agreement"), CRMContact.FieldNo(adids_SupplierAccountGroups), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
    end;

    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
}