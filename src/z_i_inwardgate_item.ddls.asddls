@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inward Gate entry Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_INWARDGATE_ITEM as select from zinward_gate_itm
   association to parent Z_I_INWARDGATE_HEADER  as _Header
   on $projection.GateEntryId = _Header.GateEntryId
{
    key gate_entry_id as GateEntryId,
    ponumber as Ponumber,
    itemno   as LineItem ,
    material as Material,
    materialdesc as Materialdesc,
    quantity as Quantity,
    postedquantity as PostedQuantity,
    remainingqty as Remainingqty,
    uom as Uom,
    _Header
}
