;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Irene García, Ignacio Prieto, Fco Tena, 2012
; Basadas en las reglas de Manuel Palomo Duarte, 2011
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El 6 pa'rriba
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::arribaseis
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(test (< ?y1 8))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::lateralderseis
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(test (and (= ?y1 8) (< ?x 4)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::lateralizqseis
	(declare (salience 71))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(test (and (= ?y1 8) (> ?x 3)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Al ataque
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::arriba
	(declare (salience 65))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p))
	(test (and (> ?p 3) (< ?y1 7)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::come1
	(declare (salience 65))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(test (and (> ?p1 ?p2) (< ?y1 ?y2)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::come2
	(declare (salience 65))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(test (and (> ?p1 ?p2) (> ?y1 ?y2)))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::come3
	(declare (salience 65))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (num ?n) (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(test (and (> ?p1 ?p2) (> ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::come3
	(declare (salience 65))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (num ?n) (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(test (and (> ?p1 ?p2) (< ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El rey huye de quien tenga al lado
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::zigzag1
	(declare (salience 55))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(not (ficha (equipo "B")  (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y1 1)))))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag2
	(declare (salience 55))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(not (ficha (equipo "B")  (pos-x ?x) (pos-y ?y2&:(= ?y2 (- ?y1 1)))))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag3
	(declare (salience 55))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(not (ficha (equipo "B")  (pos-x ?x2&:(= ?x2 (+ ?x1 1))) (pos-y ?y)))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag4
	(declare (salience 55))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(not (ficha (equipo "B")  (pos-x ?x2&:(= ?x2 (- ?x1 1))) (pos-y ?y)))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Defensa en medio del tablero
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::muerde1
	(declare (salience 50))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) )
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::muerde2
	(declare (salience 50))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) )
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::adefender6
	(declare (salience 45))
	(ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
	(test (< ?y 7))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::adefender5
	(declare (salience 45))
	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
	(test (< ?y 8))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::centrar1
	(declare (salience 44))
	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x 1) (pos-y ?y))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::centrar2
	(declare (salience 44))
	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x 8) (pos-y ?y))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Si no hay nada mejor que hacer adelante mis valientes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::basica-3
  (declare (salience 22))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::basica-1
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (+ ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::basica-2
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (- ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

