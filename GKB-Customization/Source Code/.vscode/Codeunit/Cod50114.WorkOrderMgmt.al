codeunit 50114 "Work Order Mgmt"
{
    //VG-Project/WorkOrder-Start
    local procedure LookupProject(SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text): Boolean
    var
        CDSWorkorder: Record "CDS msdyn_workorder";
        originalCDSWorkorders: Record "CDS msdyn_workorder";
        CDSWorkorderlist: Page "CDS Projects List";
    begin
        if not IsNullGuid(CRMId) then begin
            if CDSWorkorder.Get(CRMId) then
                CDSWorkorderlist.SetRecord(CDSWorkorder);
            if not IsNullGuid(SavedCRMId) then
                if originalCDSWorkorders.Get(SavedCRMId) then
                    CDSWorkorderlist.SetCurrentlyCoupledCDSProjects(originalCDSWorkorders);
        end;

        CDSWorkorder.SetView(IntTableFilter);
        CDSWorkorderlist.SetTableView(CDSWorkorder);
        CDSWorkorderlist.LookupMode(true);
        if CDSWorkorderlist.RunModal() = ACTION::LookupOK then begin
            CDSWorkorderlist.GetRecord(CDSWorkorder);
            CRMId := CDSWorkorder.msdyn_workorderId;
            exit(true);
        end;
        exit(false);
    end;

    local procedure AddEntityProjectMapping(CRMEntityTypeName: Text; TableID: Integer; var TempNameValueBuffer: Record "Name/Value Buffer" temporary)
    begin
        TempNameValueBuffer.Init();
        TempNameValueBuffer.ID := TempNameValueBuffer.Count + 1;
        TempNameValueBuffer.Name := CopyStr(CRMEntityTypeName, 1, MaxStrLen(TempNameValueBuffer.Name));
        TempNameValueBuffer.Value := Format(TableID);
        TempNameValueBuffer.Insert();
    end;

    local procedure InsertIntegrationProjectMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::FromIntegrationTable, 'CDS');
    end;

    procedure InsertIntegrationProjectMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection, ConstValue, ValidateField, ValidateIntegrationTableField);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
    local procedure OnGetProjectNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean);
    begin
        if BCTableNo = DATABASE::"GKB Work Order" then begin
            CDSTableNo := DATABASE::"CDS msdyn_workorder";
            handled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", 'OnLookupCRMTables', '', false, false)]
    local procedure OnLookupCRMProject(CRMTableID: Integer; NAVTableId: Integer; SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text; var Handled: Boolean);
    begin
        if CRMTableID = Database::"CDS msdyn_workorder" then
            Handled := LookupProject(SavedCRMId, CRMId, IntTableFilter);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnAddEntityTableMapping', '', false, false)]
    local procedure OnAddEntityProjectMapping(var TempNameValueBuffer: Record "Name/Value Buffer");
    begin
        AddEntityProjectMapping('Project', DATABASE::"CDS msdyn_workorder", TempNameValueBuffer);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetConfiguration', '', false, false)]

    local procedure OnAfterResetProjectConfiguration(CDSConnectionSetup: Record "CDS Connection Setup");
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        CDSworkorder: Record "CDS msdyn_workorder";
        WorkOrder: Record "GKB Work Order";
    begin
        InsertIntegrationProjectMapping(IntegrationTableMapping, 'Work Order', DATABASE::"GKB Work Order", DATABASE::"CDS msdyn_workorder", CDSworkorder.FieldNo(msdyn_workorderId), CDSworkorder.FieldNo(msdyn_workorderId), '', '', true);
        InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Work Order No."), CDSworkorder.FieldNo(msdyn_workorderId), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Service Account"), CDSworkorder.FieldNo("Service Account Name"), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("System Status"), CDSworkorder.FieldNo(msdyn_SystemStatus), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo(Substatus), CDSworkorder.FieldNo(statuscode), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo(Agreement), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Billing Type"), CDSworkorder.FieldNo(adids_BillingType), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo(Case), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Completed On"), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo(Contact), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo(Currency), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Fix Type"), CDSworkorder.FieldNo(adids_FixType), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Functional Location"), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo(Opportunity), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Sales Order"), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Owning Business Unit"), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Parent Work Order"), CDSworkorder.FieldNo(msdyn_ParentWorkOrder), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Time Window Start"), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Time Window End"), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo(Topic), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Work Description"), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        // InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Work Order Type"), CDSworkorder.FieldNo(), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
        InsertIntegrationProjectMapping('Project', WorkOrder.FieldNo("Work Order Summary"), CDSworkorder.FieldNo(msdyn_WorkOrderSummary), IntegrationFieldMapping.Direction::FromIntegrationTable, '', true, false);
    end;
    //VG-Project/WOrkOrder-End
}