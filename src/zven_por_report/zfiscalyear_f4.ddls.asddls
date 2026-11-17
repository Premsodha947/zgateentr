@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zfiscalyear_f4'
@Metadata.ignorePropagatedAnnotations: true
define view entity zfiscalyear_f4 as select from ZC_VENDOR_REPORT
{
   key fiscalyear 
}
group by fiscalyear
