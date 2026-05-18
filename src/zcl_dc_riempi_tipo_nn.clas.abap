CLASS zcl_dc_riempi_tipo_nn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS lm_riempi
      IMPORTING
        i_out TYPE REF TO if_oo_adt_classrun_out.


ENDCLASS.



CLASS zcl_dc_riempi_tipo_nn IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
lm_riempi( i_out = out ).
  ENDMETHOD.


  METHOD lm_riempi.
    DATA: lt_tipo_utente TYPE table of ztipo_dc_nn.
  lt_tipo_utente = VALUE #( (
        id = '00'
        descr = 'Bambino'
        limit = 'Tra 8 e 12 anni'
        prezzo = '4'
        valuta = 'EUR' ) (
        id = '01'
        descr = 'Adulto'
        limit = 'Tra 13 e 65 anni'
        prezzo = '8'
        valuta = 'EUR' ) (
        id = '02'
        descr = 'Anziano'
        limit = '66+'
        prezzo = '3'
        valuta = 'EUR' ) ).

           DELETE FROM ztipo_dc_nn.

    INSERT ztipo_dc_nn
        FROM TABLE @lt_tipo_utente.
    IF sy-subrc IS INITIAL.
      COMMIT WORK AND WAIT.
      i_out->write(
        EXPORTING
          data   = lt_tipo_utente
          name   = 'OK'
*          RECEIVING
*            output =
      ).
    ELSE.
      ROLLBACK WORK.
      i_out->write(
        EXPORTING
          data   = lt_tipo_utente
          name   = 'KO'
*          RECEIVING
*            output =
      ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
