CLASS zcl_05_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING
                value1        TYPE z00_decimal
                value2        TYPE z00_decimal
      RETURNING VALUE(result) TYPE z00_decimal
      RAISING   cx_sy_zerodivide.

      CLASS-METHODS CALCULATE_PERCENTAGE
      importing
      percentage type ZABAP_DECIMAL
      BASE_VALUE type ZABAP_DECIMAL
      RETURNING VALUE(percentageResult) type ZABAP_DECIMAL.

      CLASS-METHODS CALCULATE_POWER
      importing
      Base type ZABAP_DECIMAL
      Exponent type ZABAP_DECIMAL
      RETURNING VALUE(powerResult) type ZABAP_DECIMAL.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_05_calculator IMPLEMENTATION.
  METHOD divide.
    result = value1 / value2.
  ENDMETHOD.

  METHOD calculate_percentage.
  percentageResult = ( BASE_Value / 100 ) * percentage.
  ENDMETHOD.

    METHOD CALCULATE_POWER.
  powerResult = Base ** Exponent.
  ENDMETHOD.

ENDCLASS.
