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

;PROTEGER REY
;-------------------------------------------------------------------
	(defrule EQUIPO-A::mover_izq_41
	(declare (salience 68))
		(ficha (equipo "A") (num R41) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 4) (> ?x1 3)))
			(tiempo ?t)
		=>
		(assert (mueve (num R41) (mov 2) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_der_41
		(declare (salience 68))
		(ficha (equipo "A") (num R41) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 1) (< ?x1 3)))
			(tiempo ?t)
		=>
		(assert (mueve (num R41) (mov 1) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_arr_41
		(declare (salience 68))
		(ficha (equipo "A") (num R41) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 1) (< ?y1 4)))
			(tiempo ?t)
		=>
		(assert (mueve (num R41) (mov 3) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_aba_41
		(declare (salience 68))
		(ficha (equipo "A") (num R41) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 1) (> ?y1 4)))
			(tiempo ?t)
		=>
		(assert (mueve (num R41) (mov 4) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_izq_42
		(declare (salience 68))
		(ficha (equipo "A") (num R42) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 4) (> ?x1 5)))
			(tiempo ?t)
		=>
		(assert (mueve (num R42) (mov 2) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_der_42
		(declare (salience 68))
		(ficha (equipo "A") (num R42) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 1) (< ?x1 5)))
			(tiempo ?t)
		=>
		(assert (mueve (num R42) (mov 1) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_arr_42
		(declare (salience 68))
		(ficha (equipo "A") (num R42) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 1) (< ?y1 4)))
			(tiempo ?t)
		=>
		(assert (mueve (num R42) (mov 3) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_aba_42
		(declare (salience 68))
		(ficha (equipo "A") (num R42) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 1) (> ?y1 4)))
			(tiempo ?t)
		=>
		(assert (mueve (num R42) (mov 4) (tiempo ?t))))
		
		
;DEFECTO : ATACAR SI HAY ENEMIGO MÁS PEQUEÑO
;-------------------------------------------------------------------

	(defrule EQUIPO-A::mover_izq_4
		(declare (salience 65))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num ?n2) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		
		(test (and (> ?p1 ?p2) (= ?p1 4) (> ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_der_4
		(declare (salience 65))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num ?n2) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		
		(test (and (> ?p1 ?p2) (= ?p1 4) (< ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_arr_4
		(declare (salience 65))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num ?n2) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		
		(test (and (> ?p1 ?p2) (= ?p1 4) (< ?y1 ?y2)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_aba_4
		(declare (salience 65))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num ?n2) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		
		(test (and (> ?p1 ?p2) (= ?p1 4) (> ?y1 ?y2)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

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

(defrule EQUIPO-A::mover_arr_51DEF
		(declare (salience 67))
		(ficha (equipo "A") (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (< ?y1 8)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 3) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_arr_51ATA1
		(declare (salience 67))
		(ficha (equipo "A") (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?y1 8) (> ?y2 ?x1) (= ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 3) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_aba_51ATA1
		(declare (salience 67))
		(ficha (equipo "A") (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?y1 8) (< ?y2 ?x1) (= ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 4) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_der_51ATA1
		(declare (salience 67))
		(ficha (equipo "A") (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?y1 8) (< ?x1 8)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 1) (tiempo ?t))))

	(defrule EQUIPO-A::mover_aba_51ATA
		(declare (salience 67))
		(ficha (equipo "A") (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?p2 1) (> ?y1 ?y2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 4) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_arr_51ATA
		(declare (salience 67))
		(ficha (equipo "A") (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?p2 1) (< ?y1 ?y2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 3) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_der_51ATA
		(declare (salience 67))
		(ficha (equipo "A") (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?p2 1) (< ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 1) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_der_51ATA
		(declare (salience 67))
		(ficha (equipo "A") (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?p2 1) (< ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 1) (tiempo ?t))))

	(defrule EQUIPO-A::mover_arr_52DEF
		(declare (salience 66))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (< ?y1 7)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 3) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_arr_52ATA1
		(declare (salience 67))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?y1 7) (> ?y2 ?x1) (= ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 3) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_aba_52ATA1
		(declare (salience 67))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?y1 7) (< ?y2 ?x1) (= ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 4) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_izq_52ATA1
		(declare (salience 67))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?y1 7) (> ?x1 1)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 4) (tiempo ?t))))

	(defrule EQUIPO-A::mover_aba_52ATA
		(declare (salience 67))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?p2 1) (> ?y1 ?y2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 4) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_arr_52ATA
		(declare (salience 67))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?p2 1) (< ?y1 ?y2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 3) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_izq_52ATA
		(declare (salience 67))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?p2 1) (> ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 2) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_der_52ATA
		(declare (salience 67))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		(ficha (equipo "B") (num R11) (pos-x ?x2)
			(pos-y ?y2) (puntos ?p2) (descubierta 1))
		(not(ficha (equipo "A") (num 61)))
		
		(test (and (= ?p1 5) (= ?p2 1) (< ?x1 ?x2)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 1) (tiempo ?t))))
		

;DEFECTO : VOLVER A POSICIÓN DE DEFENSA
;-------------------------------------------------------------------

	(defrule EQUIPO-A::mover_izq_51DEF
		(declare (salience 61))
		(ficha (equipo "A")  (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 5) (= ?x1 4)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 2) (tiempo ?t))))
	
		
	(defrule EQUIPO-A::mover_arr_51DEF
		(declare (salience 60))
		(ficha (equipo "A") (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 5) (< ?y1 6)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 3) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_aba_51DEF
		(declare (salience 60))
		(ficha (equipo "A")  (num R51) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 5)(> ?y1 5)))
			(tiempo ?t)
		=>
		(assert (mueve (num R51) (mov 4) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_der_52DEF
		(declare (salience 61))
		(ficha (equipo "A")  (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 5) (= ?x1 4)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 1) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_arr_52DEF
		(declare (salience 60))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 5) (< ?y1 6)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 3) (tiempo ?t))))
	
	(defrule EQUIPO-A::mover_aba_52DEF
		(declare (salience 60))
		(ficha (equipo "A") (num R52) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 5) (> ?y1 5)))
			(tiempo ?t)
		=>
		(assert (mueve (num R52) (mov 4) (tiempo ?t))))
		
		
;FICHA 6
;···································································

;IR A POR UVAS (SUBIR A ATACAR)
;-------------------------------------------------------------------

	(defrule EQUIPO-A::mover_arr_6DEF
		(declare (salience 71))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 6) (< ?y1 8)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
		
		
;DESPLAZARSE POR LAS LÍNEAS ENEMIGAS
;-------------------------------------------------------------------
		
	(defrule EQUIPO-A::mover_izq_6
		(declare (salience 75))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 6) (> ?y1 7)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) ;FUUUUUUUUUU
		
	(defrule EQUIPO-A::mover_aba_6
		(declare (salience 76))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 6) (= ?y1 8) (= ?x1 1)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))
		
	(defrule EQUIPO-A::mover_der_6
		(declare (salience 69))
		(ficha (equipo "A") (num ?n1) (pos-x ?x1)
			(pos-y ?y1) (puntos ?p1))
		
		(test (and (= ?p1 6) (= ?y1 7) (< ?x1 7)))
			(tiempo ?t)
		=>
		(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
		
