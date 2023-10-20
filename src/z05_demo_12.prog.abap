*&---------------------------------------------------------------------*
*& Report z05_demo_12
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_demo_12.

**********************************************************************
* Deklaration interner Tabellen
**********************************************************************
DATA connections TYPE z05_connections. "Type Tabellentyp
DATA connection2 TYPE TABLE OF z05_connection. "Typle Table of strukturtyp

**********************************************************************
* Hinzufügen von Datensätzen
**********************************************************************
connections = VALUE #(
    ( carrier_id = 'LH' connection_id = '0400' arrival_city = 'NEW YORK' )
    ( carrier_id = 'UA' connection_id = '0400' departure_city = 'NEW YORK' )
    ( carrier_id = 'LH' arrival_city = 'FRAKFURT' ) ).

connections = VALUE #( BASE connections ( carrier_id = 'AA' connection_id = '0017' arrival_city = 'ROM' ) ).

APPEND VALUE #( connection_id = '0401' ) TO connections.

DATA connection TYPE z05_connection.
connection-arrival_city = 'MADRID'.
connection-departure_city = 'BERLIN'.
APPEND connection TO connections.
connections = VALUE #( BASE connections ( connection ) ).

**********************************************************************
* Lesen von Datensätzen
**********************************************************************
" Lesen eines Einzelsatzes

connection = connections[ 1 ]. "Index

IF line_exists( connections[ 1 ] ).
  connection = connections[ 1 ]. "Index
ENDIF.

TRY.
    connection = connections[ carrier_id = 'AA' connection_id = '0017' ].
  CATCH cx_sy_itab_line_not_found.
ENDTRY.

" Lesen mehrerer Datensätze
LOOP AT connections INTO connection WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  WRITE: / sy-tabix,  connection.
ENDLOOP.

**********************************************************************
* Ändern von Datensätzen
**********************************************************************
* Ändern eines Einzelsatzes

connections[ 1 ]-departure_city = 'FRANKFURT'."Index
connections[ carrier_id = 'AA' connection_id = '0017' ]-departure_city = 'WALLDORF'. "Komponent

" Ändern mehrerer Datensätze
DATA connection_r TYPE REF TO z05_connection.

LOOP AT connections REFERENCE INTO connection_r WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  connection_r->carrier_id = 'LHD'.
*connections[ sy-tabix ]-carrier_id = 'LHD'.
ENDLOOP.

**********************************************************************
* Sortieren
**********************************************************************
SORT connections BY carrier_id DESCENDING connection_id ASCENDING departure_city DESCENDING.

**********************************************************************
* Löschen
**********************************************************************
* Löschen eines Einzelsatzes
DELETE connections INDEX 4.
DELETE connections FROM connection.

* Löschen mehrerer Datemnsätze
DELETE connections WHERE arrival_city IS INITIAL.

**********************************************************************
* Größe
**********************************************************************
Write / lines( connections ).

WRITE ''.
