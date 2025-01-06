codeunit 50104 "Contacts"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", OnAfterResetContactContactMapping, '', false, false)]
    local procedure OnAfterResetContactMapping(IntegrationTableMappingName: Code[20])
    var
        Contact: Record Contact;
        CRMContact: Record "CDS Contact";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("D365 Contact ID"), CRMContact.FieldNo(ContactId), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo(Name), CRMContact.FieldNo(Address1_Name), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("Address 2 Street 3"), CRMContact.FieldNo(Address1_Line3), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo(Description), CRMContact.FieldNo(Description), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("E-Mail Group Code"), CRMContact.FieldNo(adids_EMailGroupCode), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("Company Name"), CRMContact.FieldNo(Company), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Contact.FieldNo("Service Agreement"), CRMContact.FieldNo(adids_SupplierAccountGroups), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    end;

    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
}