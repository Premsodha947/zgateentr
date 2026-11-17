@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composition Viewon Z_I_INWARDGATE_HEADER'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_INWARDGATE_HEADER 
provider contract transactional_query
as projection on Z_I_INWARDGATE_HEADER

{
    key GateEntryId,
    InvoiceNo,
    Plant,
    Inwardtype,
    Fiscalyear,
    SystemDate,
    SystemTime,
    InvoiceDate,
    Lrdate,
    Lrnumber,
    Ponumber,
    Ewayno,
    Amount,
    Vehicleno,
    Transporter,
    TransporterCode,
    QRCode,
    Zchalan,
    Vendor,
    Status,
    Remarks,
    MaterialDoc,
    MaterialYear,
    Supplierinv,
    Supplierinvyear,
    Purchasegroup,
    PurchaseGrpdesc,
    Ewaydate,
    Vehicletype,
    Cancelgateentry,
    Deleteduserid,
    Deletedusername,
    Deleteddate,
    Deletedtime,
    Createdby,
    Creatusername,
    /* Associations */
    _Item : redirected to composition child ZC_INWARDGATE_ITEM
}
