CLASS zcl_05_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_05_vehicle
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                cargo_in_tons TYPE i
      RAISING   zcx_05_initial_parameter.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_05_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make = make model = model ).

    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    string = |Truck: { make } { model }: { cargo_in_tons }t|.
  ENDMETHOD.
ENDCLASS.
