; Reglas Carlos Navas Mata 


; Ficha 6


(defrule EQUIPO-A::basica-6
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (<> ?x 4))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::derecha-6
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (dimension ?dim&:(= ?y (- ?dim 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::izquierda-6
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (dimension ?dim&:(= ?y ?dim))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataque-6
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test(and (= ?y ?dim) (= ?x 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::retroceso-6
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test(and (< ?y ?dim) (> ?y 2)))
  (test(= ?x 4))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::atacando-izquierda-6
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::atacando-derecha-6
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::atacando-abajo-6
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::atacando-arriba-6
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))




;Reglas de ataque del resto



(defrule EQUIPO-A::resto-ataque-izquierda
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::resto-ataque-derecha
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::resto-ataque-abajo
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?x (+ ?y2 1)))
  (test (= ?y ?y2))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::resto-ataque-arriba
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?x (- ?y2 1)))
  (test (= ?y ?y2))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))



;Movemos piezas de valores 5 y 4 si no hay otra cosa que hacer


(defrule EQUIPO-A::arriba-5
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::derecha-5
  (declare (salience 15))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (+ ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::izquierda-5
  (declare (salience 15))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (- ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::arriba-4
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::derecha-4
  (declare (salience 15))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (+ ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::izquierda-4
  (declare (salience 15))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (- ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))



; Reglas para el rey (movimientos aleatorios)


(defrule EQUIPO-A::arriba-rey
  (declare (salience 9))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::abajo-rey
  (declare (salience 10))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::derecha-rey
  (declare (salience 10))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::izquierda-rey
  (declare (salience 10))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

