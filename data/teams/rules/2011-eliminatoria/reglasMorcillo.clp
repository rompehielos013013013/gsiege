;;;;;;;;;;;;;; BANDERAS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::ficha-6-muerta
   (declare (salience 80))
   (not(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6)))
   => 
   ;(printout t "La ficha " ?n " esta muerta" crlf)
   (assert (ficha_6_muerta)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Preparamos la defensa
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::posicionar1
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x 8) (pos-y 2) (puntos 4))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 


(defrule EQUIPO-A::posicionar2
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x 7) (pos-y 2) (puntos 5))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::posicionar3
	(declare (salience 78))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x 7) (pos-y 1) (puntos 6))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Defensa del 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::defiende1
	(declare (salience 77))
	(ficha (equipo "A") (num ?n1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x 8) (pos-y 2) )
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::defiende2
	(declare (salience 77))
	(ficha (equipo "A") (num ?n1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x 7) (pos-y 1) )
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Recolocación del 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::recolocar1
	(declare (salience 75))
	(ficha (equipo "A") (num ?n1)(pos-x 8) (pos-y 2)(puntos 6))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::recolocar2
	(declare (salience 75))
	(ficha (equipo "A") (num ?n1)(pos-x 7) (pos-y 1)(puntos 6))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Huida del 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::huida1
	(declare (salience 76))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::huida2
	(declare (salience 76))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::huida3
	(declare (salience 76))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::huida4
	(declare (salience 76))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Promocionando al 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::promocion1
	(declare (salience 75))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2)(descubierta 0))
	(tiempo ?t)
	(ficha_6_muerta)
	(test (= ?p1 5))
	(test (= ?y1 (+ ?y2 1)))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::promocion2
	(declare (salience 75))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2)(descubierta 0))
	(tiempo ?t)
	(ficha_6_muerta)
	(test (= ?p1 5))
	(test (= ?y1 (- ?y2 1)))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::promocion3
	(declare (salience 75))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y)(descubierta 0))
	(tiempo ?t)
	(ficha_6_muerta)
	(test (= ?p1 5))
	(test (= ?x1 (- ?x2 1)))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::promocion4
	(declare (salience 75))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y)(descubierta 0))
	(tiempo ?t)
	(ficha_6_muerta)
	(test (= ?p1 5))
	(test (= ?x1 (+ ?x2 1)))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avance del 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance1
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1)(puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(ficha_6_muerta)
	(test (= ?p1 5))
	(test (not (and (= ?y2 (+ ?y1 1)) (= ?x1 ?x2) (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))) 
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::avance2
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (puntos ?p1))
	(tiempo ?t)
	(ficha_6_muerta)
	(test (= ?p1 5))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::avance3
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (puntos ?p1))
	(tiempo ?t)
	(ficha_6_muerta)
	(test (= ?p1 5))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::avance4
	(declare (salience 44))
	(ficha (equipo "A") (num ?n1) (puntos ?p1))
	(tiempo ?t)
	(ficha_6_muerta)
	(test (= ?p1 5))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque seguro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::seguro1
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (= ?y1 (+ ?y2 1)))
	(test (> ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::seguro2
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (= ?y1 (- ?y2 1)))
	(test (> ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::seguro3
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta 1))
	(test (= ?x1 (+ ?x2 1)))
	(test (> ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::seguro4
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta 1))
	(test (= ?x1 (- ?x2 1)))
	(test (> ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Huida compresible, no hay nada que demostrar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::esquiva1
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (= ?y1 (- ?y2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva2
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (= ?y1 (- ?y2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva3
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (= ?y1 (- ?y2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva4
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (= ?y1 (+ ?y2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva5
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (= ?y1 (+ ?y2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva6
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (= ?y1 (+ ?y2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva7
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta 1))
	(test (= ?x1 (- ?x2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva8
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta 1))
	(test (= ?x1 (- ?x2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva9
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta 1))
	(test (= ?x1 (- ?x2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva10
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta 1))
	(test (= ?x1 (+ ?x2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva11
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta 1))
	(test (= ?x1 (+ ?x2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::esquiva12
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta 1))
	(test (= ?x1 (+ ?x2 1)))
	(test (< ?p1 ?p2))
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; En territorio enemigo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::territorio1
	(declare (salience 60))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y 8))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
	(tiempo ?t)
	(not (mover_dcha))
	(not (mover_izq))
	(test (= ?x1 (+ ?x2 1)))
	=>
	(assert (mover_dcha))
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::territorio2
	(declare (salience 60))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y 8))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
	(tiempo ?t)
	(not (mover_dcha))
	(not (mover_izq))
	(test (= ?x1 (- ?x2 1)))
	=>
	(assert (mover_izq))
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::territorio3
	(declare (salience 60))
	(ficha (equipo "A") (num ?n1) (pos-y 8))
	(tiempo ?t)
	(mover_dcha)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::territorio4
	(declare (salience 60))
	(ficha (equipo "A") (num ?n1) (pos-y 8))
	(tiempo ?t)
	(mover_izq)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::territorio5
	(declare (salience 60))
	(ficha (equipo "A") (num ?n1) (pos-x 1) (pos-y 8))
	(tiempo ?t)
	?h <- (mover_dcha)
	=>
	(assert(mover_izq))
	(retract ?h)
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::territorio6
	(declare (salience 60))
	(ficha (equipo "A") (num ?n1) (pos-x 8) (pos-y 8))
	(tiempo ?t)
	?h <- (mover_izq)
	=>
	(assert(mover_dcha))
	(retract ?h)
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avance precavido
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::precavido1
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(tiempo ?t)
	(test (and (!= ?p1 6) (!= ?p1 1)))
	(test (and (or (> ?p1 ?p2) (= ?p1 ?p2)) (= ?y2 (+ ?y1 1)) (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1)))))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::precavido2
	(declare (salience 39))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(tiempo ?t)
	(test (and (!= ?p1 6) (!= ?p1 1)))
	(test (and (or (> ?p1 ?p2) (= ?p1 ?p2)) (= ?x2 (- ?x1 1)) (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1)))))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::precavido3
	(declare (salience 39))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(tiempo ?t)
	(test (and (!= ?p1 6) (!= ?p1 1)))
	(test (and (or (> ?p1 ?p2) (= ?p1 ?p2)) (= ?x2 (+ ?x1 1)) (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1)))))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::precavido4
	(declare (salience 38))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(tiempo ?t)
	(test (and (!= ?p1 6) (!= ?p1 1)))
	(test (and (or (> ?p1 ?p2) (= ?p1 ?p2)) (= ?y2 (- ?y1 1)) (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1)))))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avance a lo loco, para cuando todo lo demás falla
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::loco1
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2)(descubierta 0))
	(tiempo ?t)
	(test (and (!= ?p1 1) (!= ?p1 6)))
	(test (= ?y1 (+ ?y2 1)))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::loco2
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2)(descubierta 0))
	(tiempo ?t)
	(test (and (!= ?p1 1) (!= ?p1 6)))
	(test (= ?y1 (- ?y2 1)))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::loco3
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y)(descubierta 0))
	(tiempo ?t)
	(test (and (!= ?p1 1) (!= ?p1 6)))
	(test (= ?x1 (- ?x2 1)))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::loco4
	(declare (salience 45))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y)(descubierta 0))
	(tiempo ?t)
	(test (and (!= ?p1 1) (!= ?p1 6)))
	(test (= ?x1 (+ ?x2 1)))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avance normal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::normal1
	(declare (salience 30))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1)(puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(test (and (!= ?p1 1) (!= ?p1 6)))
	(test (not (and (= ?y2 (+ ?y1 1)) (= ?x1 ?x2) (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))) 
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::normal2
	(declare (salience 25))
	(ficha (equipo "A") (num ?n1) (puntos ?p1))
	(tiempo ?t)
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::normal3
	(declare (salience 25))
	(ficha (equipo "A") (num ?n1) (puntos ?p1))
	(tiempo ?t)
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::normal4
	(declare (salience 20))
	(ficha (equipo "A") (num ?n1) (puntos ?p1))
	(tiempo ?t)
	(test (and (!= ?p1 1) (!= ?p1 6)))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))
