CLASS zcl_05_passenger_plane DEFINITION
  PUBLIC
  FINAL

  CREATE PUBLIC
  INHERITING FROM zcl_05_airplane.

  PUBLIC SECTION.
data number_of_seats type i.
    METHODS constructor
      IMPORTING name          TYPE string
                airplane_type TYPE string
                number_of_seats type i
      RAISING   zcx_abap_initial_parameter.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_passenger_plane IMPLEMENTATION.
  METHOD constructor.

    super->constructor( name = name airplane_type = airplane_type ).
    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD to_string.
  string = |{ name } { airplane_type } { number_of_seats }|.
  ENDMETHOD.

ENDCLASS.
