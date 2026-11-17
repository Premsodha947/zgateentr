@AbapCatalog.sqlViewName: 'YGATEENTRYF4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZGATEENTRY_F4'
@Metadata.ignorePropagatedAnnotations: true
define view ZGATEENTRY_F4 as select from ZC_VENDOR_REPORT
{
   @ObjectModel.text.element: ['gate_entry_id']  
 @Search.defaultSearchElement: true 
 @Search.ranking: #HIGH
 @Search.fuzzinessThreshold: 0.8
  key gate_entry_id
   
}
group by 
gate_entry_id
