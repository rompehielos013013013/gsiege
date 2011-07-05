(defrule EQUIPO-A::atacar3
  (declare (salience 60))
  (ficha (equipo "A") (num ?n1) (pos-y ?x1)
         (puntos 6))
  (test (> 7 ?x1))
  (tiempo ?t)
   =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::atacar5
  (declare (salience 51))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1)
         (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2)
         (puntos ?p2))
  (test (and (< ?x1 ?x2) (= ?y1 ?y2))))
  (tiempo ?t)
   =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::atacar6
  (declare (salience 30))
  (ficha (equipo "A") (num ?n1) (pos-y ?x1)
         (puntos 1))
  (test (> 3 ?x1))
  (tiempo ?t)
   =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::atacar2
  (declare (salience 20))
  (ficha (equipo "A") (num ?n1) (pos-y ?x1)
         (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-y ?x2)
         (puntos ?p2) (descubierta 1))
  (test (and (> ?p1 ?p2) (< ?x1 ?x2)))
  (tiempo ?t)
   =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


