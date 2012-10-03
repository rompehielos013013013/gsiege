; xkcd rules (http://xkcd.com/534/)

(defrule EQUIPO-A::coste_algoritmo_convertirse_en_skynet
  (declare (salience 80))
  (tiempo ?t)

  =>

  (printout t "Turno " ?t ". Aún no he tomado conciencia de mí mismo." crlf)

)

;; Cuando una ficha tiene muerte obvia a tiro

(defrule EQUIPO-A::fichaMuerteObvia1
	(declare (salience 61))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test 
		(and
			(> ?p1 ?p2) 
			(and (= ?x2 (+ ?x1 1)) (= ?y1 ?y2)) ; Posición D
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))

	(printout t "fichaMuerteObvia1" crlf)

)

(defrule EQUIPO-A::fichaMuerteObvia2
	(declare (salience 61))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test 
		(and
			(> ?p1 ?p2) 
			(and (= ?x2 (- ?x1 1)) (= ?y1 ?y2)) ; Posición B
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))

	(printout t "fichaMuerteObvia2" crlf)

)

(defrule EQUIPO-A::fichaMuerteObvia3
	(declare (salience 61))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test 
		(and
			(> ?p1 ?p2) 
			(and (= ?y2 (+ ?y1 1)) (= ?x1 ?x2)) ; Posición A
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))

	(printout t "fichaMuerteObvia3" crlf)

)

(defrule EQUIPO-A::fichaMuerteObvia4
	(declare (salience 61))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test 
		(and
			(> ?p1 ?p2) 
			(and (= ?y2 (- ?y1 1)) (= ?x1 ?x2)) ; Posición C
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))

	(printout t "fichaMuerteObvia4" crlf)

)

;; Cuando la ficha 1 esta en peligro

(defrule EQUIPO-A::ficha1PeligroHuye1
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (- ?x1 1)) (= ?y1 ?y2)) ; Posición B
				(and (= ?y2 (+ ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 2
				(and (= ?x2 (- ?x1 2)) (= ?y1 ?y2)) ; Posición 3
				(and (= ?y2 (- ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 4
			)
			(not 
				(and
					(> ?xo ?x1)
					(<> ?x1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))

	(printout t "ficha1PeligroHuye1" crlf)

)

(defrule EQUIPO-A::ficha1PeligroHuye2
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (+ ?x1 1)) (= ?y1 ?y2)) ; Posición D
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
				(and (= (+ ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 7
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
			)
			(not 
				(and
					(< ?xo ?x1)
					(<> ?x1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))

	(printout t "ficha1PeligroHuye2" crlf)

)

(defrule EQUIPO-A::ficha1PeligroHuye3
	(declare (salience 78))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (- ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición C
				(and (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 4
				(and (= (- ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 5
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
			)
			(not
				(and
					(> ?yo ?y1)
					(<> ?y1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))

	(printout t "ficha1PeligroHuye2" crlf)

)

(defrule EQUIPO-A::ficha1PeligroHuye4
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (+ ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición D
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
				(and (= (+ ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 1
				(and (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 2
			)
			(not 
				(and
					(< ?yo ?y1)
					(<> ?y1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))

	(printout t "ficha1PeligroHuye4" crlf)

)

;; Cuando la ficha 2 esta en peligro

(defrule EQUIPO-A::ficha2PeligroHuye1
	(declare (salience 68))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 3) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (- ?x1 1)) (= ?y1 ?y2)) ; Posición B
				(and (= ?y2 (+ ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 2
				(and (= ?x2 (- ?x1 2)) (= ?y1 ?y2)) ; Posición 3
				(and (= ?y2 (- ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 4
			)
			(not 
				(and
					(> ?xo ?x1)
					(<> ?x1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))

	(printout t "ficha2PeligroHuye1" crlf)

)

(defrule EQUIPO-A::ficha2PeligroHuye2
	(declare (salience 68))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 3) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (+ ?x1 1)) (= ?y1 ?y2)) ; Posición D
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
				(and (= (+ ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 7
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
			)
			(not 
				(and
					(< ?xo ?x1)
					(<> ?x1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))

	(printout t "ficha2PeligroHuye2" crlf)

)

(defrule EQUIPO-A::ficha2PeligroHuye3
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 3) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (- ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición C
				(and (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 4
				(and (= (- ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 5
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
			)
			(not
				(and
					(> ?yo ?y1)
					(<> ?y1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))

	(printout t "ficha2PeligroHuye2" crlf)

)

(defrule EQUIPO-A::ficha2PeligroHuye4
	(declare (salience 67))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 3) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (+ ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición D
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
				(and (= (+ ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 1
				(and (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 2
			)
			(not 
				(and
					(< ?yo ?y1)
					(<> ?y1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))

	(printout t "ficha2PeligroHuye4" crlf)

)

;; Cuando la ficha 3 esta en peligro

(defrule EQUIPO-A::ficha3PeligroHuye1
	(declare (salience 71))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (- ?x1 1)) (= ?y1 ?y2)) ; Posición B
				(and (= ?y2 (+ ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 2
				(and (= ?x2 (- ?x1 2)) (= ?y1 ?y2)) ; Posición 3
				(and (= ?y2 (- ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 4
			)
			(not 
				(and
					(> ?xo ?x1)
					(<> ?x1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))

	(printout t "ficha3PeligroHuye1" crlf)

)

(defrule EQUIPO-A::ficha3PeligroHuye2
	(declare (salience 71))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (+ ?x1 1)) (= ?y1 ?y2)) ; Posición D
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
				(and (= (+ ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 7
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
			)
			(not 
				(and
					(< ?xo ?x1)
					(<> ?x1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))

	(printout t "ficha3PeligroHuye2" crlf)

)

(defrule EQUIPO-A::ficha3PeligroHuye3
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (- ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición C
				(and (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 4
				(and (= (- ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 5
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
			)
			(not
				(and
					(> ?yo ?y1)
					(<> ?y1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))

	(printout t "ficha3PeligroHuye3" crlf)

)

(defrule EQUIPO-A::ficha3PeligroHuye4
	(declare (salience 72))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (+ ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición D
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
				(and (= (+ ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 1
				(and (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 2
			)
			(not 
				(and
					(< ?yo ?y1)
					(<> ?y1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))

	(printout t "ficha3PeligroHuye4" crlf)

)

;; Cuando la ficha 4 esta en peligro

(defrule EQUIPO-A::ficha4PeligroHuye1
	(declare (salience 73))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (- ?x1 1)) (= ?y1 ?y2)) ; Posición B
				(and (= ?y2 (+ ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 2
				(and (= ?x2 (- ?x1 2)) (= ?y1 ?y2)) ; Posición 3
				(and (= ?y2 (- ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 4
			)
			(not 
				(and
					(> ?xo ?x1)
					(<> ?x1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))

	(printout t "ficha4PeligroHuye1" crlf)

)

(defrule EQUIPO-A::ficha4PeligroHuye2
	(declare (salience 73))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (+ ?x1 1)) (= ?y1 ?y2)) ; Posición D
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
				(and (= (+ ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 7
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
			)
			(not 
				(and
					(< ?xo ?x1)
					(<> ?x1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))

	(printout t "ficha4PeligroHuye2" crlf)

)

(defrule EQUIPO-A::ficha4PeligroHuye3
	(declare (salience 74))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (- ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición C
				(and (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 4
				(and (= (- ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 5
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
			)
			(not
				(and
					(> ?yo ?y1)
					(<> ?y1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))

	(printout t "ficha4PeligroHuye3" crlf)

)

(defrule EQUIPO-A::ficha4PeligroHuye4
	(declare (salience 72))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (+ ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición D
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
				(and (= (+ ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 1
				(and (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 2
			)
			(not 
				(and
					(< ?yo ?y1)
					(<> ?y1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))

	(printout t "ficha4PeligroHuye4" crlf)

)


;; Cuando la ficha 5 esta en peligro

(defrule EQUIPO-A::ficha5PeligroHuye1
	(declare (salience 76))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (- ?x1 1)) (= ?y1 ?y2)) ; Posición B
				(and (= ?y2 (+ ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 2
				(and (= ?x2 (- ?x1 2)) (= ?y1 ?y2)) ; Posición 3
				(and (= ?y2 (- ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 4
			)
			(not 
				(and
					(> ?xo ?x1)
					(<> ?x1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))

	(printout t "ficha5PeligroHuye1" crlf)

)

(defrule EQUIPO-A::ficha5PeligroHuye2
	(declare (salience 76))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= ?x2 (+ ?x1 1)) (= ?y1 ?y2)) ; Posición D
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
				(and (= (+ ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 7
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
			)
			(not 
				(and
					(< ?xo ?x1)
					(<> ?x1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))

	(printout t "ficha5PeligroHuye2" crlf)

)

(defrule EQUIPO-A::ficha5PeligroHuye3
	(declare (salience 77))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (- ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición C
				(and (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 4
				(and (= (- ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 5
				(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
			)
			(not
				(and
					(> ?yo ?y1)
					(<> ?y1 1)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))

	(printout t "ficha5PeligroHuye3" crlf)

)

(defrule EQUIPO-A::ficha5PeligroHuye4
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(or 
				(and (= (+ ?y1 1) ?y2) (= ?x1 ?x2)) ; Posición D
				(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
				(and (= (+ ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 1
				(and (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 2
			)
			(not 
				(and
					(< ?yo ?y1)
					(<> ?y1 8)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))

	(printout t "ficha5PeligroHuye4" crlf)

)

;; Cuando las fichas 4 estan seguras

(defrule EQUIPO-A::ficha4SeguraMata1
	(declare (salience 58))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= ?y2 (+ ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 2
					(and (= ?x2 (- ?x1 2)) (= ?y1 ?y2)) ; Posición 3
					(and (= ?y2 (- ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 4
				)
			)
			(= ?y3 ?y1)
			(< ?x3 ?x1)
			(not 
				(and
					(< ?xo ?x1)
					(= ?yo ?y1)
					(> ?xo ?x3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))

	(printout t "ficha4SeguraMata1" crlf)

)

(defrule EQUIPO-A::ficha4SeguraMata2
	(declare (salience 58))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
					(and (= (+ ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 7
					(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
				)
			)
			(= ?y3 ?y1)
			(> ?x3 ?x1)
			(not 
				(and
					(> ?xo ?x1)
					(= ?yo ?y1)
					(< ?xo ?x3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))

	(printout t "ficha4SeguraMata2" crlf)

)

(defrule EQUIPO-A::ficha4SeguraMata3
	(declare (salience 58))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 4
					(and (= (- ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 5
					(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
				)
			)
			(< ?y3 ?y1)
			(= ?x3 ?x1)
			(not 
				(and
					(< ?yo ?y1)
					(= ?xo ?x1)
					(> ?yo ?y3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))

	(printout t "ficha4SeguraMata3" crlf)

)

(defrule EQUIPO-A::ficha4SeguraMata4
	(declare (salience 58))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 4)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
					(and (= (+ ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 1
					(and (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 2
				)
			)
			(> ?y3 ?y1)
			(= ?x3 ?x1)
			(not 
				(and
					(> ?yo ?y1)
					(= ?xo ?x1)
					(< ?yo ?y3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))

	(printout t "ficha4SeguraMata4" crlf)

)

;; Cuando las fichas 5 son seguras

(defrule EQUIPO-A::ficha5SeguraMata1
	(declare (salience 59))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= ?y2 (+ ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 2
					(and (= ?x2 (- ?x1 2)) (= ?y1 ?y2)) ; Posición 3
					(and (= ?y2 (- ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 4
				)
			)
			(= ?y3 ?y1)
			(< ?x3 ?x1)
			(not 
				(and
					(< ?xo ?x1)
					(= ?yo ?y1)
					(> ?xo ?x3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))

	(printout t "ficha5SeguraMata1" crlf)

)

(defrule EQUIPO-A::ficha5SeguraMata2
	(declare (salience 59))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
					(and (= (+ ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 7
					(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
				)
			)
			(= ?y3 ?y1)
			(> ?x3 ?x1)
			(not 
				(and
					(> ?xo ?x1)
					(= ?yo ?y1)
					(< ?xo ?x3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))

	(printout t "ficha5SeguraMata2" crlf)

)

(defrule EQUIPO-A::ficha5SeguraMata3
	(declare (salience 59))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 4
					(and (= (- ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 5
					(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
				)
			)
			(< ?y3 ?y1)
			(= ?x3 ?x1)
			(not 
				(and
					(< ?yo ?y1)
					(= ?xo ?x1)
					(> ?yo ?y3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))

	(printout t "ficha5SeguraMata3" crlf)

)

(defrule EQUIPO-A::ficha5SeguraMata4
	(declare (salience 59))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 5)))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
					(and (= (+ ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 1
					(and (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 2
				)
			)
			(> ?y3 ?y1)
			(= ?x3 ?x1)
			(not 
				(and
					(> ?yo ?y1)
					(= ?xo ?x1)
					(< ?yo ?y3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))

	(printout t "ficha5SeguraMata4" crlf)

)

;; Cuando la ficha 6 está segura

(defrule EQUIPO-A::ficha6SeguraMata1
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= ?y2 (+ ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 2
					(and (= ?x2 (- ?x1 2)) (= ?y1 ?y2)) ; Posición 3
					(and (= ?y2 (- ?y1 1)) (= ?x2 (- ?x1 1))) ; Posición 4
				)
			)
			(= ?y3 ?y1)
			(< ?x3 ?x1)
			(not 
				(and
					(< ?xo ?x1)
					(= ?yo ?y1)
					(> ?xo ?x3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))

	(printout t "ficha6SeguraMata1" crlf)

)

(defrule EQUIPO-A::ficha6SeguraMata2
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
					(and (= (+ ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 7
					(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
				)
			)
			(= ?y3 ?y1)
			(> ?x3 ?x1)
			(not 
				(and
					(> ?xo ?x1)
					(= ?yo ?y1)
					(< ?xo ?x3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))

	(printout t "ficha6SeguraMata2" crlf)

)

(defrule EQUIPO-A::ficha6SeguraMata3
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 4
					(and (= (- ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 5
					(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
				)
			)
			(< ?y3 ?y1)
			(= ?x3 ?x1)
			(not 
				(and
					(< ?yo ?y1)
					(= ?yo ?y1)
					(> ?yo ?y3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))

	(printout t "ficha6SeguraMata3" crlf)

)

(defrule EQUIPO-A::ficha6SeguraMata4
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6) (descubierta 1))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(obstaculo (pos-x ?xo) (pos-y ?yo))
	(test 
		(and 
			(not 
				(or 
					(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8
					(and (= (+ ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 1
					(and (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 2
				)
			)
			(> ?y3 ?y1)
			(= ?x3 ?x1)
			(not 
				(and
					(> ?yo ?y1)
					(= ?yo ?y1)
					(< ?yo ?y3)
				)
			)
		)
	)
	
	=>

	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))

	(printout t "ficha6SeguraMata4" crlf)

)

;		(and (= (+ ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 1
;		(and (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 2
;		(and (= (- ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 3
;		(and (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)) ; Posición 4
;		(and (= (- ?y1 2) ?y2) (= ?x1 ?x2)) ; Posición 5
;		(and (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 6
;		(and (= (+ ?x1 2) ?x2) (= ?y1 ?y2)) ; Posición 7
;		(and (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)) ; Posición 8