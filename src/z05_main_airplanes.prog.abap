*&---------------------------------------------------------------------*
*& Report z05_main_airplanes
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_main_airplanes.

DATA plane TYPE REF TO zcl_05_airplane.
DATA planes TYPE TABLE OF REF TO zcl_05_airplane.
TRY.
    plane = NEW zcl_05_passenger_plane( name = 'Airbus' airplane_type = 'A320' number_of_seats = 400 ).
    APPEND plane TO planes.

  CATCH zcx_abap_initial_parameter INTO DATA(e).
    WRITE e->get_text(  ).
ENDTRY.

TRY.
    plane = NEW zcl_05_cargo_plane( name = 'Mitsubishi' airplane_type = 'A6M' cargo_in_tons = 300 ).
    APPEND plane TO planes.
  CATCH zcx_abap_initial_parameter INTO e.
    WRITE e->get_text(  ).
ENDTRY.

TRY.
    plane = NEW zcl_05_airplane( name = 'Avro' airplane_type = 'Anson' ).
    APPEND plane TO planes.
  CATCH zcx_abap_initial_parameter INTO e.
    WRITE e->get_text(  ).
ENDTRY.

LOOP AT planes INTO plane.
  WRITE / plane->to_string(  ).
ENDLOOP.

WRITE / zcl_05_airplane=>number_of_airplanes.
