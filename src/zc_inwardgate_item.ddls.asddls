@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View on Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_INWARDGATE_ITEM
  as projection on Z_I_INWARDGATE_ITEM
{
  key GateEntryId,
      Ponumber,
      LineItem,
      Material,
      Materialdesc,
      Quantity,
      PostedQuantity,
      Remainingqty,
      Uom,
      /* Associations */
      _Header : redirected to parent ZC_INWARDGATE_HEADER
}
