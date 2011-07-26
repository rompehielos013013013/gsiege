;
; traducirM.clp
;
; Fichero de traducción de movimientos a movimientos reales
; esto quiere decir que para el equipo A se quedan igual pero
; para el B se hacen los simétricos
;
; Manuel Palomo Duarte, 2007
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

;
; M'odulo TRADUCIRM
;
; Cada movimiento se sustituye por su simétricos
;

(defmodule TRADUCIRM
  (import MAIN deftemplate initial-fact ficha ficha-r dimension tiempo mueve)
  (import MAIN deffunction ?ALL))

;
;

(defrule TRADUCIRM::traducir
  (declare (salience 10))
  (tiempo ?t)
;  (test (<> 0 (mod ?t 2)))
  ?h1 <- (mueve (num ?n) (mov ?m) (tiempo ?t))
  (ficha-r (equipo "B") (num ?n))
  (not (traducido ?n ?t))
  =>
  (retract ?h1)
;  (printout t "Traducido mov ficha-r n" ?n "de  "?m" a " (simetrico ?m) crlf)
  (assert (traducido ?n ?t))
  (assert (mueve (num ?n) (mov (simetrico ?m)) (tiempo ?t))))



