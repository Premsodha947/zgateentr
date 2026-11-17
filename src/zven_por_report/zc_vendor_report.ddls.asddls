@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VENDOR REPORT'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_VENDOR_REPORT as select distinct from zinward_gate_hdr as a
    left outer join I_Plant as b on( b.Plant = a.plant )
    left outer join zinward_gate_itm as c on( c.gate_entry_id = a.gate_entry_id and c.ponumber = a.ponumber )
    left outer join I_Supplier  as d on ( d.Supplier = a.vendor )
{ 

//@Consumption.valueHelpDefinition: [ { entity:  { name: 'zcds_f4_billingtype',element: 'BillingDocumentType' } }]


      @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZGATEENTRY_F4', element: 'gate_entry_id' } }]
  key right( a.gate_entry_id, 10 ) as gate_entry_id,
      @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZMATERIAL_F4', element: 'Material' } }]
  key c.material,
    @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZINVOICE_F4', element: 'invoice_no' } }]
  key  a.invoice_no,
    @Consumption.valueHelpDefinition: [ { entity:  { name:    'I_PlantStdVH', element: 'Plant' } }]
  key  a.plant,
  key  b.PlantName,
    @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZINWARD_F4', element: 'inwardtype' } }]
  key  a.inwardtype,
    
    @Consumption.valueHelpDefinition: [ { entity:  { name:    'zfiscalyear_f4', element: 'fiscalyear' } }]
  key  a.fiscalyear,
  key  a.system_date,
  key  a.system_time,
//    @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZINVOICE_F4', element: 'Invoice Date' } }]
    @Consumption.filter.selectionType: #INTERVAL
  key  a.invoice_date,
  key  a.lrdate,
  key  a.lrnumber,
    @Consumption.valueHelpDefinition: [ { entity:  { name:    'zponumber_f4', element: 'ponumber' } }]
  key  a.ponumber,
  key  a.ewayno,
  key  a.vehicleno,
  key  a.transporter,
  key  a.zchalan,
    @Consumption.valueHelpDefinition: [ { entity:  { name:    'Z_vendor_F4', element: 'vendor' } }]
  key  a.vendor,
  key d.SupplierName,
  key  a.status,
  key  a.transporter_code,
 key  a.remarks, 
   @Consumption.valueHelpDefinition: [ { entity:  { name:    'ZVEN_POR_VIEW', element: 'department' } }]
 key  lpad( a.purchasegroup, 3, '0' ) as department, //a.purchasegroup as department, 
 key  a.purchase_grpdesc, 
 key  a.vehicletype, 
 key  a.ewaydate,
 key  c.itemno,
 key a.cancelgateentry,  
  key c.materialdesc,
 key  case when a.inwardtype = 'RECPO' and c.postedquantity <> c.quantity  then c.quantity else 0 end as quantity,
 key  c.uom,
 key  case when a.inwardtype = 'RECPO' then c.postedquantity else c.quantity end as postedquantity,
 key case when a.inwardtype = 'RECPO' then c.remainingqty else 0 end  as remaining_qty,
 key a.deleteduserid,
 key a.deletedusername,
 key a.deleteddate,
 key a.deletedtime,
 key a.createdby,
 key a.creatusername

}

  
  
 
