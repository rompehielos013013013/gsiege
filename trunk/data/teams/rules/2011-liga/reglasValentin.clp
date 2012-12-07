;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Valentín Liñeiro Barea, 2011
; Basadas en las reglas de Manuel Palomo Duarte, 2009
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Huida
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::zigzag1
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag2
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag3
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag4
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque sobreseguro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::atacar_izq_seguro
	(declare (salience 70))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(tiempo ?t)
	(test (= ?x1 (+ ?x2 1)))
	(test (> ?p1 ?p2))
	(test (not(= ?p1 1)))  
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::atacar_der_seguro
	(declare (salience 70))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(tiempo ?t)
	(test (= ?x1 (- ?x2 1)))
	(test (> ?p1 ?p2))
	(test (not(= ?p1 1)))  
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::atacar_frente_seguro
	(declare (salience 70))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(tiempo ?t)
	(test (= ?y1 (- ?y2 1)))
	(test (> ?p1 ?p2))
	(test (not(= ?p1 1)))  
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::atacar_atras_seguro
	(declare (salience 70))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(tiempo ?t)
	(test (= ?y1 (+ ?y2 1)))
	(test (> ?p1 ?p2))
	(test (not(= ?p1 1)))  
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Aproximar seguro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::aproximar_izq_seguro
	(declare (salience 64))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(tiempo ?t)
	(test (> ?p1 ?p2))
	(test (< ?x2 ?x1))
	(test (not(= ?p1 1)))  
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::aproximar_der_seguro
	(declare (salience 64))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(tiempo ?t)
	(test (> ?p1 ?p2))
	(test (> ?x2 ?x1))
	(test (not(= ?p1 1)))  
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::aproximar_frente_seguro
	(declare (salience 65))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(tiempo ?t)
	(test (> ?p1 ?p2))
	(test (> ?y2 ?y1))
	(test (not(= ?p1 1)))  
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::aproximar_atras_seguro
	(declare (salience 63))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(tiempo ?t)
	(test (> ?p1 ?p2))
	(test (< ?y2 ?y1))	
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque no seguro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::atacar_izq
	(declare (salience 50))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(tiempo ?t)
	(test (= ?x1 (+ ?x2 1)))
	(test (not(= ?p1 1)))    
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::atacar_der
	(declare (salience 50))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(tiempo ?t)
	(test (= ?x1 (- ?x2 1)))
	(test (not(= ?p1 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::atacar_frente
	(declare (salience 51))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (= ?y1 (- ?y2 1)))
	(test (not(= ?p1 1)))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::atacar_atras
	(declare (salience 49))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (= ?y1 (+ ?y2 1)))
	(test (not(= ?p1 1)))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Aproximar no seguro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::aproximar_izq
	(declare (salience 44))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(tiempo ?t)
	(test (not(= ?p1 1)))
	(test (< ?p1 4))
	(test (> ?p1 1))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::aproximar_der
	(declare (salience 44))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(tiempo ?t)
	(test (not(= ?p1 1)))
	(test (< ?p1 4))
	(test (> ?p1 1))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::aproximar_frente
	(declare (salience 45))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (not(= ?p1 1)))
	(test (< ?p1 4))
	(test (> ?p1 1))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::aproximar_atras
	(declare (salience 43))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (not(= ?p1 1)))
	(test (< ?p1 4))
	(test (> ?p1 1))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Huir si estamos solos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::uno_solo_izq
	(declare (salience 39))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(tiempo ?t)
	(test (> ?x1 ?x2))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::uno_solo_der
	(declare (salience 39))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(tiempo ?t)
	(test (> ?x2 ?x1))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::aproximar_frente
	(declare (salience 40))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (> ?y1 ?y2))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::aproximar_atras
	(declare (salience 38))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (> ?y2 ?y1))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Si no se puede hacer nada, moverse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::mover-adelante
  (declare (salience 31))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mover-derecha
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::mover-izquierda
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

