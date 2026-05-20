CLASS lhc_zi_biglietto_dc2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR biglietto
        RESULT result,
      earlynumbering_create FOR NUMBERING
        IMPORTING entities FOR CREATE biglietto.
ENDCLASS.

CLASS lhc_zi_biglietto_dc2 IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD earlynumbering_create.
    DATA:
*      lv_id_MAX TYPE zi_biglietto_DC2-Id,
      lv_id     TYPE zi_biglietto_DC2-Id,
      lv_id_max TYPE cl_numberrange_runtime=>nr_number.

*    SELECT MAX( Id )
*        FROM zi_biglietto_DC2
*        INTO @lv_id.

*    WITH
*         +max AS (
*             SELECT MAX( Id ) AS IdBiglietto
*                 FROM zi_biglietto_DC2
*             UNION ALL
*             SELECT MAX( Id ) AS IdBiglietto
*                 FROM zbiglietto_dc2_d
*         )
*         SELECT MAX( IdBiglietto )
*             FROM +max
*             INTO @lv_id_MAX.

    LOOP AT entities
            INTO DATA(ls_entity).
      IF ls_entity-id IS INITIAL.
*        lv_id_max += 1.
*        lv_id = lv_id_max.
        TRY.
            cl_numberrange_runtime=>number_get(
              EXPORTING
*            ignore_buffer     =
                nr_range_nr       = '01'
                object            = 'ZID_BIG_DC'
                quantity          = 1
*            subobject         =
*            toyear            =
              IMPORTING
                number            =  lv_id_max
*            returncode        =
*            returned_quantity =
            ).
            lv_id = lv_id_max.
          CATCH cx_nr_object_not_found.
          CATCH cx_number_ranges.
        ENDTRY.
      ELSE.
        lv_id = ls_entity-id.
      ENDIF.

      APPEND VALUE #(
          %cid = ls_entity-%cid
          %is_draft = ls_entity-%is_draft
          Id = lv_id
      ) TO mapped-biglietto.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
