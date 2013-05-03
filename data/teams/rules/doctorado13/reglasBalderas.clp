;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Antonio Balderas Alberico
; Mejora sobre el equipo de Mario en Liga 2011
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Disponible bajo los términos de la GNU General Public 
;  License (GPL) version 2 o superior
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;
;;SFA;;
;;;;;;;

(defrule EQUIPO-A::DSFA
   (declare (salience 35))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos ?p1))
   (test (= ?y1 8))
   (test (< ?x1 5))
   (test (<> ?p1 1))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))   
)

(defrule EQUIPO-A::ASFA
   (declare (salience 30))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos ?p1))
   (test (< ?y1 8))
   (test (<> ?p1 1))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))   
)

(defrule EQUIPO-A::ISFA
   (declare (salience 32))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos ?p1))
   (test (= ?y1 8))
   (test (> ?x1 4))
   (test (<> ?p1 1))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))   
)
;;;;;;;
;;SF6;;
;;;;;;;

(defrule EQUIPO-A::ASF6
   (declare (salience 70))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (test (< ?y1 8))
   (not(completo))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))  
)

(defrule EQUIPO-A::DSF6
   (declare (salience 72))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (test (= ?y1 8))
   (completo)
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ISF6
   (declare (salience 75))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 6))
   (test (= ?y1 8))
   (not(completo))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
   (assert (completo))
)

;;;;;;;
;;SF5;;
;;;;;;;

(defrule EQUIPO-A::ASF5
   (declare (salience 50))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 5))
   (test (< ?y1 8))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))   
)

(defrule EQUIPO-A::DSF5
   (declare (salience 55))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 5))
   (test (= ?y1 8))
   (test (<> ?x1 5))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))   
)

;;;;;;;
;;TF2;;
;;;;;;;

(defrule EQUIPO-A::T1
   (declare (salience 20))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 2))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (or (= ?p2 6) (= ?p2 5)))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (test (< ?y1 8))
   (test (< ?x1 8))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))   
)

(defrule EQUIPO-A::T2
   (declare (salience 20))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 2))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (or (= ?p2 6) (= ?p2 5)))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (test (< ?y1 8))
   (test (> ?x1 1))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))   
)

(defrule EQUIPO-A::T3
   (declare (salience 20))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 2))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (or (= ?p2 6) (= ?p2 5)))
   (test (and (= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (test (< ?y1 8))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))   
)

;;;;;;
;;AA;;
;;;;;;

(defrule EQUIPO-A::AR
   (declare (salience 60))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::AA
   (declare (salience 60))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::AI
   (declare (salience 60))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::AD
   (declare (salience 60))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
   
;;;;;;;
;;HAA;;
;;;;;;;

(defrule EQUIPO-A::ARS
   (declare (salience 50))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (< ?p1 6))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::AAS
   (declare (salience 50))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (test (< ?p1 6))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::AIS
   (declare (salience 50))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (test (< ?p1 6))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ADS
   (declare (salience 50))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (test (< ?p1 6))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
   
;;;;;;;
;;SAA;;
;;;;;;;

(defrule EQUIPO-A::ARSU
   (declare (salience 30))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   (test (= ?p1 ?p2)) 
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::AASU
   (declare (salience 30))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   (test (= ?p1 ?p2))
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::AISU
   (declare (salience 30))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   (test (= ?p1 ?p2))
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ADSU
   (declare (salience 30))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   (test (= ?p1 ?p2))
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
   
;;;;;;;
;;F6M;;
;;;;;;;

(defrule EQUIPO-A::6C
   (declare (salience 25))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
   (test (<> ?p 6))
   (test(< ?x ?x2))
   (test(<> ?y ?y2))
   =>
   (assert (mueve(num ?n) (mov 1) (tiempo ?t) ))
)
   
(defrule EQUIPO-A::6C2
   (declare (salience 25))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
   (test (<> ?p 6))
   (test(> ?x ?x2))
   (test(<> ?y ?y2))
   =>
   (assert (mueve(num ?n) (mov 2) (tiempo ?t) ))
)

(defrule EQUIPO-A::6CS1
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   (test (= ?y1 7))
   (test (= ?x1 7))
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::6CS2
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   (test (= ?y1 6))
   (test (= ?x1 7))
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

;;;;;;;
;;F6A;;
;;;;;;;

(defrule EQUIPO-A::AF6A
   (declare (salience 65))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::BF6A
   (declare (salience 65))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::DF6A
   (declare (salience 65))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::IF6A
   (declare (salience 65))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

;;;;;;;;;
;;RESET;;
;;;;;;;;;

(defrule EQUIPO-A::R1
   (declare (salience 75))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
   (tiempo ?t)
   (test (= ?x1 1))
   (test (= ?y1 1))
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
   
(defrule EQUIPO-A::R2
   (declare (salience 76))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
   (tiempo ?t)
   (test (= ?x1 1))
   (test (> ?y1 4))
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::R3
   (declare (salience 77))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
   (tiempo ?t)
   (test (< ?x1 5))
   (test (= ?y1 4))
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

;;;;;;;;;
;;F1GET;;
;;;;;;;;;

(defrule EQUIPO-A::DGET
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::IGET
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::AGET
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::BGET
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))