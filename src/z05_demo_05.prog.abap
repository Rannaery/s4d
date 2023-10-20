*&---------------------------------------------------------------------*
*& Report z05_demo_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_demo_05.

DATA carrier_id TYPE s_carr_id VALUE 'LH'.
DATA flight_date TYPE s_date VALUE '20231016'.
DATA error.
**********************************************************************
* vergleichsoperatoren
**********************************************************************
* >, >=, <,<=, =, <>
* Logische Operatoren: AND, OR, NOT

**********************************************************************
* Einfachverzweigungen
**********************************************************************

IF  carrier_id = 'UA' OR NOT ( flight_date >= '20230101' AND flight_date <= '20231231' ).
  WRITE 'Bedingung erfüllt'.
ELSE.
  WRITE 'Bedingung nicht erfüllt'.
ENDIF.

IF error IS NOT INITIAL. "if error = abap_true. "IF error = ' '.
  WRITE 'fehler'.
ENDIF.

**********************************************************************
* Komplexe Fallunterscheidungen
**********************************************************************
CASE carrier_id.
  WHEN 'LH' OR 'lH' OR 'Lh' OR 'lh'.
    WRITE 'Lufthansa'.
  WHEN 'UA'.
    WRITE 'Unioted Airlines'.
  WHEN OTHERS.
    WRITE carrier_id.
ENDCASE.
