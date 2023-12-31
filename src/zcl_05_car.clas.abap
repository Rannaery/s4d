CLASS zcl_05_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  INHERITING FROM zcl_05_vehicle. " public class Car extends Vehicle

  PUBLIC SECTION.
    DATA number_of_seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING make            TYPE string
                model           TYPE string
                number_of_seats TYPE i
      RAISING   zcx_05_initial_parameter.

    METHODS to_string REDEFINITION. "@Override public String toString()

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_05_car IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make = make model = model ).

    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model } ({ number_of_seats } Seats)|.
  ENDMETHOD.
ENDCLASS.
