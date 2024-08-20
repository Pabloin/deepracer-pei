import math

from reward_function import \
         MODE_DEBUG, \
         RECTA_01, RECTA_02, RECTA_03, RECTA_04, RECTA_INI, RECTA_FIN

from reward_function import Track


#----------------------------------
next_wp=63
isRecta1   = Track.isz(RECTA_01, next_wp)
print("isZonaRecta1(", RECTA_01, ",", next_wp, ") = ", isRecta1 )


assert not Track.isz(RECTA_01, 18), "Error en la recta 1 a"
assert     Track.isz(RECTA_01, 25), "Error en la recta 1 b"
assert     Track.isz(RECTA_01, 35), "Error en la recta 1 d"
