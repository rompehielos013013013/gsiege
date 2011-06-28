;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Andrés Francisco Aparicio 2009
;
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Barrido6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque6-1
	(declare (salience 40))
	(ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y ?y))
	(test (< ?y 7))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ataque6-2
	(declare (salience 40))
	(ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y ?y) )
	(tiempo ?t)
	(test (and (= ?x 8) (= ?y 7))) 
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ataque6-3
	(declare (salience 40))
	(ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?y 7)) 
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque6-4
	(declare (salience 40))
	(ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?y 8)) 
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque6-5
	(declare (salience 40))
	(ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y ?y) )
	(tiempo ?t)
	(test (and (= ?x 1) (= ?y 8))) 
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Barrido5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque5-1
	(declare(salience 40))
	(ficha (equipo "A")(num ?n)(puntos 5)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (< ?y 6))
=>
	(assert (mueve (num ?n)(mov 3)(tiempo ?t))))

(defrule EQUIPO-A::ataque5-2
	(declare(salience 40))
	(ficha (equipo "A")(num ?n)(puntos 5)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (= ?y 6))
=>
	(assert (mueve (num ?n)(mov 1)(tiempo ?t))))

(defrule EQUIPO-A::ataque5-3
	(declare(salience 40))
	(ficha (equipo "A")(num ?n)(puntos 5)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (and (= ?y 6) (= ?x 8)))
=>
	(assert (mueve (num ?n)(mov 3)(tiempo ?t))))

(defrule EQUIPO-A::ataque5-4
	(declare(salience 40))
	(ficha (equipo "A")(num ?n)(puntos 5)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (= ?y 7))
=>
	(assert (mueve (num ?n)(mov 2)(tiempo ?t))))

(defrule EQUIPO-A::ataque5-5
	(declare(salience 40))
	(ficha (equipo "A")(num ?n)(puntos 5)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (and (= ?y 7) (= ?x 1)))
=>
	(assert (mueve (num ?n)(mov 4)(tiempo ?t))))

(defrule EQUIPO-A::ataque5-6
	(declare(salience 40))
	(ficha (equipo "A")(num ?n)(puntos 5)(pos-x ?x)(pos-y ?y) )
	(not ficha (equipo "A")(puntos 6))
	(tiempo ?t)
	(test (> ?x 1) )
=>
	(assert (mueve (num ?n)(mov 2)(tiempo ?t))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Barrido 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque4-1
	(declare(salience 30))
	(ficha (equipo "A")(num ?n)(puntos 4)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (< ?y 6))
=>
	(assert (mueve (num ?n)(mov 3)(tiempo ?t))))

(defrule EQUIPO-A::ataque4-2
	(declare(salience 30))
	(ficha (equipo "A")(num ?n)(puntos 4)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (= ?y 6))
=>
	(assert (mueve (num ?n)(mov 1)(tiempo ?t))))

(defrule EQUIPO-A::ataque4-3
	(declare(salience 30))
	(ficha (equipo "A")(num ?n)(puntos 4)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (and (= ?y 6) (= ?x 8)))
=>
	(assert (mueve (num ?n)(mov 3)(tiempo ?t))))

(defrule EQUIPO-A::ataque4-4
	(declare(salience 30))
	(ficha (equipo "A")(num ?n)(puntos 4)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (= ?y 7))
=>
	(assert (mueve (num ?n)(mov 2)(tiempo ?t))))

(defrule EQUIPO-A::ataque4-5
	(declare(salience 30))
	(ficha (equipo "A")(num ?n)(puntos 4)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (and (= ?y 7) (= ?x 1)))
=>
	(assert (mueve (num ?n)(mov 4)(tiempo ?t))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Barrido 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque3-1
	(declare(salience 20))
	(ficha (equipo "A")(num ?n)(puntos 3)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (< ?y 6))
=>
	(assert (mueve (num ?n)(mov 3)(tiempo ?t))))

(defrule EQUIPO-A::ataque3-2
	(declare(salience 20))
	(ficha (equipo "A")(num ?n)(puntos 3)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (= ?y 6))
=>
	(assert (mueve (num ?n)(mov 1)(tiempo ?t))))

(defrule EQUIPO-A::ataque3-3
	(declare(salience 20))
	(ficha (equipo "A")(num ?n)(puntos 3)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (and (= ?y 6) (= ?x 8)))
=>
	(assert (mueve (num ?n)(mov 3)(tiempo ?t))))

(defrule EQUIPO-A::ataque3-4
	(declare(salience 20))
	(ficha (equipo "A")(num ?n)(puntos 3)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (= ?y 7))
=>
	(assert (mueve (num ?n)(mov 2)(tiempo ?t))))

(defrule EQUIPO-A::ataque3-5
	(declare(salience 20))
	(ficha (equipo "A")(num ?n)(puntos 3)(pos-x ?x)(pos-y ?y) )
	(tiempo ?t)
	(test (and (= ?y 7) (= ?x 1)))
=>
	(assert (mueve (num ?n)(mov 4)(tiempo ?t))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Ataque seguro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::ataque-arriba
   (declare (salience 30))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque-abajo
   (declare (salience 30))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ataque-derecha
   (declare (salience 30))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ataque-izquierda
   (declare (salience 30))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Avance del rey
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avancerey
   (declare (salience 50))
   (ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "A") (num ?n2) (pos-y ?y2) (puntos 6))
   (tiempo ?t)
	(test (< ?y1 (- ?y2 1)))
   =>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Evasion rey
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::ficha-arriba
   (declare (salience 75))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ficha-abajo
   (declare (salience 75))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ficha-derecha
   (declare (salience 75))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ficha-izquierda
   (declare (salience 75))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


