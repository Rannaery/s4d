*&---------------------------------------------------------------------*
*& Report z05_demo_04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z05_demo_04.

data text type string value 'Hello'.
data text2 type string value 'world'.
Data text3 type string.

text3 = text && | | && text2.
write text3.

text3 = |{ text } { text2 }|.
write / text3.

write / |Länge von Text3: { strlen( text3 ) }|.
