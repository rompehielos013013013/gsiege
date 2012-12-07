
;
; Manuel Jesús Roca Suarez, 2011
;
(defrule EQUIPO-A::Mover1
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::Ataqued1
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Ataquei1
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Ataqueab1
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::Ataquear1
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;,Reglas para fichas 5

(defrule EQUIPO-A::Mover2
  (declare (salience 52))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::Ataquei2
  (declare (salience 53))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Regla8
  (declare (salience 53))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Regla9
  (declare (salience 53))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::Regla10
  (declare (salience 53))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;Reglas de ataque del resto

(defrule EQUIPO-A::Regla11
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Regla12
  (declare (salience 41))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Regla13
  (declare (salience 41))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?x (+ ?y2 1)))
  (test (= ?y ?y2))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::Regla14
  (declare (salience 41))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?x (- ?y2 1)))
  (test (= ?y ?y2))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;Reglas de defensa del rey



(defrule EQUIPO-A::esqder1
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= (+ ?x 1) ?x2))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::esqder2
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= (+ ?x 1) ?x2))
  (test (= ?y ?y2))
  (test (> ?y 3))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::esqder3
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= (+ ?x 1) ?x2))
  (test (= ?y ?y2))
  (test (< ?y 5))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::esqizq1
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?x 1) ?x2))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::esqizq2
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?x 1) ?x2))
  (test (= ?y ?y2))
  (test (> ?y 3))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::esqizq3
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?x 1) ?x2))
  (test (= ?y ?y2))
  (test (< ?y 5))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::esqarr1
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (+ ?y 1) ?y2))
  (test (> ?y 3))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::esqarr2
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (+ ?y 1) ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::esqarr3
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (+ ?y 1) ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::esqab1
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (- ?y 1) ?y2))
  (test (< ?y 5))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::esqab2
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (- ?y 1) ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::esqab3
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (- ?y 1) ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)
;;;;perseguir;;;;

(defrule EQUIPO-A::perseguir61
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::perseguir62
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::perseguir63
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::perseguir64
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::perseguir51
  (declare (salience 51))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::perseguir52
  (declare (salience 51))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::perseguir53
  (declare (salience 51))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::perseguir54
  (declare (salience 51))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::perseguir41
  (declare (salience 39))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::perseguir42
  (declare (salience 39))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::perseguir43
  (declare (salience 39))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::perseguir44
  (declare (salience 39))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))
