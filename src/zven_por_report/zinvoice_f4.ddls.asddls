@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZINVOICE_F4'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZINVOICE_F4 as select distinct from ZC_VENDOR_REPORT 
{
    key invoice_no 
}
group by invoice_no
