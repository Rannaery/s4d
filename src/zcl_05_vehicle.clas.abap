CLASS zcl_05_vehicle DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA make TYPE string READ-ONLY.
    DATA model TYPE string READ-ONLY.
    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.
    METHODS constructor
      IMPORTING
        make  TYPE string
        model TYPE string
       raising zcx_05_initial_parameter.
    METHODS to_string RETURNING VALUE(string) TYPE string.
  PROTECTED SECTION.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_05_vehicle IMPLEMENTATION.
  METHOD constructor.

  if make is INITIAL.
 raise EXCEPTION type zcx_05_initial_parameter exporting parameter = 'MAKE' .
    endif.

    if model is initial.
     raise EXCEPTION type zcx_05_initial_parameter exporting parameter = 'MODEL' .
    endif.
        me->make = make.
    me->model = model.
    number_of_vehicles += 1.
  ENDMETHOD.

  METHOD to_string.
    string = |Vehicle: { make } { model }|.
  ENDMETHOD.

ENDCLASS.
