CLASS zcl_dc_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dc_hello_world IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.
    out->write(
  EXPORTING
    data   = 'Hello World'
    name   = 'Descrizione'
*  RECEIVING
*    output =
).

    SELECT * FROM /dmo/flight
      INTO TABLE @DATA(lt_flight).

      out->write(
        EXPORTING
          data   = lt_flight
          name   = 'Voli'
*        RECEIVING
*          output =
      ).


      ENDMETHOD.

ENDCLASS.
