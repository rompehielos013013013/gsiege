;FICHA 1
;···································································

;HUIR
;-------------------------------------------------------------------

(defrule EQUIPO-A::huir_horiz_izq_1
	(declare (salience 79))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)
		(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)
		(pos-y ?y2) (puntos ?p2))
	
	(test (and (= ?p1 1) (= ?y1 ?y2) (= ?x1 (- ?x2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::huir_horiz_der_1
	(declare (salience 79))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)
		(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)
		(pos-y ?y2) (puntos ?p2))
	
	(test (and (= ?p1 1) (= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
	
(defrule EQUIPO-A::huir_vert_arr_1
	(declare (salience 79))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)
		(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)
		(pos-y ?y2) (puntos ?p2))
	
	(test (and (= ?p1 1) (= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::huir_vert_aba_1
	(declare (salience 79))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)
		(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)
		(pos-y ?y2) (puntos ?p2))

	(test (and (= ?p1 1) (= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))
	

;DEFECTO : IR A (4,4)
;-------------------------------------------------------------------
	
(defrule EQUIPO-A::mover_arr_1
	(declare (salience 75))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)
		(pos-y ?y1) (puntos ?p1))
	
	(test (and (= ?p1 1) (< ?y1 4)))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
	

;FICHAS 2
;···································································

;DEFECTO : IR ARRIBA
;-------------------------------------------------------------------

(defrule EQUIPO-A::mover_arr_2
	(declare (salience 1))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)
		(pos-y ?y1) (puntos ?p1))
	
	(test (and (= ?p1 2) (< ?y1 8)))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
	
	
;FICHAS 3
;···································································

;DEFECTO : IR ARRIBA
;-------------------------------------------------------------------

(defrule EQUIPO-A::mover_arr_3
	(declare (salience 1))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)
		(pos-y ?y1) (puntos ?p1))
	
	(test (and (= ?p1 3) (< ?y1 8)))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
	
	
;FICHAS 4
;···································································

(defrule EQUIPO-A::mover_arr_4
	(declare (salience 1))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)
		(pos-y ?y1) (puntos ?p1))
	
	(test (and (= ?p1 4) (< ?y1 8)))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
	

;FICHAS 5
;···································································

;ATACAR SI HAY ENEMIGO MÁS PEQUEÑO
;-------------------------------------------------------------------

	(defrule EQUIPO-A::mover_izq_5
		(declare (salience 65))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num ?n2) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		
		(test (and (> ?p1 ?p2) (= ?p1 5) (> ?x1 ?x2) (< ?y2 7)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_der_5
		(declare (salience 65))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num ?n2) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		
		(test (and (> ?p1 ?p2) (= ?p1 5) (< ?x1 ?x2) (< ?y2 7)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_arr_5
		(declare (salience 65))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num ?n2) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		
		(test (and (> ?p1 ?p2) (= ?p1 5) (< ?y1 ?y2) (< ?y2 7)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_aba_5
		(declare (salience 65))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num ?n2) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		
		(test (and (> ?p1 ?p2) (= ?p1 5) (> ?y1 ?y2) (< ?y2 7)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))
		
		
;SEIS MUERTO : MODO ATAQUE
;-------------------------------------------------------------------

(defrule EQUIPO-A::cinco_subir_inicial
	 (declare (salience 69))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	 (test (< ?y 8))
	 =>
	 (assert (mueve (num 5) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::cinco_primer_giro_izq
	 (declare (salience 69))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 5))
	 =>
	 (assert (mueve (num 5) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::cinco_paso_abajo
	 (declare (salience 69))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x 8) (pos-y 8) (puntos 5))
	 =>
	 (assert (mueve (num 5) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::cinco_barrer_y8
	 (declare (salience 59))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 5))
	 (test (> ?x 1))
	 =>
	 (assert (mueve (num 5) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::cinco_bajar_y7
	 (declare (salience 59))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x 1) (pos-y 8) (puntos 5))
	 =>
	 (assert (mueve (num 5) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::cinco_barrer_y7
	 (declare (salience 59))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 7) (puntos 5))
	 (test (< ?x 8))
	 =>
	 (assert (mueve (num 5) (mov 1) (tiempo ?t)))
	 (assert (fin_barrido_6))
)

		
		
;FICHA 6
;···································································

(defrule EQUIPO-A::SEIS_subir_inicial
	 (declare (salience 72))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	 (test (< ?y 8))
	 =>
	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::SEIS_primer_giro_izq
	 (declare (salience 73))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 6))
	 =>
	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::SEIS_barrer_y8
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 6))
	 (test (> ?x 1))
	 =>
	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::SEIS_barrer_y7
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 7) (puntos 6))
	 (test (< ?x 8))
	 =>
	 (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
	 (assert (fin_barrido_6))
)

