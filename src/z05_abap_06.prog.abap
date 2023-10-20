*&---------------------------------------------------------------------*
*& Report z05_abap_06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_abap_06.

DATA customer TYPE Z05_Customer.

PARAMETERS id TYPE s_customer.

WRITE / customer-name.
WRITE / customer-city.
WRITE / customer-country.

AT SELECTION-SCREEN.
  TRY.
      customer = zcl_abap_helper=>get_customer(
          customer_id = id
       ).
    CATCH zcx_no_customer_found INTO DATA(expection).
      MESSAGE e000(z05_customer) WITH id.
  ENDTRY.


*Customer-customer_id = '67'.
*Customer-name = 'Hans Maier'.
*Customer-city = 'Walldorf'.
*customer-country = 'de'.
*
*Customer-customer_id = id.
*Customer-name = name.
*Customer-city = city.
*customer-country = country.
*
*Write / Customer-customer_id.
