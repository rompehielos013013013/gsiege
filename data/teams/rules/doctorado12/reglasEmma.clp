(defrule EQUIPO-A::ataca1
	(declare (salience 75))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (> ?x1 ?x2)))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
(defrule EQUIPO-A::ataca2
	(declare (salience 50))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (< ?x1 ?x2)))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::ataca3
	(declare (salience 75))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (< ?y1 ?y2)))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::ataca4
	(declare (salience 50))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (> ?y1 ?y2)))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
(defrule EQUIPO-A::peligro1
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= (- ?x2 ?x1) 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::peligro2
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= (- ?x2 ?x1) 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
(defrule EQUIPO-A::peligro3
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= (- ?y2 ?y1) 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::peligro4
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= (- ?y2 ?y1) 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)





(defrule EQUIPO-A::peligro5
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= (- ?x2 ?x1) 2)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::peligro6
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= (- ?x2 ?x1) 2)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
(defrule EQUIPO-A::peligro7
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= (- ?y2 ?y1) 2)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::peligro8
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= (- ?y2 ?y1) 2)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue1
	(declare (salience 50))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2))
	(test (> ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;(defrule EQUIPO-A::sigue2
;	(declare (salience 50))
;	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 6))
;	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2))
;	(test (and (> ?p1 ?p2) (< ?x1 ?x2)))
;	(tiempo ?t)
;	=>
;	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
;)
(defrule EQUIPO-A::sigue3
	(declare (salience 50))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-y ?y2) (puntos ?p2))
	(test (< ?y1 ?y2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue4
	(declare (salience 50))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-y ?y2) (puntos ?p2))
	(test (> ?y1 ?y2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue5
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2))
	(test (> ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue6
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2))
	(test (< ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue7
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-y ?y2) (puntos ?p2))
	(test (< ?y1 ?y2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue8
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?y2) (puntos ?p2))
	(test (> ?y1 ?y2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue9
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2))
	(test (> ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue10
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2))
	(test (< ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue11
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-y ?y2) (puntos ?p2))
	(test (< ?y1 ?y2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue12
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-y ?y2) (puntos ?p2))
	(test (> ?y1 ?y2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue13
	(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2))
	(test (> ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue14
	(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2))
	(test (< ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue15
	(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-y ?y2) (puntos ?p2))
	(test (< ?y1 ?y2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::sigue16
	(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-y ?y2) (puntos ?p2))
	(test (> ?y1 ?y2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)

