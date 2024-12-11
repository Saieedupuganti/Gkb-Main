codeunit 50708 CDSDataverseEvent3
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
    local procedure HandleOnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean)
    begin
        if BCTableNo = DATABASE::"Customer" then begin
            CDSTableNo := DATABASE::"CDS Account";
            handled := true;
        end;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", 'OnLookupCRMTables', '', true, true)]
    local procedure HandleOnLookupCRMTables(CRMTableID: Integer; NAVTableId: Integer; SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text; var Handled: Boolean)
    begin
        if CRMTableID = Database::"CDS Account" then
            Handled := LookupCDSAccount(SavedCRMId, CRMId, IntTableFilter);
    end;
    local procedure LookupCDSAccount(SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text): Boolean
    var
        CDSAccount: Record "CDS Account";
        OriginalCDSAccount: Record "CDS Account";
        OriginalCDSAccountList: Page "CDS Account List";
    begin
        if not IsNullGuid(CRMId) then begin
            if CDSAccount.Get(CRMId) then
                OriginalCDSAccountList.SetRecord(CDSAccount);
            if not IsNullGuid(SavedCRMId) then
                if OriginalCDSAccount.Get(SavedCRMId) then
                    OriginalCDSAccountList.SetCurrentlyCoupledCDSAccount(OriginalCDSAccount);
        end;
        CDSAccount.SetView(IntTableFilter);
        OriginalCDSAccountList.SetTableView(CDSAccount);
        OriginalCDSAccountList.LookupMode(true);
        if OriginalCDSAccountList.RunModal = ACTION::LookupOK then begin
            OriginalCDSAccountList.GetRecord(CDSAccount);
            CRMId := CDSAccount.AccountId;
            exit(true);
        end;
        exit(false);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnAddEntityTableMapping', '', true, true)]
    local procedure HandleOnAddEntityTableMapping(var TempNameValueBuffer: Record "Name/Value Buffer" temporary);
    begin
        AddEntityTableMapping('Customer', DATABASE::"CDS Account", TempNameValueBuffer);
    end;
    local procedure AddEntityTableMapping(CRMEntityTypeName: Text; TableID: Integer; var TempNameValueBuffer: Record "Name/Value Buffer" temporary)
    begin
        TempNameValueBuffer.Init();
        TempNameValueBuffer.ID := TempNameValueBuffer.Count + 1;
TempNameValueBuffer.Name := COPYSTR(CRMEntityTypeName, 1, MaxStrLen(TempNameValueBuffer.Name));        TempNameValueBuffer.Value := Format(TableID);
        TempNameValueBuffer.Insert();
    end;
    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::Bidirectional, 'CDS');
    end;
    procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetConfiguration', '', true, true)]
    local procedure HandleOnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup")
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        CDSAccount: Record "CDS Account";
        Customer: Record "Customer";
    begin
        InsertIntegrationTableMapping(
            IntegrationTableMapping, 'Customer',
            DATABASE::"Customer", DATABASE::"CDS Account", CDSAccount.FieldNo(AccountNumber), CDSAccount.FieldNo(ModifiedOn), '', '', true);
        InsertIntegrationFieldMapping('Customer', Customer.FieldNo("No."), CDSAccount.FieldNo(AccountId), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('Customer', Customer.FieldNo(Name), CDSAccount.FieldNo(Name), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('Customer', Customer.FieldNo(Address), CDSAccount.FieldNo(Address1_Line1), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('Customer', Customer.FieldNo("Country/Region Code"), CDSAccount.FieldNo(Address1_PostalCode), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('Customer', Customer.FieldNo("Contact ID"), CDSAccount.FieldNo(Address1_PrimaryContactName), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    end;
}