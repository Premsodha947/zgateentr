CLASS zgate_entry_report_migo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
       CLASS-METHODS :
      grn_status
        IMPORTING materialdocument           TYPE string
                  goodsmovementtype            TYPE string
                  asn_no       TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZGATE_ENTRY_REPORT_MIGO IMPLEMENTATION.


METHOD grn_status .

DATA grn_status TYPE zvendor_head_tab.
  data msg tYPE string.
  DATA asn TYPE ZASN_NO.
  asn = asn_no.
if goodsmovementtype = '101' .
 grn_status-asn_no  = asn.
 grn_status-materialdocno  = materialdocument.
 grn_status-status = '04' .
 grn_status-goodsmovementtype = goodsmovementtype .
 else .
 grn_status-asn_no  = asn_no.
 grn_status-materialdocno  = materialdocument.
 grn_status-status = '03' .
 grn_status-goodsmovementtype = goodsmovementtype .
  ENDIF.
  MODIFY zvendor_head_tab FROM @grn_status .
*  IF sy-subrc <> 0.
*  msg = 'Z table update failed' .
*ENDIF.
*  COMMIT WORK AND WAIT.
  ENDMETHOD .
ENDCLASS.
