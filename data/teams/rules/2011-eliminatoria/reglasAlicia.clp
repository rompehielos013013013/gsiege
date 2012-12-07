;;Reglas básicas
;;Alicia Guardeño, 2011

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El rey huye de quien tenga al lado
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::zigzag1
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag2
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag3
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag4
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cosas básicas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::atacar1
	(declare (salience 50))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?y1 ?y2) (= ?x1 (- ?x2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::atacar2
	(declare (salience 50))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::atacar3
	(declare (salience 50))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?x1 ?x2) (= ?y1 (- ?y2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::atacar4
	(declare (salience 50))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?x1 ?x2) (= ?y1 (+ ?y2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder1
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?y1 ?y2) (= ?x1 (- ?x2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder2
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder3
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x1 ?x2) (= ?y1 (- ?y2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder4
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x1 ?x2) (= ?y1 (+ ?y2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::avanzar1
	(declare (salience 20))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 2) (= ?x1 ?x2) (< ?y1 ?y2)))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
	)


(defrule EQUIPO-A::avanzar2
	(declare (salience 15))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?x1 ?x2) (< ?y1 ?y2)))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
	)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	Ataques avanzados
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::morder2casillas1
	(declare (salience 42))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?y1 ?y2) (= ?x1 (- ?x2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder2casillas2
	(declare (salience 42))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?y1 ?y2) (= ?x1 (+ ?x2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder2casillas3
	(declare (salience 42))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?x1 ?x2) (= ?y1 (- ?y2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder2casillas4
	(declare (salience 41))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?x1 ?x2) (= ?y1 (+ ?y2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
	)

(defrule EQUIPO-A::atacar2casillas1
	(declare (salience 48))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?y1 ?y2) (= ?x1 (- ?x2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::atacar2casillas2
	(declare (salience 48))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::atacar2casillas3
	(declare (salience 48))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?x1 ?x2) (= ?y1 (- ?y2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::atacar2casillas4
	(declare (salience 47))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?x1 ?x2) (= ?y1 (+ ?y2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder3casillas1
	(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?y1 ?y2) (= ?x1 (- ?x2 3))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder3casillas2
	(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?y1 ?y2) (= ?x1 (+ ?x2 3))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder3casillas3
	(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?x1 ?x2) (= ?y1 (- ?y2 3))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::morder3casillas4
	(declare (salience 34))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?x1 ?x2) (= ?y1 (+ ?y2 3))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
	)

(defrule EQUIPO-A::atacar3casillas1
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?y1 ?y2) (= ?x1 (- ?x2 3))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::atacar3casillas2
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?y1 ?y2) (= ?x1 (+ ?x2 3))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::atacar3casillas3
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?x1 ?x2) (= ?y1 (- ?y2 3))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
	)
	
(defrule EQUIPO-A::atacar3casillas4
	(declare (salience 39))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and (> ?p1 ?p2) (= ?x1 ?x2) (= ?y1 (+ ?y2 3))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
	)


	
	

