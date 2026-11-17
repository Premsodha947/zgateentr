CLASS zcl_gateentry_dummy_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GATEENTRY_DUMMY_DATA IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
DATA: it_gateentryhdr TYPE STANDARD TABLE OF zinward_gate_hdr,
          ls_gateentryhdr TYPE zinward_gate_hdr,
          it_gateentryitem type standard table of zinward_gate_itm,
          ls_gateentryitm type zinward_gate_itm.


    " Populate a single row with dummy record for hdr
    ls_gateentryhdr = VALUE #(
      gate_entry_id = 'DUMMY005'
      invoice_no   = 'INV001'
      plant       = 'PL01'
      inwardtype  = 'Standard'
      fiscalyear  = '2025'
      system_date  = '20241229'
      invoice_date = '20241229'
      lrdate      = '20241229'
      lrnumber    = 'LR12345'
      ponumber    = '4900000009'
      ewayno      = 'EWAY123456'
      amount      = '1500.00'
      vehicleno   = 'SG1234A'
      transporter = 'ABC Trans'
      status       = '01'
    ).

    " Populate a single row with dummy record for its
    ls_gateentryitm = VALUE #(
      gate_entry_id = 'DUMMY005'
      ponumber    = '4900000009'
      itemno      = '00020'
      material      = 'MATNR002'
      materialdesc      = 'Material  Desc 001'
      quantity   = '10.00'
      postedquantity = '5.00'

    ).

    " Add the row to the internal table
    APPEND ls_gateentryhdr TO it_gateentryhdr.
    APPEND ls_gateentryitm TO it_gateentryitem.
    "delete from zinward_gate_hdr where gate_entry_id = '66776'.
    " Insert data into the database table
*    INSERT zinward_gate_hdr FROM TABLE @it_gateentryhdr.
*    IF sy-subrc = 0.
*      COMMIT WORK AND WAIT.
*      out->write( |Successfully inserted { sy-dbcnt } record(s) into ZINWARD_GATE_HDR| ).
*    ELSE.
*      ROLLBACK WORK.
*      out->write( |Failed to insert data into ZINWARD_GATE_HDR. SY-SUBRC = { sy-subrc }| ).
*      RETURN.
*    ENDIF.
*
*     INSERT zinward_gate_itm FROM TABLE @it_gateentryitem.
*    IF sy-subrc = 0.
*      COMMIT WORK AND WAIT.
*      out->write( |Successfully inserted { sy-dbcnt } record(s) into ZINWARD_GATE_ITM| ).
*    ELSE.
*      ROLLBACK WORK.
*      out->write( |Failed to insert data into ZINWARD_GATE_ITM. SY-SUBRC = { sy-subrc }| ).
*      RETURN.
*    ENDIF.
*delete from ztb_po_hdr_param.
*  delete from ztb_po_itemparam.
delete from ztb_serv_entry.

    " Optional: Display the inserted data
    LOOP AT it_gateentryhdr INTO ls_gateentryhdr.
      out->write( ls_gateentryhdr ).
    ENDLOOP.

endmethod.
ENDCLASS.
