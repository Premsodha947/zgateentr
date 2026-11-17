@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zponumber_f4'
@Metadata.ignorePropagatedAnnotations: true
define view entity zponumber_f4 as select distinct from ZC_VENDOR_REPORT
{
    key ponumber as ponumber
}
