*&---------------------------------------------------------------------*
*& Report z05_demo_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_demo_08.

**********************************************************************
* Definitionen und Deklarationen
**********************************************************************
PARAMETERS p_cid TYPE s_carr_id.
PARAMETERS p_chckbx AS CHECKBOX.

PARAMETERS p_opt1 RADIOBUTTON GROUP opts.
PARAMETERS p_opt2 RADIOBUTTON GROUP opts.
PARAMETERS p_opt3 RADIOBUTTON GROUP opts.


**********************************************************************
* Dynamische Vorbelegung
**********************************************************************
INITIALIZATION.
    if sy-langu = 'E'.
    p_chckbx = abap_true.
    Endif.

**********************************************************************
* Eingabeprüfung
**********************************************************************
AT SELECTION-SCREEN on p_chckbx.
  IF p_chckbx = 'X'. "IF p_chckbx = abap_true.
    MESSAGE e000(z05) WITH sy-uname.
    WRITE 'Kontrollkästchen gesetzt'.
  ENDIF.

**********************************************************************
* Hauptverarbeitung
**********************************************************************
Start-of-SELECTION.
  CASE abap_true.
    WHEN p_opt1.
      WRITE 'Option 1 gesetzt'.
    WHEN p_opt2.
      WRITE 'Option 2 gesetzt'.
    WHEN p_opt3.
      WRITE 'Option 3 gesetzt'.
  ENDCASE.
