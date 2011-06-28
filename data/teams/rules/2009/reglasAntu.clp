;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reglas de Inteligencia Artificial                     
; Por Antonio Carrasco Gonzalez
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Comprobar izquierda;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::lado_izquierdo
	(declare (salience 79))
	(ficha (equipo "A") (num ?n) (pos-x 1) (pos-y ?y) (puntos 6))
	(not(lizq))
	=>
	(assert (lizq)))

;;;;;;;;;;;;;;;;;;;;;;;;;;(defrule EQUIPO-A::proteger_1_derecha
	(declare (salience 79))
	(ficha (equipo "A") (num A227) (pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p) (descubierta 1))
	(test (and (= ?x1 (- ?x 1)) (<= ?p 5)))
	(not(volver2))
	=>
	(assert(volver2))
	(assert (mueve (num A227) (mov 1) (tiempo ?t))))
;Comprobar arriba;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::lado_arriba
	(declare (salience 80))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 6))
	(not(arriba))
	=>
	(assert (arriba)))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;Comprobar abajo;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::lado_abajo
	(declare (salience 80))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 1) (puntos 6))
	(not(abajo))
	?a<-(arriba)
	=>
	(assert (abajo))
	(retract ?a))

;;;;;;;;;;;;;;;;;;;;
;Comprobar 6;
;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::heroe
	(declare (salience 80))
	(not(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6)))
	(not(noheroe))
	=>
	(assert (noheroe)))

;;;;;;;;;;;;;;;;;;;;
;Comprobar 5;
;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::heroe
	(declare (salience 80))
	(not(ficha (equipo "A") (num 227) (puntos 5)))
	(not(nocinco))
	=>
	(assert (nocinco)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Movimiento hacia arriba;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::avance6a
	(declare (salience 60))
	(ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 6))
	(test (<> ?y 8))
	(tiempo ?t)
	(not(lizq))
	(not(noheroe))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))
	               
(defrule EQUIPO-A::avance1a
	(declare (salience 63))
	(ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 6))
	(ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 1))
	(test (< ?y1 ?y))		
	(tiempo ?t)
	(not(lizq))
	(not(noheroe))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::avance5a
	(declare (salience 62))
	(ficha (equipo "A") (num ?n) (pos-x 7) (pos-y ?y) (puntos 5))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(test (and (= ?y ?y1) (<> ?y 7)))		
	(tiempo ?t)
	(not(lizq))
	(not(noheroe))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Movimiento hacia la izquierda;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance6i
	(declare (salience 60))
	(ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 6))
	(test (= ?y 8))
	(tiempo ?t)
	(not(lizq))
	(not(noheroe))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Movimiento hacia derecha;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance6d
	(declare (salience 62))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(test (< ?x 6))
	(tiempo ?t)
	(lizq)
	(derecha)
	(not(noheroe))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Movimiento hacia la izquierda;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance6i2 ; Cuando el 6 llega a la derecha despues de haber bajado
	(declare (salience 62))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(test (> ?x 1))
	(tiempo ?t)
	(lizq)
	(izquierda)
	(not(noheroe))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Movimiento hacia abajo;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance6abajo ;Cuando el 6 llega a la izquierda de arriba
	(declare (salience 64))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(test(= ?x 1))
	(tiempo ?t)
	(lizq)
	(not(noheroe))
	(not(derecha))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
	(assert (derecha)))


(defrule EQUIPO-A::avance6abajo2 ; Cuando el 6 llega a la derecha
	(declare (salience 64))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(test(= ?x 6))
	(tiempo ?t)
	(not(noheroe))
	(lizq)
	(derecha)
	?a<-(derecha)
	(not(izquierda))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
	(retract ?a)
	(assert (izquierda)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Si llegamos aquí el heroe ha muerto;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas para el 5;
;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Comprobar izquierda para 5;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::lado_izquierdo5
	(declare (salience 59))
	(ficha (equipo "A") (num A226) (pos-x 1) (pos-y ?y) (puntos 5))
	(noheroe)
	(not(lizq5))
	?a<-(lder5)
	=>
	(assert (lizq5))
	(retract ?a))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Comprobar derecha para 5;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::lado_derecho5
	(declare (salience 59))
	(ficha (equipo "A") (num A226) (pos-x 6) (pos-y ?y) (puntos 5))
	(noheroe)
	(not(lder5))
	?a<-(lizq5)
	=>
	(assert (lder5))
	(retract ?a))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Avanzamos hacia delante;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance5a2
	(declare (salience 50))
	(ficha (equipo "A") (num A226) (pos-x ?x) (pos-y ?y) (puntos 5))
	(noheroe)
	(test (or (= ?x 6) (= ?x 1)) )
	(tiempo ?t)
	=>
	(assert (mueve (num A226) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Avanzamos hacia la izquierda;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance5i
	(declare (salience 50))
	(ficha (equipo "A") (num A226) (pos-x ?x) (pos-y ?y) (puntos 5))
	(test (> ?x 1))
	(tiempo ?t)
	(noheroe)
	(lder5)
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Avanzamos hacia la derecha;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance5d
	(declare (salience 50))
	(ficha (equipo "A") (num A226) (pos-x ?x) (pos-y ?y) (puntos 5))
	(test (< ?x 6))
	(tiempo ?t)
	(noheroe)
	(lizq5)
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;
;Proteger al 1;
;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;
;Asegurar el 1;
;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::asegurarse11
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y) (puntos ?p))	
	(test (or(= ?x (- ?x1 1)) (= ?x (+ ?x1 1)) ))	
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::asegurarse12
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y) (puntos ?p))	
	(test (or(= ?x (- ?x1 1)) (= ?x (+ ?x1 1)) ))	
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::asegurarse13
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y1) (puntos ?p))	
	(test (or(= ?y (- ?y1 1)) (= ?y (+ ?y1 1)) ))	
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::asegurarse14
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y1) (puntos ?p))	
	(test (or(= ?y (- ?y1 1)) (= ?y (+ ?y1 1)) ))	
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::asegurarse15
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y) (puntos ?p))	
	(test (or(= ?x (-1 ?x1))(= ?x (+1 ?x1))) ) 
	(not(noheroe))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::asegurarse16
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y) (puntos ?p))	
	(test (or(= ?x (-1 ?x1))(= ?x (+1 ?x1))) ) 
	(not(noheroe))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;
;Mover 5 ultimo;
;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Comprobar izquierda para 5;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::lado_izquierdo5_ultimo
	(declare (salience 49))
	(ficha (equipo "A") (num A227) (pos-x 1) (pos-y ?y) (puntos 5))
	(noheroe)
	(nocinco)
	(not(lizq5))
	?a<-(lder5)
	=>
	(assert (lizq5))
	(retract ?a))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Comprobar derecha para 5;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::lado_derecho5_ultimo
	(declare (salience 49))
	(ficha (equipo "A") (num A227) (pos-x 6) (pos-y ?y) (puntos 5))
	(noheroe)
	(nocinco)
	(not(lder5))
	?a<-(lizq5)
	=>
	(assert (lder5))
	(retract ?a))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Avanzamos hacia delante;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance5a2_ultimo
	(declare (salience 40))
	(ficha (equipo "A") (num A227) (pos-x ?x) (pos-y ?y) (puntos 5))
	(noheroe)
	(nocinco)
	(test (or (= ?x 6) (= ?x 1)) )
	(tiempo ?t)
	=>
	(assert (mueve (num A227) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Avanzamos hacia la izquierda;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance5i_ultimo
	(declare (salience 40))
	(ficha (equipo "A") (num A227) (pos-x ?x) (pos-y ?y) (puntos 5))
	(test (> ?x 1))
	(tiempo ?t)
	(nocinco)
	(noheroe)
	(lder5)
	=>
	(assert (mueve (num A227) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Avanzamos hacia la derecha;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance5d_ultimo
	(declare (salience 40))
	(ficha (equipo "A") (num A227) (pos-x ?x) (pos-y ?y) (puntos 5))
	(test (< ?x 6))
	(tiempo ?t)
	(nocinco)
	(noheroe)
	(lizq5)
	=>
	(assert (mueve (num A227) (mov 1) (tiempo ?t))))

