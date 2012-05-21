;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Pedro Delgado Pérez

; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior

(defrule EQUIPO-A::atacar1
(declare (salience 40))
(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 6))
(ficha (equipo "B") (pos-x ?x2))
(test (= ?x1 ?x2))
(tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::atacar2
(declare (salience 30))
(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 6))
(ficha (equipo "B") (pos-x ?x2))
(test (= ?x1 ?x2))
(tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))



(defrule EQUIPO-A::despistar
(declare (salience 35))
(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
(test (and (> ?x1 ?x2) (= (+ 2 ?y1) ?y2)))
(tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::subo1
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (<> (+ ?y 1) ?y2))
  (test (< ?y 3))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

