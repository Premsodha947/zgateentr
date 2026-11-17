@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Service Entry Sheet'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_SERVICE_ENTRY as select from ztb_serv_entry
{
    key gate_entry_id as GateEntryId,
    key ponumber as Ponumber,
    key poitemno as Poitemno,
    serviceentrysheet as Serviceentrysheet,
    serviceentrysheetitem as Serviceentrysheetitem
}
