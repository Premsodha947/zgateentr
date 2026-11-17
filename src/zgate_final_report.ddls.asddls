
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'REPORT CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZGATE_FINAL_REPORT
 as select  from ZGATE_CDS_REP
{
     @UI.lineItem             : [{ position: 10 }]
     @EndUserText.label       : 'Gate Entry No'
     @UI.selectionField: [{ position: 10 }]
    key GateEntryId,
    
     @UI.lineItem             : [{ position: 20 }]
     @EndUserText.label       : 'Status Desc'
    
      key Status_desc,
      
      
     @UI.lineItem             : [{ position: 30 }]
     @EndUserText.label       : 'PO Number / ZChallan'
     @UI.selectionField: [{ position: 20 }]
   key  Ponumber,
   
   
//    @UI.lineItem             : [{ position: 40 }]
//     @EndUserText.label       : 'ZChallan'
//     
//   key Zchalan,
   
   
    @UI.lineItem             : [{ position: 50 }]
     @EndUserText.label       : 'Vendor'
    
  key  Vendor,
  
  @UI.lineItem             : [{ position: 60 }]
     @EndUserText.label       : 'Invoice No'
     @UI.selectionField: [{ position: 30 }]
   key InvoiceNo,
   
   @UI.lineItem             : [{ position: 70 }]
     @EndUserText.label       : 'Amount'
    
   key Amount,
   
     @UI.lineItem             : [{ position: 80 }]
     @EndUserText.label       : 'Material'
     @UI.selectionField: [{ position: 50 }]
   key    Material,
    
     @UI.lineItem             : [{ position: 90 }]
     @EndUserText.label       : 'Gate Entry Item'
     @UI.selectionField: [{ position: 20 }]
   key Itemno,
    
     @UI.lineItem             : [{ position: 100 }]
     @EndUserText.label       : 'Quantity'
     
   key Quantity,
   
    @UI.lineItem             : [{ position: 110 }]
     @EndUserText.label       : 'Material Desc'
    
   key Materialdesc,
   
     @UI.lineItem             : [{ position: 120 }]
     @EndUserText.label       : 'MIRO Document No'
     
   key SupplierInvoice,
   
    @UI.lineItem             : [{ position: 130 }]
     @EndUserText.label       : 'Posted Quantity'
    
   key Postedquantity,
   
    @UI.lineItem             : [{ position: 140 }]
     @EndUserText.label       : 'Inward_Desc'
     
   key Inward_desc,
    
     
    
     @UI.lineItem             : [{ position: 150 }]
     @EndUserText.label       : 'Plant'
     @UI.selectionField: [{ position: 40 }]
   key Plant,
    
    
    
     @UI.lineItem             : [{ position: 160 }]
     @EndUserText.label       : 'Material Doc No'
     @UI.selectionField: [{ position: 60 }]
   key Materialdocno,
    
      
     @UI.lineItem             : [{ position: 170 }]
     @EndUserText.label       : 'Fiscal year'
    
   key Fiscalyear,
    
    
     @UI.lineItem             : [{ position: 180 }]
     @EndUserText.label       : 'Invoice Date'
     
  key  InvoiceDate,
    
     @UI.lineItem             : [{ position: 190 }]
     @EndUserText.label       : 'Lr Date'
   
   key Lrdate,
    
     @UI.lineItem             : [{ position: 200 }]
     @EndUserText.label       : 'Lr Number'
     
   key Lrnumber,
    
    
    
     @UI.lineItem             : [{ position: 210 }]
     @EndUserText.label       : 'Ewayno'
     
  key  Ewayno,
    
     
    
     @UI.lineItem             : [{ position: 220 }]
     @EndUserText.label       : 'Vehicleno'
    
  key  Vehicleno,
    
     @UI.lineItem             : [{ position: 230 }]
     @EndUserText.label       : 'Transporter'
     
  key  Transporter,
       
    
     @UI.lineItem             : [{ position: 240 }]
     @EndUserText.label       : 'Qrcode'
    
  key  Qrcode,
    
       
     @UI.lineItem             : [{ position: 250 }]
     @EndUserText.label       : 'Material year'
    
  key  Materialyear,
  
  
    
//  
   @UI.lineItem             : [{ position: 270 }]
     @EndUserText.label       : 'UOM'
//    
  key  BaseUnit,
//  
  @UI.lineItem             : [{ position: 280 }]
     @EndUserText.label       : 'Supplier Full Name'
     key  SupplierFullName,
//    
//    
    @UI.lineItem             : [{ position: 290 }]
     @EndUserText.label       : 'GoodsMovement Type'
//    
  key  GoodsMovementType,   
   
    
     @UI.lineItem             : [{ position: 300 }]
     @EndUserText.label       : 'Supplier inv year'
    
  key  Supplierinvyear,
    
     @UI.lineItem             : [{ position: 310 }]
     @EndUserText.label       : 'Remarks'
     
   key Remarks,
   
    @UI.lineItem             : [{ position: 320 }]
     @EndUserText.label       : 'Supplier invno'
     
   key  Supplierinvno,
   
   @UI.lineItem             : [{ position: 330 }]
     @EndUserText.label       : 'MIRO Document Posting Date'
     
    supplierdate ,
   
   
    @UI.lineItem             : [{ position: 340 }]
     @EndUserText.label       : 'MIGO Posting Date'
//    
     PostingDate,
     
     @UI.lineItem             : [{ position: 350 }]
     @EndUserText.label       : 'System Date'
//     
    SystemDate,
//    
    @UI.lineItem             : [{ position: 360 }]
     @EndUserText.label       : 'System Time'
//     
    SystemTime,
    
    @UI.lineItem             : [{ position: 370 }]
     @EndUserText.label       : 'Challan No'
//     
     Zchalan
    
}
