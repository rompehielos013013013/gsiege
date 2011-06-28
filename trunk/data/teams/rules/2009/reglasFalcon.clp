;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Antonio Falcón Aragón
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defrule EQUIPO-A::movbasicof6
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (<> ?x 4))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::avanza1f6
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (dimension ?dim&:(= ?y (- ?dim 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::avanza2f6
  (declare (salience 72))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (dimension ?dim&:(= ?y ?dim))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::avanza3f6
  (declare (salience 73))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test(and (= ?y ?dim) (= ?x 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::avanza4f6
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test(and (< ?y ?dim) (> ?y 2)))
  (test(= ?x 4))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ataca1f6
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataca2f6
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ataca3f6
  (declare (salience 77))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ataca4f6
  (declare (salience 78))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::movbasicof5
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (<> ?x 6))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::avanza1f5
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (dimension ?dim&:(= ?y (- ?dim 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::avanza2f5
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (dimension ?dim&:(= ?y ?dim))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::avanza3f5
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test(and (= ?y ?dim) (= ?x 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::avanza4f5
  (declare (salience 64))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test(and (< ?y ?dim) (> ?y 2)))
  (test(= ?x 4))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataca1f5
  (declare (salience 65))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataca2f5
  (declare (salience 66))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ataca3f5
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ataca4f5
  (declare (salience 68))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mov1
  (declare (salience 5))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (dimension ?dim&:(< ?x (/ ?dim 2)))
  (not (ficha (equipo "A") (pos-x ?x2&:(= ?x2 (+ ?x 1))) (pos-y ?y)))
  (test (<> 1 ?p))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::mov2
  (declare (salience 5))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (dimension ?dim&:(> ?x (/ ?dim 2)))
  (not (ficha (equipo "A") (pos-x ?x2&:(= ?x2 (- ?x 1))) (pos-y ?y)))
  (test (<> 1 ?p))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::mov3
  (declare (salience 5))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (dimension ?dim&:(< ?y (/ ?dim 2)))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  (test (<> 1 ?p))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::mov4
  (declare (salience 5))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (dimension ?dim&:(> ?y (/ ?dim 2)))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (- ?y 1)))))
  (test (<> 1 ?p))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataque-arriba
   (declare (salience 55))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque-abajo
   (declare (salience 55))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ataque-derecha
   (declare (salience 55))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ataque-izquierda
   (declare (salience 55))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::escapada1f1
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::escapada2f1
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::escapada3f1
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::escapada4f1
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?x1 ?x2) 1))
  (test (= ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))







