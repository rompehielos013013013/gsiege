;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Juan Manuel Jiemenez Alfaro, 2012
;
;
; Disponible bajo los términos de la GNU 
; General Public License (GPL) version 3 o superior
;

;reglas para la ficha 6 para que haga un barrido

(defrule EQUIPO-A::barrido1
    (declare (salience 79))
    (tiempo ?t)
    (ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 6))
    (test (<> ?y 8))
    =>
    (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::barrido2
    (declare (salience 78))
    (tiempo ?t)
    (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 6))
    (test (<> ?x 8))
    =>
    (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

;Regla para la ficha 6, despues del barrido se coma a las fichas

(defrule EQUIPO-A::atacar1
  (declare (salience 77))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1)
         (pos-y ?y1) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2)
         (pos-y ?y2) (puntos ?p))
  (test (and (< ?y1 ?y2) (= ?x1 ?x2)))
  (tiempo ?t)
    =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::atacar2
  (declare (salience 76))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1)
         (pos-y ?y1) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2)
         (pos-y ?y2) (puntos ?p))
  (test (and (= ?y1 ?y2) (> ?x1 ?x2)))
  (tiempo ?t)
    =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::atacar3
  (declare (salience 75))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1)
         (pos-y ?y1) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2)
         (pos-y ?y2) (puntos ?p))
  (test (and (> ?y1 ?y2) (= ?x1 ?x2)))
  (tiempo ?t)
    =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::atacar4
  (declare (salience 74))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1)
         (pos-y ?y1) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2)
         (pos-y ?y2) (puntos ?p))
  (test (and (= ?y1 ?y2) (< ?x1 ?x2)))
  (tiempo ?t)
    =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

;huir

(defrule EQUIPO-A::huir
  (declare (salience 80))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1)
         (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2)
         (pos-y ?y2) (puntos ?p) (descubierta 1))
  (test (and (> ?p 1) (> ?y1 ?y2) (= ?x1 ?x2)))
  (tiempo ?t)
    =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
