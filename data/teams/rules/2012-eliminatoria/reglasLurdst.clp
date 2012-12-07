;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;        Reglas de Inteligencia Artificial             ;
;	    	Lourdes Terrero Brea		       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Si el uno esta en peligro moverlo de sitio
(defrule EQUIPO-A::Huir1
	(declare (salience 90))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y (+ ?y2 1)) (= ?y (- ?y2 1))))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::Huir2
	(declare (salience 90))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y (+ ?y2 1)) (= ?y (- ?y2 1))))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::Huir3
	(declare (salience 90))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x (+ ?x2 1)) (= ?x (- ?x2 1))))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::Huir4
	(declare (salience 90))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x (+ ?x2 1)) (= ?x (- ?x2 1))))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

;Avanza el 6
(defrule EQUIPO-A::avanza6
  (declare (salience 79))
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


;Ataca con el 6
 
(defrule EQUIPO-A::ataca6-2
  (declare (salience 79))
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  (test (< ?p2 6))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataca6-1
  (declare (salience 79))
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
	(test (< ?p2 6))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataca6-4
  (declare (salience 78))
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= ?y (+ ?y2 1)))
	(test (< ?p2 6))	
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataca6-3
  (declare (salience 79))
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2) )
  (test (= ?x ?x2))
  (test (= ?y (- ?y2 1)))
	(test (< ?p2 6))	
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;Avanza el 5

(defrule EQUIPO-A::avanza5
  (declare (salience 77))
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Ataca con el 5
 
(defrule EQUIPO-A::ataca5-2
  (declare (salience 76))
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  ;(test (< ?p2 5))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataca5-1
  (declare (salience 76))
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
	;(test (< ?p2 5))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataca5-4
  (declare (salience 76))
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= ?y (+ ?y2 1)))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataca5-3
  (declare (salience 76))
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= ?y (- ?y2 1)))
  	
  (tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Avanza el 4
(defrule EQUIPO-A::avanza4
  (declare (salience 75))
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Ataca con el 4
 
(defrule EQUIPO-A::ataca4-2
  (declare (salience 74))
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataca4-1
  (declare (salience 74))
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataca4-4
  (declare (salience 74))
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= ?y (+ ?y2 1)))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataca4-3
  (declare (salience 74))
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= ?y (- ?y2 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Avanza el 3
(defrule EQUIPO-A::avanza3
  (declare (salience 73))
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Ataca con el 3
 
(defrule EQUIPO-A::ataca3-2
  (declare (salience 72))
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataca3-1
  (declare (salience 72))
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataca3-4
  (declare (salience 72))
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= ?y (+ ?y2 1)))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataca3-3
  (declare (salience 72))
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= ?y (- ?y2 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Avanza el 2
(defrule EQUIPO-A::avanza2
  (declare (salience 71))
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Ataca con el 2
 
(defrule EQUIPO-A::ataca2-2
  (declare (salience 70))
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataca2-1
  (declare (salience 70))
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataca2-4
  (declare (salience 70))
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= ?y (+ ?y2 1)))
	(tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataca2-3
  (declare (salience 70))
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x ?x2))
  (test (= ?y (- ?y2 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

