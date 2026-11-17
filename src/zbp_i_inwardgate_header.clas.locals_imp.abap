CLASS lhc_z_i_inwardgate_header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR inwardgateheader RESULT result.

   METHODS calculate_non_key_fields FOR DETERMINE ON MODIFY
      IMPORTING keys FOR inwardgateheader~CalculateNonKeyFields.
"   Added by PW
      METHODS check_duplicate_invoice
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR inwardgateheader~check_duplicate_invoice.

      METHODS setCreatedInfo
  FOR DETERMINE ON MODIFY
  IMPORTING keys FOR inwardgateheader~setCreatedInfo.

      METHODS setDeletedInfo
  FOR DETERMINE ON MODIFY
  IMPORTING keys FOR inwardgateheader~setDeletedInfo.


ENDCLASS.
CLASS lsc_z_i_inwardgate_header DEFINITION INHERITING FROM cl_abap_behavior_saver.


  PROTECTED SECTION.
    METHODS adjust_numbers REDEFINITION.
  PRIVATE SECTION.

ENDCLASS.
CLASS lhc_z_i_inwardgate_header IMPLEMENTATION.

"""""""""""""""""""""""""""""""""""""""""""prem"""""""""""""""""""""""""""""""""""""
METHOD setCreatedInfo.

 DATA(lv_username) = cl_abap_context_info=>get_user_description( ).

  MODIFY ENTITIES OF z_i_inwardgate_header IN LOCAL MODE
    ENTITY inwardgateheader
    UPDATE FIELDS ( createdby Creatusername )
    WITH VALUE #(

      FOR key IN keys
      (
        %tky      = key-%tky
        createdby = sy-uname
        creatusername = lv_username
        ) ).
ENDMETHOD.

""""""""""""""""""""""""""""""""""""""""""""

METHOD setDeletedInfo.

  DATA(lv_username1) = cl_abap_context_info=>get_user_description( ).

  READ ENTITIES OF z_i_inwardgate_header IN LOCAL MODE
    ENTITY inwardgateheader
    FIELDS ( cancelgateentry )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

  MODIFY ENTITIES OF z_i_inwardgate_header IN LOCAL MODE
    ENTITY inwardgateheader
    UPDATE FIELDS (
      deleteduserid
      deletedusername
      deleteddate
      deletedtime
    )
    WITH VALUE #(

      FOR ls_data IN lt_data
      WHERE ( cancelgateentry = 'X' )

      (
        %tky = ls_data-%tky

        deleteduserid   = sy-uname
        deletedusername = lv_username1
        deleteddate     = sy-datum
        deletedtime     = sy-timlo
      )

    ).

ENDMETHOD.
""""""""""""""""""""""""""""""""""""""""prem"""""""""""""""""""""""""""""""""""""

"  Added by PW
METHOD check_duplicate_invoice.

   READ ENTITIES OF z_i_inwardgate_header
    ENTITY InwardGateHeader
    FIELDS ( Vendor InvoiceNo FiscalYear )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_header).

  LOOP AT lt_header INTO DATA(ls_header).

    SELECT SINGLE @abap_true
      FROM zinward_gate_hdr
      WHERE vendor     = @ls_header-Vendor
        AND invoice_no = @ls_header-InvoiceNo
        AND fiscalyear = @ls_header-FiscalYear
      INTO @DATA(lv_exists).

    IF lv_exists = abap_true.

      APPEND VALUE #(
        %key = ls_header-%key
        %msg = new_message(
                 id       = 'ZIG'
                 number   = '001'
                 severity = if_abap_behv_message=>severity-error
                 v1       = 'Gate entry already exists for this Vendor, Invoice and Fiscal Year'
               )
      ) TO reported-inwardgateheader.

    ENDIF.

  ENDLOOP.

ENDMETHOD.

"  End addition '

  METHOD get_instance_authorizations.
  ENDMETHOD.
 METHOD calculate_non_key_fields.

 DATA: lt_reported  TYPE RESPONSE FOR REPORTED z_i_inwardgate_header,
          lt_failed  TYPE RESPONSE FOR FAILED z_i_inwardgate_header.

   READ ENTITIES OF z_i_inwardgate_header IN LOCAL MODE
      ENTITY inwardgateheader
        FIELDS ( gateentryid ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_entities).

    " Update non-key fields
    MODIFY ENTITIES OF z_i_inwardgate_header IN LOCAL MODE
      ENTITY inwardgateheader
        UPDATE FIELDS ( qrcode )
        WITH VALUE #( FOR ls_entity IN lt_entities
                      ( %key = ls_entity-%key
                        qrcode = 'IN' && ls_entity-gateentryid
                        ) )
      REPORTED lt_reported
      FAILED lt_failed.

  ENDMETHOD.

ENDCLASS.
CLASS lsc_z_i_inwardgate_header IMPLEMENTATION.
  METHOD adjust_numbers.
    DATA: nr_number  TYPE cl_numberrange_runtime=>nr_number,
          l_nr_range TYPE cl_numberrange_runtime=>nr_interval.

    LOOP AT mapped-inwardgateheader ASSIGNING FIELD-SYMBOL(<fs_mapped>).
      IF <fs_mapped>-gateentryid IS INITIAL.

        READ ENTITIES OF z_i_inwardgate_header IN LOCAL MODE
        ENTITY inwardgateheader
        ALL FIELDS
        WITH CORRESPONDING #( mapped-inwardgateheader )
        RESULT DATA(lt_inwardgateheader).

        READ TABLE lt_inwardgateheader INTO DATA(ls_inwardgateheader) INDEX 1.
        IF ls_inwardgateheader-Plant = '1101'.
          l_nr_range = '01'.
        ELSE.
          IF  ls_inwardgateheader-Plant = '1102'.
            l_nr_range = '02'.
          ELSE.
            IF  ls_inwardgateheader-Plant = '1201'.
              l_nr_range = '03'.
            ELSE.
              IF  ls_inwardgateheader-Plant = '1202'.
                l_nr_range = '04'.
              ELSE.
                IF  ls_inwardgateheader-Plant = '1301'.
                  l_nr_range = '05'.
                ELSE.
                  IF  ls_inwardgateheader-Plant = '1302'.
                    l_nr_range = '06'.
                  ELSE.
                    IF  ls_inwardgateheader-Plant = '1401'.
                      l_nr_range = '07'.
                    ELSE.
                      IF  ls_inwardgateheader-Plant = '1501'.
                        l_nr_range = '08'.
                      ELSE.
                        IF ls_inwardgateheader-Plant = '1601'.
                        l_nr_range = '09'.
                        ENDIF.
                      ENDIF.
                    ENDIF.
                  ENDIF.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.

        TRY.
            cl_numberrange_runtime=>number_get(
              EXPORTING
                nr_range_nr = l_nr_range
                object      = 'ZMM_IGE_NR'
              IMPORTING
                number      = nr_number
            ).

            SHIFT nr_number LEFT DELETING LEADING '0'.

            <fs_mapped>-gateentryid  = nr_number.
*            <fs_mapped>-createdby = sy-uname.
            IF <fs_mapped>-gateentryid IS INITIAL.
              APPEND VALUE #( %key = <fs_mapped>-%key
                              %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                            text = 'Cannot assign unique GateEntryId' ) )
                     TO reported-inwardgateheader.
            ENDIF.

          CATCH cx_number_ranges INTO DATA(lx_nr).
            APPEND VALUE #( %key = <fs_mapped>-%key
                            %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                          text = lx_nr->get_text( ) ) )
                   TO reported-inwardgateheader.
        ENDTRY.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
