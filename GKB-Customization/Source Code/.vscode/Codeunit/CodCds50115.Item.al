codeunit 50115 "Items"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", OnResetItemProductMappingOnAfterInsertFieldsMapping, '', false, false)]
    local procedure OnAfterResetVendorAccountMapping(IntegrationTableMappingName: Code[20])
    var
        Item: Record Item;
        CRMItem: Record "CRM Product";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Item.FieldNo("D365 Product ID"), CRMItem.FieldNo(adids_ProductID), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Item.FieldNo(SAPITEMID), CRMItem.FieldNo(ProductNumber), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Item.FieldNo("Trade Type"), CRMItem.FieldNo(adids_TradeType), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        // IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Item.FieldNo("Standard Cost"), CRMItem.FieldNo(StandardCost), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Item.FieldNo("Vendor Id"), CRMItem.FieldNo(VendorID), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, Item.FieldNo("Vendor 1 Catalogue Number"), CRMItem.FieldNo(adids_ManufacturerCatalogNo), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

    end;

    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
}