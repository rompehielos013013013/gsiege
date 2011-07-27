;
; fB.clp
;
; Fichero de ataque
;
; Manuel Palomo Duarte, 2007
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Definicion del mo'dulo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; M'odulo EQUIPO-B
;
; Se encarga de hacer los movimientos de ataque
;

(defmodule EQUIPO-B
;  (import MAIN deftemplate initial-fact ficha ficha-r dimension tiempo mueve)
  (import MAIN deftemplate initial-fact ficha obstaculo dimension tiempo mueve)
  (import MAIN deffunction ?ALL))


;
; Estas son las reglas de prioridad minima
; Lo que hacen es coger un jugador y acercarlo al centro del tablero
;

; Los movimientos son 1 avanza x, 2 retrocede x, 3 avanza y, 4 retrocede y

(defrule EQUIPO-B::basica1
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-B ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (dimension ?dim&:(< ?x (+ 1 (/ ?dim 2))))
  (not (ficha (equipo "A") (pos-x ?x2&:(= ?x2 (+ ?x 1))) (pos-y ?y)))
  (not (obstaculo (pos-x ?x2&:(= ?x2 (+ ?x 1))) (pos-y ?y)))
  =>
  (printout t "BASICA1: EQUIPO-B mueve a " ?n "(" ?p ") de [" ?x "," ?y "] a [" (+ ?x 1) "," ?y "] - mov 2" crlf)

  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-B::basica2
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-B ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (dimension ?dim&:(> ?x (+ 1 (/ ?dim 2))))
  (not (ficha (equipo "A") (pos-x ?x2&:(= ?x2 (- ?x 1))) (pos-y ?y)))
  (not (obstaculo (pos-x ?x2&:(= ?x2 (- ?x 1))) (pos-y ?y)))
  =>
  (printout t "BASICA2: EQUIPO-B mueve a " ?n "(" ?p ") de [" ?x "," ?y "] a [" (- ?x 1) "," ?y "] - mov 1" crlf)

  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-B::basica3
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-B ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (dimension ?dim&:(< ?y (+ 1 (/ ?dim 2))))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  (not (obstaculo (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  =>
  (printout t "BASICA3: EQUIPO-B mueve a " ?n "(" ?p ") de [" ?x "," ?y "] a [" ?x "," (+ ?y 1) "] - mov 4" crlf)
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-B::basica4
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-B ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (dimension ?dim&:(> ?y (+ 1 (/ ?dim 2))))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (- ?y 1)))))
  (not (obstaculo (pos-x ?x) (pos-y ?y2&:(= ?y2 (- ?y 1)))))
  =>
  (printout t "BASICA4: EQUIPO-B mueve a " ?n "(" ?p ") de [" ?x "," ?y "] a [" ?x "," (- ?y 1) "] - mov 3" crlf)

  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))




(defrule EQUIPO-B::superbasica1
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-B ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))

  (not (ficha (equipo "A") (pos-x ?x2&:(= ?x2 (+ ?x 1))) (pos-y ?y)))
  (not (obstaculo (pos-x ?x2&:(= ?x2 (+ ?x 1))) (pos-y ?y)))
  =>
  (printout t "SUPERBASICA1: EQUIPO-B mueve a " ?n "(" ?p ") de [" ?x "," ?y "] a [" (+ ?x 1) "," ?y "] - mov 2" crlf)
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-B::superbasica2
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-B ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))

  (not (ficha (equipo "A") (pos-x ?x2&:(= ?x2 (- ?x 1))) (pos-y ?y)))
  (not (obstaculo (pos-x ?x2&:(= ?x2 (- ?x 1))) (pos-y ?y)))
  =>
  (printout t "SUPERBASICA2: EQUIPO-B mueve a " ?n "(" ?p ") de [" ?x "," ?y "] a [" (- ?x 1) "," ?y "] - mov 1" crlf)

  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-B::superbasica3
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-B ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))

  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  (not (obstaculo (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  =>
  (printout t "SUPERBASICA3: EQUIPO-B mueve a " ?n "(" ?p ") de [" ?x "," ?y "] a [" ?x "," (+ ?y 1) "] - mov 4" crlf)

  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-B::superbasica4
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-B ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))

  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (- ?y 1)))))
  (not (obstaculo (pos-x ?x) (pos-y ?y2&:(= ?y2 (- ?y 1)))))
  =>
  (printout t "SUPERBASICA4: EQUIPO-B mueve a " ?n "(" ?p ") de [" ?x "," ?y "] a [" ?x "," (- ?y 1) "] - mov 3" crlf)

  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-B::termina
  (declare (salience 100))
  (tiempo ?t)
  (dimension ?dim)
  (mueve (num ?n) (mov ?m) (tiempo ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y))
  (test (mov-valido ?dim ?m ?x ?y)) 
  (not (ficha (equipo "A")  (pos-x ?x2&:(= (+ ?x (mov-x ?m)) ?x2)) (pos-y ?y2&:(= (+ ?y (mov-y ?m)) ?y2))))
  =>
  (pop-focus))

