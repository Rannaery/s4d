*&---------------------------------------------------------------------*
*& Report z05_demo_09
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_demo_09.

TRY.
    DATA(result) = zcl_05_calculator=>divide( value1 = 5 value2 = 0 ).
  CATCH cx_sy_zerodivide into data(e).
  Write / e->get_text( ).
ENDTRY.
WRITE result.
