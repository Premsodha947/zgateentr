@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gate Entry Final Cds'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZGATE_CDS_REP 
as select distinct from zinward_gate_hdr as a
inner join zinward_gate_itm as b on ( a.gate_entry_id = b.gate_entry_id )
left outer join I_MaterialDocumentHeader_2 as c on ( c.MaterialDocument = a.materialdocno and c.MaterialDocumentHeaderText = a.gate_entry_id)
                                                     // and c.MaterialDocumentYear = a.fiscalyear )
left outer join I_Supplier as d on ( d.Supplier = a.vendor )
left outer join I_Product as e on ( e.Product = b.material )
left outer join I_MaterialDocumentItem_2 as f on ( f.Material = b.material and f.MaterialDocument = a.materialdocno )
                                                  // and  f.MaterialDocumentYear =  c.MaterialDocumentYear)
left outer join I_SupplierInvoiceAPI01 as s on (s.SupplierInvoice = a.gate_entry_id and s.ReverseDocument = ' ' )
{
    key a.gate_entry_id as GateEntryId,
        b.itemno as Itemno,
        a.invoice_no as InvoiceNo,
        a.plant as Plant,
        a.inwardtype as Inwardtype,
        a.fiscalyear as Fiscalyear,
        a.system_date as SystemDate,
        a.system_time as SystemTime,
        a.invoice_date as InvoiceDate,
        a.lrdate as Lrdate,
        a.lrnumber as Lrnumber,
        a.ponumber as Ponumber,
        a.ewayno as Ewayno,
        a.amount as Amount,
        a.vehicleno as Vehicleno,
        a.transporter as Transporter,
        a.zchalan as Zchalan,
        a.vendor as Vendor,
        a.qrcode as Qrcode,
        a.status as Status,
        a.materialdocno as Materialdocno,
        a.materialyear as Materialyear,
        a.supplierinvno as Supplierinvno,
        a.supplierinvyear as Supplierinvyear,
        a.remarks as Remarks,       
        b.material as Material,
        b.materialdesc as Materialdesc,
        b.quantity as Quantity,
        b.postedquantity as Postedquantity ,
           case a.status 
    when '01' then 'ASN Generated'
    when '02' then 'GRN Posted'
    when '03' then 'Invoice Posted'
    when '04' then 'Invoice Cancelled'
    when '05' then 'ASN Cancelled'
    
    else '' 
    end as Status_desc,
    
     case a.inwardtype 
    when 'Standard' then 'Standard'
    when 'RECASIS' then 'Receipt Against Challan'
    when 'RECPO' then 'Receipt Against PO'
    else '' 
    end as Inward_desc,
     
    d.SupplierFullName,
    c.PostingDate ,
    e.BaseUnit,
    f.GoodsMovementType,
    s.SupplierInvoice,
    s.PostingDate as supplierdate
   // s.ReverseDocument
    
    
}
