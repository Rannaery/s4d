CLASS zcl_05_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_05_vehicle
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA cargo_in_tons type i READ-ONLY.

  methods constructor
  importing
  make type string
  model type string
  cargo_in_tons type i
  raising zcx_05_initial_parameter.
  methods to_string redefinition.
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
