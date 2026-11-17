@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Service Entry Sheet'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_SERVICE_ENTRY as projection on ZI_SERVICE_ENTRY
{
    key GateEntryId,
    key Ponumber,
    key Poitemno,
    Serviceentrysheet,
    Serviceentrysheetitem
}
