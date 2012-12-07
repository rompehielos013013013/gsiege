;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Reglas básicas para el equipo A                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Ezequiel Lobato Haro, 2012
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque del seis		                       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Ataque6-1
   (declare (salience 70))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (test (<> ?y1 8)) 
   (not(retrocede))
   (not(avanza))
   (not(ultimo))
   (not(barrer))
   (not(fin))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))) 
   
)

(defrule EQUIPO-A::Ataque6-2
   (declare (salience 71))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (not(retrocede))
   (not(avanza))
   (not(ultimo))
   (not(barrer))
   (not(fin))
   (test (= ?y1 8))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))  
)

(defrule EQUIPO-A::Ataque6-3
   (declare (salience 72))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (test (= ?x1 4))
   (not(avanza))
   (not(ultimo))
   (not(barrer))
   (not(retrocede))
   (not(fin))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))  
   (assert(retrocede))
)

(defrule EQUIPO-A::Ataque6-4
   (declare (salience 77))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (test (<> ?x1 8))
   (retrocede)
 (not(fin))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))  
)

(defrule EQUIPO-A::Ataque6-5
   (declare (salience 78))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (test (= ?x1 8))
   (retrocede)
 (not(fin))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
   (assert(avanzay))
)

(defrule EQUIPO-A::Ataque6-6
   (declare (salience 79))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (test (<> ?x1 5))
   (not(fin))
   (avanzay)
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
   (assert(final))
)


(defrule EQUIPO-A::Ataque6-7
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (final)
   (test (= ?x1 5))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t))) 
   (assert(fin))
   
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  5 Ataque                                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Ataque5-1
   (declare (salience 62))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 5))
   (test(and(< (+ ?y1 1) 6)(< ?x1 4)))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))  
)

(defrule EQUIPO-A::Ataque5-2
   (declare (salience 64))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 5))
   (test(= ?y1 5))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))  
)

(defrule EQUIPO-A::Ataque5-3
   (declare (salience 65))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 5))
   (test(= ?x1 8))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))  
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Si sabemos sus puntos y los superamos mata          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Ataqueabajo
   (declare (salience 79))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n1) (pos-y ?y1) (pos-x ?x1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-y ?y2) (pos-x ?x2) (puntos ?p2))
   (barrer)
   (test  (     or  (and  (= ?y1 (- ?y2 1)) (<> ?p1 1)(>= ?p1 ?p2) (= ?x1 ?x2)) (and (or(= ?p1 6)(= ?p1 5))(= ?y1 (- ?y2 1))(= ?x1 ?x2) )))
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))   
)

(defrule EQUIPO-A::Ataquederecha
   (declare (salience 79))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n1) (pos-y ?y1) (pos-x ?x1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-y ?y2) (pos-x ?x2) (puntos ?p2))
   (barrer)
   (test (or (and  (= ?x1 (- ?x2 1) )(<> ?p1 1) (>= ?p1 ?p2) (= ?y1 ?y2))(and (or(= ?p1 6)(= ?p1 5))(= ?x1 (- ?x2 1) )(= ?y1 ?y2) ) ) ) 
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))   
)

(defrule EQUIPO-A::Ataqueizquierda
   (declare (salience 79))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n1) (pos-y ?y1) (pos-x ?x1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-y ?y2) (pos-x ?x2) (puntos ?p2))
   (barrer)
   (test (or (and (= ?x1 (+ ?x2 1) ) (<> ?p1 1)(>= ?p1 ?p2) (= ?y1 ?y2)) (and (or(= ?p1 6)(= ?p1 5))(= ?x1 (+ ?x2 1) ) (= ?y1 ?y2)) ) ) 
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))   
)

(defrule EQUIPO-A::Ataquearriba
   (declare (salience 79))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n1) (pos-y ?y1) (pos-x ?x1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-y ?y2) (pos-x ?x2) (puntos ?p2))
   (barrer)
   (test (or (and  (= ?y1 (+ ?y2 1) )(<> ?p1 1) (>= ?p1 ?p2) (= ?x1 ?x2)) (and (or(= ?p1 6)(= ?p1 5))(= ?y1 (+ ?y2 1) )(= ?x1 ?x2) ) ) ) 
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))   
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Defensa del Rey 1                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::defensa1
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::defensa2
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::defensa3
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::defensa4
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Si no podemos hacer otro movimiento atacamos         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ficha4
  (declare (salience 22))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 4))
  (test (<> ?y1 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ficha3
  (declare (salience 22))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 3))
   (test (<> ?y1 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ficha4-2
  (declare (salience 22))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 4))
  (test (<> ?y1 8))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ficha3-2
  (declare (salience 22))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 3))
   (test (<> ?y1 8))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ficha2
  (declare (salience 12))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 2))
  (test (<> ?y1 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ficha2-2
  (declare (salience 12))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 2))
  (test (<> ?y1 8))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))
