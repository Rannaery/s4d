*&---------------------------------------------------------------------*
*& Report z05_demo_11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_demo_11.

data connection type z00_connection.
data flight type z00_flight.
data flight_with_connection type z00_flight_with_connection.

connection-carrier_id = 'LH'.
connection-connection_id = '0400'.
connection-departure_city = 'Frankfurt'.

flight-carrier_id = 'LH'.
flight-connection_id = '0400'.
flight-flight_date = sy-datum.
flight-price = 678.
flight-currency_code = 'EUR'.

flight_with_connection = CORRESPONDING #( connection ).
flight_with_connection = CORRESPONDING #( base ( flight_with_connection ) flight ).
