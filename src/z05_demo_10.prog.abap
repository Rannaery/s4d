*&---------------------------------------------------------------------*
*& Report z05_demo_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_demo_10.
**********************************************************************
* Deklaration von Struktur
**********************************************************************
DATA connection Type z05_connection.

**********************************************************************
* Zugriff auf Strukturkomponenten
**********************************************************************

connection-carrier_id = 'LH'.
connection-connection_id = '0400'.
connection-departure_city = 'Frankfurt'.
connection-arrival_city = 'NEW YORK'.

Write: connection-carrier_id, connection-connection_id.
