*&---------------------------------------------------------------------*
*& Report z05_abap_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_abap_08.

PARAMETERS p_cid type s_customer.
data bookings type table of ZABAP_BOOKING.

try.
bookings = zcl_05_helper=>get_bookings( customer_id = p_cid  ).
catch zcx_no_booking_found into data(e).
MESSAGE e->get_text(  ) type 'E'.
endtry.

delete bookings where flight_date < sy-datum.

loop at bookings reference into data(booking).
booking->price *='1.1'.
endloop.

sort bookings by price DESCENDING.

cl_demo_output=>display( bookings ).
