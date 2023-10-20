*&---------------------------------------------------------------------*
*& Report z05_demo_14
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_demo_14.

DATA connection TYPE spfli. "Struktur
DATA connections TYPE TABLE OF spfli. "Interne Tabelle
DATA carrier_id TYPE s_carr_id VALUE 'LH'.
DATA connection_id TYPE s_conn_id VALUE '0400'.
* SQL Standard
* SELECT [ Spalten ]
* FROM [ Datenbanktabelle ]
* WHERE [ Zeilen ]

* OpenSQL
* Select from [Datenbanktabelle]
* Fields [ Spalte 1 ], [ Spalte 2 ]...
* Where [ bedingung ]
* into [ zielvariable ]
**********************************************************************
* Lesen eines Einzelsatzes
**********************************************************************
SELECT SINGLE FROM spfli
FIELDS *
WHERE carrid = @carrier_id AND connid = @connection_id
INTO @connection.
IF sy-subrc <> 0.
  MESSAGE 'No connection found' TYPE'E'.
ENDIF.

**********************************************************************
* Lesen mehrerer Datensätze
**********************************************************************
SELECT from spfli
fields *
where airpfrom = 'FRA'
into table @connections.
if sy-subrc <> 0.
  MESSAGE 'No connection found' TYPE'E'.
  Endif.

  cl_salv_table=>factory(
    EXPORTING
      list_display   = if_salv_c_bool_sap=>true "Or 'X'
    IMPORTING
      r_salv_table   = data(alv)
    CHANGING
      t_table        = connections ).
      alv->display( ).
