;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas del Sistema Experto           ;
;Carlos Rodriguez Fernandez           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::arribacon1
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-y ?y1) (puntos ?p))
	(test (and (= ?p 1) (< ?y1 3)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::huircon1arriba
	(declare (salience 81))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
	(test (= (+ ?x2 1) ?x1))
	(test (and (= ?y1 ?y2) (< ?y1 8)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::huircon1derecha
	(declare (salience 85))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
	(test (= (- ?y2 1) ?y1))
	(test (= ?x1 ?x2))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))
	
(defrule EQUIPO-A::arribacon6
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(test (and (> ?p 5) (= ?x1 8) (< ?y1 8)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 


(defrule EQUIPO-A::arribacon5
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(test (and (= ?p 5) (= ?x1 7) (< ?y1 7)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::arribacon5_2
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(test (and (= ?p 5) (= ?x1 6) (< ?y1 6)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 



(defrule EQUIPO-A::arribatodos
	(declare (salience 25))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-y ?y1) (puntos ?p))
	(test (and (< ?p 5) (> ?p 1)  (< ?y1 8)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 


(defrule EQUIPO-A::arrasarcon6der
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(test (and (> ?p 5) (< ?x1 6) (= ?y1 6)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::arrasarcon6izq
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-y ?y1) (puntos ?p))
	(test (and (> ?p 5) (> ?y1 7)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 


(defrule EQUIPO-A::bajarfilacon6
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(test (and (> ?p 5) (= ?x1 1) (> ?y1 6)))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::bajarfilacon5
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(test (and (= ?p 5) (= ?x1 1) (> ?y1 5)))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::arrasarcon5
	(declare (salience 65))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-y ?y1) (puntos ?p))
	(test (and (= ?p 5) (> ?y1 6)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))



