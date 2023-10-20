CLASS zcl_05_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA name TYPE string READ-ONLY.
    DATA airplane_type TYPE string READ-ONLY.
    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.
    METHODS constructor
      IMPORTING
                name          TYPE string
                airplane_type TYPE string
      RAISING   zcx_abap_initial_parameter.

    METHODS to_string RETURNING VALUE(string) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_airplane IMPLEMENTATION.
  METHOD constructor.
    IF name IS INITIAL.
      RAISE EXCEPTION TYPE zcx_abap_initial_parameter EXPORTING parameter = 'NAME' .
    ENDIF.
    IF airplane_type IS INITIAL.
      RAISE EXCEPTION TYPE zcx_abap_initial_parameter EXPORTING parameter = 'plane_typ' .
    ENDIF.
    me->name = name.
    me->airplane_type = airplane_type.
    number_of_airplanes += 1.

  ENDMETHOD.

  METHOD to_string.
    string = |Plane: { name } { airplane_type }|.
  ENDMETHOD.

ENDCLASS.
