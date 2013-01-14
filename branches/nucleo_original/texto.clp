;
; texto.clp
;
; Fichero de informacion en texto
;
; Manuel Palomo Duarte, 2007
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

;
; M'odulo INFORMAR
;
; Muestra los n'umeros de las posiciones del tablero, para
;  poder controlar mejor los movimientos
;

(defmodule INFORMAR
  (import MAIN deftemplate initial-fact ficha-r obstaculo obstaculo-r dimension tiempo)
  (import MAIN deffunction ?ALL))


;
; Regla Informaci'on : escribe en el fichero
;  informacion sobre la posicion de las fichas
;

(defrule INFORMAR::informacion
  (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y) (descubierta ?d))
  (tiempo ?t)
  (not (impresa ?n ?t))
  =>
  (assert (impresa ?n ?t))
  (open "temporal.txt" fich "a")
  (a-fichero-jugador ?e ?n ?p ?x ?y ?d)
  (close fich)
)

;  (por-pantalla-jugador ?e ?n ?p ?x ?y ?d))

(defrule INFORMAR::inicial
  (declare (salience 100))
  (tiempo ?t)
  (not (iniciado ?t))
  (dimension ?dim)
  =>
;  (printout t "*****" crlf)
  (open "temporal.txt" fich "a")
  (a-fichero-tiempo ?t)
  (close fich)
  (assert (iniciado ?t))
  (assert (fila (+ 1 ?dim)))
  (assert (columna (+ 1 ?dim))))

(defrule INFORMAR::vacia
  (declare (salience 10))
  ?c <- (columna ?x)
  (fila ?y)
  (dimension ?dim)
  (test (not (> ?x ?dim)))
  (not (ficha-r (pos-x ?x) (pos-y ?y)))
  (not (obstaculo-r (pos-x ?x) (pos-y ?y)))
  =>
  (retract ?c)
  (assert (columna (+ ?x 1)))
;  (printout t "(1)" crlf)
  (printout t "    "))

(defrule INFORMAR::noVaciaFicha
  (declare (salience 10))
  ?c <- (columna ?x)
  (fila ?y)
  (dimension ?dim)
  (test (not (> ?x ?dim)))
  (ficha-r (equipo ?e) (pos-x ?x) (pos-y ?y) (puntos ?v) (descubierta ?d))
  =>
  (retract ?c)
  (assert (columna (+ ?x 1)))
  (printout t " " ?e ?v (valor ?d)))

(defrule INFORMAR::noVaciaObstaculo
  (declare (salience 10))
  ?c <- (columna ?x)
  (fila ?y)
  (dimension ?dim)
  (test (not (> ?x ?dim)))
  (obstaculo-r (pos-x ?x) (pos-y ?y))
  =>
  (retract ?c)
  (assert (columna (+ ?x 1)))
  (printout t " ###"))

(defrule INFORMAR::siguienteFila
  (declare (salience 20))
  (dimension ?dim)
  ?c <- (columna ?x)
  (test (> ?x ?dim))
  ?f <- (fila ?y)
  (test (not (<= ?y 1)))
  =>
  (retract ?c ?f)
  (assert (fila (- ?y 1)))
  (assert (columna 1))
  (printout t crlf (- ?y 1) "|"))

(defrule INFORMAR::filaFinal
  (declare (salience 20))
  (dimension ?dim)
  ?c <- (columna ?x)
  (test (> ?x ?dim))
  ?f <- (fila ?y)
  (test (= 1 ?y))
  =>
  (retract ?c ?f)
  (printout t crlf "----------------------------------" crlf 
	    "x:  1   2   3   4   5   6   7   8" crlf)
  ;(readline)
)


;
; Regla fin1 : renombra el fichero temporal.txt a
;  resultado.txt
;

(defrule INFORMAR::fin1
  (declare (salience -100))
  (tiempo ?t&0)
  =>
;  (close fich)
  (printout t "Fin del tiempo" crlf)		
  (rename "temporal.txt" "resultado.txt"))

;
; Regla fin-sin-rey1 : 
;

(defrule INFORMAR::fin-sin-rey1
  (declare (salience -100))
  ?c <- (tiempo ?t&~0)
  (not (ficha-r (equipo "A") (puntos 1)))
  =>
;  (close fich)
  (printout t "Rey del equipo A muerto" crlf)
  (rename "temporal.txt" "resultado.txt"))

;
; Regla control-sin-rey2 : 
;

(defrule INFORMAR::fin-sin-rey2
  (declare (salience -100))
  ?c <- (tiempo ?t&~0)
  (not (ficha-r (equipo "B") (puntos 1)))
  =>
;  (close fich)
  (printout t "Empate, fin del tiempo" crlf)		
  (printout t "Rey del equipo B muerto" crlf)
  (rename "temporal.txt" "resultado.txt"))
