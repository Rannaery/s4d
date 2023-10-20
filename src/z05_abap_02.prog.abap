*&---------------------------------------------------------------------*
*& Report z05_abap_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_abap_02.

PARAMETERS id type s_customer.
PARAMETERS name type s_custname.
PARAMETERS country type s_country.
PARAMETERS city type city.

WRITE: / | { id }, { name }, { city }, ({ country })|.
