*&---------------------------------------------------------------------*
*& Report z05_main_vehicles
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_main_vehicles.

DATA vehicle TYPE REF TO zcl_05_vehicle. "Sagt nur, wo sich das Objekt befindet, nicht das Objekt, wegen dem Ref to!
*DATA(vehicle2) = NEW zcl_05_vehicle(  ).
DATA vehicles TYPE TABLE OF REF TO zcl_05_vehicle. " Interne Tabelle zum speichern von Referenzen für Fahrzeuge

WRITE zcl_05_vehicle=>number_of_vehicles.

TRY.
    vehicle = NEW zcl_05_car( make = 'VW' model = 'Up' number_of_seats = 4 ).
    APPEND vehicle TO vehicles.

    WRITE zcl_05_vehicle=>number_of_vehicles.
  CATCH zcx_05_initial_parameter INTO DATA(e).
    WRITE e->get_text(  ).
ENDTRY.

TRY.
    vehicle = NEW zcl_05_truck( make = 'MAN' model = 'TGX' cargo_in_tons = 40 ). "Upcast
    APPEND vehicle TO vehicles.
  CATCH zcx_05_initial_parameter INTO e.
    WRITE e->get_text(  ).
ENDTRY.
WRITE zcl_05_vehicle=>number_of_vehicles.

LOOP AT vehicles INTO vehicle. "Dynamische Polymorphie
  WRITE / vehicle->to_string(  ).
ENDLOOP.
