CLASS zcl_05_cargo_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_05_airplane
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i.
    METHODS constructor
      IMPORTING name          TYPE string
                airplane_type TYPE string
                cargo_in_tons TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_cargo_plane IMPLEMENTATION.
  METHOD constructor.

    super->constructor( name = name airplane_type = airplane_type ).
    me->cargo_in_tons = cargo_in_tons.

  ENDMETHOD.

  METHOD to_string.
    string = |{ name } { airplane_type } { cargo_in_tons }|.
  ENDMETHOD.

ENDCLASS.
