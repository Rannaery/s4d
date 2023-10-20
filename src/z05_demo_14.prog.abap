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
SELECT FROM spfli
FIELDS *
WHERE airpfrom = 'FRA'
INTO TABLE @connections.
IF sy-subrc <> 0.
  MESSAGE 'No connection found' TYPE'E'.
ENDIF.


CALL FUNCTION 'Reuse_ALV_GRID_DISPLAY'
  EXPORTING
    i_structure_name = 'SPFLI'
  TABLES
    t_outtab         = connections.

**********************************************************************
* Definition der Zielvariablen
**********************************************************************
" Angabe einer Zielvariable
data connection2 type z05_connection.

SELECT from spfli
fields carrid, connid, cityfrom, cityto
WHERE carrid = @carrier_id AND connid = @connection_id
INTO @connection2.
IF sy-subrc <> 0.
  MESSAGE 'No connection found' TYPE'E'.
ENDIF.

"Kopieren namensgleicher Felder
SELECT Single from spfli
fields carrid, connid, cityfrom, cityto
WHERE carrid = @carrier_id AND connid = @connection_id
INTO CORRESPONDING FIELDS OF @connection.
IF sy-subrc <> 0.
  MESSAGE 'No connection found' TYPE'E'.
ENDIF.
