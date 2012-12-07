;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  para competicion en D.V.                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Sergio Marabot García, 2011
;

(defrule EQUIPO-A::esqder1
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= (+ ?x 1) ?x2))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::esqder2
  (declare (salience 81))
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
  (declare (salience 81))
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
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?x 1) ?x2))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::esqizq2
  (declare (salience 81))
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
  (declare (salience 81))
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
  (declare (salience 80))
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
  (declare (salience 81))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (+ ?y 1) ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::esqarr3
  (declare (salience 81))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (+ ?y 1) ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::esqab1
  (declare (salience 80))
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
  (declare (salience 81))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (- ?y 1) ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::esqab3
  (declare (salience 81))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= (- ?y 1) ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

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

(defrule EQUIPO-A::subo68
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::izq68
  (declare (salience 78))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 8))
  (test (= ?y ?y2))
  (test (< ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::der68
  (declare (salience 77))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 8))
  (test (= ?y ?y2))
  (test (> ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::sube517
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (> ?y 1))
  (test (<> ?y 7))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::izq517
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 7))
  (test (= ?y ?y2))
  (test (< ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::der517
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 7))
  (test (= ?y ?y2))
  (test (> ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::sube527
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (= ?y 1))
  (test (<> ?y 7))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::sube418
  (declare (salience 73))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::izq418
  (declare (salience 72))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 8))
  (test (= ?y ?y2))
  (test (< ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::der418
  (declare (salience 71))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 8))
  (test (= ?y ?y2))
  (test (> ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::sube316
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 6))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::izq316
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 6))
  (test (= ?y ?y2))
  (test (< ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::der316
  (declare (salience 58))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 6))
  (test (= ?y ?y2))
  (test (> ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::sube215
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 5))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::izq215
  (declare (salience 49))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 5))
  (test (= ?y ?y2))
  (test (< ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::der215
  (declare (salience 48))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y 5))
  (test (= ?y ?y2))
  (test (> ?x2 ?x))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::atader
  (declare (salience 48))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?y ?y2))
  (test (= (+ ?x 1) ?x2))
  (test (> ?p ?p2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataizq
  (declare (salience 48))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= ?y ?y2))
  (test (= (- ?x 1) ?x2))
  (test (> ?p ?p2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataarr
  (declare (salience 48))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= (+ ?y 1) ?y2))
  (test (= ?x ?x2))
  (test (> ?p ?p2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataaba
  (declare (salience 48))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) (descubierta 1))
  (test (= (- ?y 1) ?y2))
  (test (= ?x ?x2))
  (test (> ?p ?p2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

