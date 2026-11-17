@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZINWARD_F4'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZINWARD_F4 as select distinct from ZC_VENDOR_REPORT
{
    key inwardtype
}
group by inwardtype
