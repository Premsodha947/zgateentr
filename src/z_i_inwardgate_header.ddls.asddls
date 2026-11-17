@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Inward Gate entry Header'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity Z_I_INWARDGATE_HEADER as select from zinward_gate_hdr
 composition[1..*] of Z_I_INWARDGATE_ITEM as _Item

{
    key gate_entry_id as GateEntryId,
    invoice_no as InvoiceNo,
    plant as Plant,
    inwardtype as Inwardtype,
    fiscalyear as Fiscalyear,
    system_date as SystemDate,
    system_time as SystemTime,
    invoice_date as InvoiceDate,
    lrdate as Lrdate,
    lrnumber as Lrnumber,
    ponumber as Ponumber,
    ewayno as Ewayno,
    amount as Amount,
    vehicleno as Vehicleno,
    transporter as Transporter,
    transporter_code as TransporterCode,
    qrcode as QRCode,
    zchalan as Zchalan,
    vendor as Vendor,
    status as Status,
    remarks as Remarks,
    materialdocno as MaterialDoc,
    materialyear   as MaterialYear,
    supplierinvno  as Supplierinv,
    supplierinvyear  as Supplierinvyear,
    
    purchasegroup as Purchasegroup,
    purchase_grpdesc as PurchaseGrpdesc,
    ewaydate as Ewaydate,
    vehicletype as Vehicletype,
    cancelgateentry as Cancelgateentry,
    deleteduserid as Deleteduserid,
    deletedusername as Deletedusername,
    deleteddate as Deleteddate,
    deletedtime as Deletedtime,
    createdby as Createdby,
    creatusername as Creatusername,
    _Item
}
