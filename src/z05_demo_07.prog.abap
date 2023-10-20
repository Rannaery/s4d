*&---------------------------------------------------------------------*
*& Report z05_demo_07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_demo_07.

PARAMETERS p_cid TYPE s_carr_id.
PARAMETERS p_cid2 TYPE c LENGTH 3.

WRITE TEXT-sf1.

WRITE / |Anmeldename: { sy-uname }|.
WRITE / |Datum des Servers: { sy-datum DATE = USER }|.
WRITE / |Zeit des Servers: { sy-uzeit TIME = USER }|.
WRITE / |Datum des Client: { sy-datlo }|.
WRITE / |Zeit des Client: { sy-timlo }|.
WRITE / |Anmeldemandant: { sy-mandt }|.
WRITE / |Anmeldesprache: { sy-langu }|.
