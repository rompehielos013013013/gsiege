;
; mover.clp
;
; Fichero que realiza un movimiento
;
; Manuel Palomo Duarte, 2007
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Definicion del mo'dulo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; M'odulo MOVER
;
; Se encarga de hacer el movimiento indicado por el equipo
;

(defmodule MOVER
  (import MAIN deftemplate initial-fact ficha-r obstaculo obstaculo-r dimension tiempo mueve)
  (import MAIN deffunction ?ALL))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Definicion de reglas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Regla movimiento: realiza un movimiento a una casilla vacia
;


(defrule MOVER::movimiento
  (declare (salience 90))
  (tiempo ?t)
  ?h1 <- (mueve (num ?n) (mov ?m) (tiempo ?t))
  ?h2 <- (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y) (descubierta ?d))
  (dimension ?dim)
  (test (mov-valido ?dim ?m ?x ?y))
  (not (ficha-r (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2))))
  (not (obstaculo-r (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2))))
  (not (movido ?e ?t))
  =>
  (retract ?h1 ?h2)
  (printout t "Movimiento de "?n"(puntos "?p") :mov "?m crlf)
  (assert (movido ?e ?t))
  (assert (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x (+ ?x (mov-x ?m))) (pos-y (+ ?y (mov-y ?m))) (descubierta ?d))))

(defrule MOVER::movimiento_invalido_ficha
  (declare (salience 90))
  (tiempo ?t)
  ?h1 <- (mueve (num ?n) (mov ?m) (tiempo ?t))
  ?h2 <- (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y) (descubierta ?d))
  (dimension ?dim)
;  (test (not (mov-valido ?dim ?m ?x ?y)))
  (ficha-r (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2)))
;  (obstaculo-r (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2)))
;  (not (movido ?e ?t))
  =>
  (retract ?h1)
  (printout t "Movimiento INVÁLIDO por ficha "?n"(puntos "?p") :mov "?m crlf))

(defrule MOVER::movimiento_invalido_obstaculo
  (declare (salience 90))
  (tiempo ?t)
  ?h1 <- (mueve (num ?n) (mov ?m) (tiempo ?t))
  ?h2 <- (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y) (descubierta ?d))
  (dimension ?dim)
;  (test (not (mov-valido ?dim ?m ?x ?y)))
;  (not (ficha-r (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2))))
  (obstaculo-r (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2)))
;  (not (movido ?e ?t))
  =>
  (retract ?h1)
  (printout t "Movimiento INVÁLIDO por obstáculo "?n"(puntos "?p") :mov "?m crlf))

(defrule MOVER::movimiento_invalido_dimension
  (declare (salience 90))
  (tiempo ?t)
  ?h1 <- (mueve (num ?n) (mov ?m) (tiempo ?t))
  ?h2 <- (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y) (descubierta ?d))
  (dimension ?dim)
  (test (not (mov-valido ?dim ?m ?x ?y)))
;  (not (ficha-r (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2))))
;  (not (obstaculo-r (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2))))
;  (not (movido ?e ?t))
  =>
  (retract ?h1)
  (printout t "Movimiento INVÁLIDO por dimensión "?n"(puntos "?p") :mov "?m crlf))

;
; Regla ataque-1: realiza un ataque con victoria
;

(defrule MOVER::verificar-movimiento
  (declare (salience 89))
  (tiempo ?t)
  (not (movido ?e ?t))
  =>
  (printout t "DIOSSSSSS NO HUBO NINGÚN MOVIMIENTO #####################################" crlf))


(defrule MOVER::ataque-1
  (declare (salience 91))
  (tiempo ?t)
  ?h1 <- (mueve (num ?n) (mov ?m) (tiempo ?t))
  ?h2 <- (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test (mov-valido ?dim ?m ?x ?y))
  ?h3 <- (ficha-r (equipo ?e2&~?e) (puntos ?p2&:(> ?p ?p2)) (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2)))
  (not (movido ?e ?t))
  =>
  (retract ?h1 ?h2 ?h3)
  (printout t "Ataque con victoria de "?n"(puntos "?p") : mov "?m crlf)
  (assert (movido ?e ?t))
  (assert (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x (+ ?x (mov-x ?m))) (pos-y (+ ?y (mov-y ?m))) (descubierta 1))))

;
; Regla ataque-2: realiza un ataque con empate
;

(defrule MOVER::ataque-2
  (declare (salience 91))
  (tiempo ?t)
  ?h1 <- (mueve (num ?n) (mov ?m) (tiempo ?t))
  ?h2 <- (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test (mov-valido ?dim ?m ?x ?y))
  ?h3 <- (ficha-r (equipo ?e2&~?e) (puntos ?p) (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2)))
  (not (movido ?e ?t))
  =>
  (retract ?h1 ?h2 ?h3)
  (printout t "Ataque con empate de "?n"(puntos "?p") : mov "?m crlf)
  (assert (movido ?e ?t)))

;
; Regla ataque-3: realiza un ataque con derrota
;

(defrule MOVER::ataque-3
  (declare (salience 91))
  (tiempo ?t)
  ?h1 <- (mueve (num ?n) (mov ?m) (tiempo ?t))
  ?h2 <- (ficha-r (equipo ?e) (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test (mov-valido ?dim ?m ?x ?y))
  ?h3 <- (ficha-r (equipo ?e2&~?e) (num ?n2) (puntos ?p2&:(< ?p ?p2)) (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2)))
  (not (movido ?e ?t))
  =>
  (retract ?h1 ?h2 ?h3)
  (printout t "Ataque con derrota de "?n"(puntos "?p") : mov "?m crlf)
  (assert (movido ?e ?t))
  (assert (ficha-r (equipo ?e2) (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))))


;
; Regla limpia: elimina movimientos que no se hayan realizado
;

(defrule MOVER::limpia
  (declare (salience 0))
  ?h1 <- (mueve (num ?n) (mov ?m) (tiempo ?t))
  =>
  (retract ?h1))
