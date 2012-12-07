;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial  ;
;básicas para el equipo Sario13     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Jose Antonio Cano Molina

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							REGLAS PARA FICHA 1								  ;
;								Huida del rey											;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::zigzag1
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 


(defrule EQUIPO-A::zigzag2
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag3
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos  1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag4
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							REGLAS PARA FICHA 4								  	;
; Utilidad de los 4 = Despitar y buscar al 6 rival.	;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::AvanzarBusqueda
(declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 4))
	
  (test  (< ?ya 8))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Busquedaderecha
(declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 4))
  (test  (and (= ?ya 8) (= ?xa 8)))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Busquedaizquierda
(declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 4))

  (test  (and (= ?ya 8) (= ?xa 1)))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							REGLAS PARA FICHA 5								  ;
; Movimiento principal:														;
; Los 5 van por delante: son potentes, 						;
;	y reservamos el 6 para la defensa.					    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avanza_5
(declare (salience 80))
  (tiempo ?t)
	(ficha (equipo "A") (num ?na) (puntos 5) (pos-x ?xa) (pos-y ?ya))
  
  (test (< ?ya 8))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::retrocede_5
(declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (puntos 5) (pos-x ?xa) (pos-y ?ya))
  
  (test (= ?ya 8))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t)))
)
(defrule EQUIPO-A::derecha-5
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?xa) (pos-y ?ya))
  (dimension ?dim&:(= ?ya (- ?dim 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::izquierda-5
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n) (pos-x ?x2) (pos-y ?y2))
	(test  (and (= ?y 8) (= ?y2 8)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque-5
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test(and (= ?x ?dim) (= ?x 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							REGLAS PARA FICHAS < 4						  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::basica-3
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::basica-1
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (+ ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::basica-2
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (- ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							REGLAS PARA FICHA 6								  	;
; Movimientos defensivos del 6.											;
;	Defensa a 1 casilla del rey												;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::defiende1casillaizq
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (puntos 6)(pos-x ?xa) (pos-y ?ya))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?xa(- ?x2 1)) (= ?ya ?y2)))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::defiende1casillaizq_aba
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (pos-x ?xa) (pos-y ?ya) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) )
	(test (and (= ?x2 ?xa) (= ?ya (- ?y2 1))))	
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::defensa1casilladerecha
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (pos-x ?xa) (pos-y ?ya)(puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) )
	(test (and (= ?xa(+ ?x2 1)) (= ?ya ?y2)))	
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::defiende1casillader_aba
	(declare (salience 77))
	(ficha (equipo "A") (num ?n1) (pos-x ?xa) (pos-y ?ya) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?xa ?x2) (= ?ya (+ ?y2 1))))	
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

;Defensa a 2 casillas del rey

(defrule EQUIPO-A::defiende2casillaizq
	(declare (salience 77))
	(ficha (equipo "A") (num ?n1) (pos-x ?xa) (pos-y ?ya) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) )
	(test (and (= ?xa (- ?x2 2)) (= ?ya ?y2)))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::defensa2casilladerecha
	(declare (salience 77))
	(ficha (equipo "A") (num ?n1) (pos-x ?xa) (pos-y ?ya) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?xa(+ ?x2 2)) (= ?ya ?y2)))	
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 


