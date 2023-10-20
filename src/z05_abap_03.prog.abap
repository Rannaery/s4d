*&---------------------------------------------------------------------*
*& Report z05_abap_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_abap_03.

PARAMETERS zahl_1 TYPE zabap_decimal OBLIGATORY.
PARAMETERS zahl_2 TYPE zabap_decimal OBLIGATORY.
*PARAMETERS operator type c length 1.



**********************************************************************
TYPE-POOLS: vrm.

DATA: name  TYPE vrm_id,
      list  TYPE vrm_values,
      value LIKE LINE OF list.

PARAMETERS ps_parm(4) AS LISTBOX VISIBLE LENGTH 4.

AT SELECTION-SCREEN OUTPUT.

  name = 'PS_PARM'.

  value-key = '+'.
  value-text = '+'.
  APPEND value TO list.

  value-text = '-'.
  value-key = '-'.
  APPEND value TO list.

  value-text = '*'.
  value-key = '*'.
  APPEND value TO list.

  value-text = '/'.
  value-key = '/'.
  APPEND value TO list.

  value-text = '%'.
  value-key = '%'.
  APPEND value TO list.

  value-text = '^'.
  value-key = '^'.
  APPEND value TO list.

  CALL FUNCTION 'VRM_SET_VALUES' EXPORTING id = name values = list.

**********************************************************************
* Fehler check
**********************************************************************
AT SELECTION-SCREEN ON ps_parm.
  IF ps_parm <> '+' AND ps_parm <> '-' AND ps_parm <> '*' AND ps_parm <> '/' AND ps_parm <> '%' AND ps_parm <> '^'.
    MESSAGE e003(z05).
  ENDIF.

AT SELECTION-SCREEN ON zahl_1 .
  IF zahl_1 = ''.
    MESSAGE e002(z05).
  ENDIF.

AT SELECTION-SCREEN ON zahl_2 .
  IF zahl_2 = '' OR ps_parm = '/' AND zahl_2 = '0'.
    MESSAGE e002(z05).
  ENDIF.

**********************************************************************
* Hauptverarbeitung
**********************************************************************
START-OF-SELECTION.
  WRITE ps_parm.

  CASE ps_parm.
    WHEN '+'.
      WRITE |{ zahl_1 + zahl_2 }|.
    WHEN '-'.
      WRITE |{ zahl_1 - zahl_2 }|.
    WHEN '/'.
      WRITE |{ zahl_1 / zahl_2 }|.
    WHEN '*'.
      WRITE |{ zahl_1 * zahl_2 }|.
    WHEN '%'.
      TRY.
          DATA(result) = zcl_05_calculator=>calculate_percentage( base_value = zahl_1 percentage = zahl_2 ).
          WRITE result.
        CATCH cx_sy_zerodivide INTO DATA(e).
          WRITE / e->get_text( ).
      ENDTRY.
    WHEN '^'.
      DATA(powerResult) = zcl_05_calculator=>calculate_power( base = zahl_1 exponent = zahl_2 ).
      WRITE: text-res, powerResult.

  ENDCASE.
