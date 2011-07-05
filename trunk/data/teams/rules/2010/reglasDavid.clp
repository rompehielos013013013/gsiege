;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	RESISTENCIA 2012 - SISTEMAS EXPERTOS		;
;							;
;		David Saltares Márquez			;
;							;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							;
;	0 - COMPROBACIONES (inteligencia de guerra)	;
;	Prioridades (70-80)				;
;							;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::muerta_6
	(declare (salience 75))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Si la ficha 6 ha muerto
	(not (ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 6)))

	=>
	
	; Actuación
	
	(printout t "Ficha 6: muerta" crlf)
	(assert (ficha_6_muerta))
)

(defrule EQUIPO-A::muertas_5
	(declare (salience 75))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Si las fichas 5 han muerto
	(not (ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 5)))

	=>
	
	; Actuación

	(printout t "Fichas 5: muertas" crlf)
	(assert (ficha_5_muerta))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							;
;	1 - DEFENSA DEL REY (Salvando el pellejo)	;
;	Prioridades (70-80)				;
;							;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::rey_atacado_arriba_mueve_abajo
	(declare (salience 80))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está arriba
	(test (and (= ?x-rey ?x-ene) (= ?y-rey (- ?y-ene 1))))
	
	; Si podemos movernos hacia abajo
	(test (<> ?y-rey 1))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> ?x-rey ?x-fic) (<> (- ?y-rey 1) ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia abajo
	(assert (mueve (num ?n-rey) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::rey_atacado_arriba_mueve_derecha
	(declare (salience 79))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está arriba
	(test (and (= ?x-rey ?x-ene) (= ?y-rey (- ?y-ene 1))))
	
	; Si podemos movernos hacia la derecha
	(test (<> ?x-rey 8))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> (+ ?x-rey 1) ?x-fic) (<> ?y-rey ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia la derecha
	(assert (mueve (num ?n-rey) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::rey_atacado_arriba_mueve_izquierda
	(declare (salience 79))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está arriba
	(test (and (= ?x-rey ?x-ene) (= ?y-rey (- ?y-ene 1))))
	
	; Si podemos movernos hacia la izquierda
	(test (<> ?x-rey 1))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> (- ?x-rey 1) ?x-fic) (<> ?y-rey ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia la izquierda
	(assert (mueve (num ?n-rey) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::rey_atacado_abajo_mueve_arriba
	(declare (salience 70))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está abajo
	(test (and (= ?x-rey ?x-ene) (= ?y-rey (+ ?y-ene 1))))
	
	; Si podemos movernos hacia arriba
	(test (<> ?y-rey 8))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> ?x-rey ?x-fic) (<> (+ ?y-rey 1) ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia la arriba
	(assert (mueve (num ?n-rey) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::rey_atacado_abajo_mueve_derecha
	(declare (salience 79))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está abajo
	(test (and (= ?x-rey ?x-ene) (= ?y-rey (+ ?y-ene 1))))
	
	; Si podemos movernos hacia la derecha
	(test (<> ?x-rey 8))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> (+ ?x-rey 1) ?x-fic) (<> ?y-rey ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia la derecha
	(assert (mueve (num ?n-rey) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::rey_atacado_abajo_mueve_izquierda
	(declare (salience 79))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está abajo
	(test (and (= ?x-rey ?x-ene) (= ?y-rey (+ ?y-ene 1))))
	
	; Si podemos movernos hacia la izquierda
	(test (<> ?x-rey 1))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> (- ?x-rey 1) ?x-fic) (<> ?y-rey ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia la izquierda
	(assert (mueve (num ?n-rey) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::rey_atacado_derecha_mueve_izquierda
	(declare (salience 80))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está a la derecha
	(test (and (= (+ ?x-rey 1) ?x-ene) (= ?y-rey ?y-ene)))
	
	; Si podemos movernos hacia la izquierda
	(test (<> ?x-rey 1))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> (- ?x-rey 1) ?x-fic) (<> ?y-rey ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia la izquierda
	(assert (mueve (num ?n-rey) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::rey_atacado_derecha_mueve_abajo
	(declare (salience 80))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está a la derecha
	(test (and (= (+ ?x-rey 1) ?x-ene) (= ?y-rey ?y-ene)))
	
	; Si podemos movernos hacia abajo
	(test (<> ?y-rey 1))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> ?x-rey ?x-fic) (<> (- ?y-rey 1) ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia abajo
	(assert (mueve (num ?n-rey) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::rey_atacado_derecha_mueve_arriba
	(declare (salience 70))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está a la derecha
	(test (and (= (+ ?x-rey 1) ?x-ene) (= ?y-rey ?y-ene)))
	
	; Si podemos movernos hacia arriba
	(test (<> ?y-rey 8))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> ?x-rey ?x-fic) (<> (+ ?y-rey 1) ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia arriba
	(assert (mueve (num ?n-rey) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::rey_atacado_izquierda_mueve_derecha
	(declare (salience 80))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está a la izquierda
	(test (and (= (- ?x-rey 1) ?x-ene) (= ?y-rey ?y-ene)))
	
	; Si podemos movernos hacia la derecha
	(test (<> ?x-rey 8))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> (+ ?x-rey 1) ?x-fic) (<> ?y-rey ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia la derecha
	(assert (mueve (num ?n-rey) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::rey_atacado_izquierda_mueve_abajo
	(declare (salience 79))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está a la izquierda
	(test (and (= (- ?x-rey 1) ?x-ene) (= ?y-rey ?y-ene)))
	
	; Si podemos movernos hacia abajo
	(test (<> ?y-rey 1))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> ?x-rey ?x-fic) (<> (- ?y-rey 1) ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia abajo
	(assert (mueve (num ?n-rey) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::rey_atacado_izquierda_mueve_arriba
	(declare (salience 70))
	
	; Condiciones
	
	; Seleccionamos al rey
	(tiempo ?t) 
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene))
	
	; Si el enemigo está a la izquierda
	(test (and (= (- ?x-rey 1) ?x-ene) (= ?y-rey ?y-ene)))
	
	; Si podemos movernos hacia arriba
	(test (<> ?y-rey 8))
	
	; Si no hay ninguna ficha en en esa posición
	(ficha (pos-x ?x-fic) (pos-y ?y-fic))
	(test (or (<> ?x-rey ?x-fic) (<> (+ ?y-rey 1) ?y-fic)))
	
	=>
	
	; Actuación
	
	; Movemos al rey hacia arriba
	(assert (mueve (num ?n-rey) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							;
;	2 - ATACAMOS A FICHAS CERCANAS AL REY		;
;	Prioridades (70)				;
;							;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::rey_amenazado_banzai_abajo
	(declare (salience 70))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos al rey
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un soldado
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos ?ptos-soldado))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Comprobamos que el enemigo amenza al rey (está a uno o dos movimientos)
	(test (or (or (= ?y-ene (+ ?y-rey 1)) (= ?y-ene (- ?y-rey 1))) (or (= ?y-ene (+ ?y-rey 2)) (= ?y-ene (- ?y-rey 2)))))
	(test (or (or (= ?x-ene (+ ?x-rey 1)) (= ?x-ene (- ?x-rey 1))) (or (= ?x-ene (+ ?x-rey 2)) (= ?x-ene (- ?x-rey 2)))))

	; Si el soldado tiene el enemigo abajo
	(test (and (= ?x-soldado ?x-ene) (= (- ?y-soldado 1) ?y-ene)))
	
	; Si el soldado tiene más puntos que el enemigo o el enemigo no ha sido descubierto
	(test (or (= ?open-ene 0) (and (= ?open-ene 1) (>= ?ptos-soldado ?ptos-ene))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia abajo
	(assert (mueve (num ?n-soldado) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::rey_amenazado_banzai_arriba
	(declare (salience 70))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos al rey
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un soldado
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos ?ptos-soldado))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Comprobamos que el enemigo amenza al rey (está a uno o dos movimientos)
	(test (or (or (= ?y-ene (+ ?y-rey 1)) (= ?y-ene (- ?y-rey 1))) (or (= ?y-ene (+ ?y-rey 2)) (= ?y-ene (- ?y-rey 2)))))
	(test (or (or (= ?x-ene (+ ?x-rey 1)) (= ?x-ene (- ?x-rey 1))) (or (= ?x-ene (+ ?x-rey 2)) (= ?x-ene (- ?x-rey 2)))))

	; Si el soldado tiene el enemigo arriba
	(test (and (= ?x-soldado ?x-ene) (= (+ ?y-soldado 1) ?y-ene)))
	
	; Si el soldado tiene más puntos que el enemigo o el enemigo no ha sido descubierto
	(test (or (= ?open-ene 0) (and (= ?open-ene 1) (>= ?ptos-soldado ?ptos-ene))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia arriba
	(assert (mueve (num ?n-soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::rey_amenazado_banzai_derecha
	(declare (salience 70))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos al rey
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un soldado
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos ?ptos-soldado))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Comprobamos que el enemigo amenza al rey (está a uno o dos movimientos)
	(test (or (or (= ?y-ene (+ ?y-rey 1)) (= ?y-ene (- ?y-rey 1))) (or (= ?y-ene (+ ?y-rey 2)) (= ?y-ene (- ?y-rey 2)))))
	(test (or (or (= ?x-ene (+ ?x-rey 1)) (= ?x-ene (- ?x-rey 1))) (or (= ?x-ene (+ ?x-rey 2)) (= ?x-ene (- ?x-rey 2)))))

	; Si el soldado tiene el enemigo a la derecha
	(test (and (= (+ ?x-soldado 1) ?x-ene) (= ?y-soldado ?y-ene)))
	
	;Si el soldado tiene más puntos que el enemigo o el enemigo no ha sido descubierto
	(test (or (= ?open-ene 0) (and (= ?open-ene 1) (>= ?ptos-soldado ?ptos-ene))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la derecha
	(assert (mueve (num ?n-soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::rey_amenazado_banzai_izquierda
	(declare (salience 70))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos al rey
	(ficha (equipo "A") (num ?n-rey) (pos-x ?x-rey) (pos-y ?y-rey) (puntos 1))
	
	; Seleccionamos un soldado
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos ?ptos-soldado))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Comprobamos que el enemigo amenza al rey (está a uno o dos movimientos)
	(test (or (or (= ?y-ene (+ ?y-rey 1)) (= ?y-ene (- ?y-rey 1))) (or (= ?y-ene (+ ?y-rey 2)) (= ?y-ene (- ?y-rey 2)))))
	(test (or (or (= ?x-ene (+ ?x-rey 1)) (= ?x-ene (- ?x-rey 1))) (or (= ?x-ene (+ ?x-rey 2)) (= ?x-ene (- ?x-rey 2)))))

	; Si el soldado tiene el enemigo a la izquierda
	(test (and (= (- ?x-soldado 1) ?x-ene) (= ?y-soldado ?y-ene)))
	
	; Si el soldado tiene más puntos que el enemigo o el enemigo no ha sido descubierto
	(test (or (= ?open-ene 0) (and (= ?open-ene 1) (>= ?ptos-soldado ?ptos-ene))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la izquierda
	(assert (mueve (num ?n-soldado) (mov 2) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							;
;	3 - ATAQUES DIRECTOS	 (PARA MATAR)		;
;	Prioridades (40-70)				;
;							;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::ficha_6_arriba
	(declare (salience 68))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 6
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 6))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo arriba
	(test (and (= ?x-soldado ?x-ene) (= (+ ?y-soldado 1) ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia arriba
	(printout t "Ficha 6: enemigo a tiro, movemos arriba" crlf)
	(assert (mueve (num ?n-soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ficha_6_derecha
	(declare (salience 65))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 6
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 6))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo a la derecha
	(test (and (= (+ ?x-soldado 1) ?x-ene) (= ?y-soldado ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la derecha
	(printout t "Ficha 6: enemigo a tiro, movemos derecha" crlf)
	(assert (mueve (num ?n-soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ficha_6_izquierda
	(declare (salience 65))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 6
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 6))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo a la izquierda
	(test (and (= (- ?x-soldado 1) ?x-ene) (= ?y-soldado ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la izquierda
	(printout t "Ficha 6: enemigo a tiro, movemos izquierda" crlf)
	(assert (mueve (num ?n-soldado) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ficha_6_abajo
	(declare (salience 55))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 6
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 6))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo abajo
	(test (and (= ?x-soldado ?x-ene) (= (- ?y-soldado 1) ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia abajo
	(printout t "Ficha 6: enemigo a tiro, movemos abajo" crlf)
	(assert (mueve (num ?n-soldado) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::fichas_5_arriba
	(declare (salience 60))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 5
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 5))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo arriba
	(test (and (= ?x-soldado ?x-ene) (= (+ ?y-soldado 1) ?y-ene)))
	
	; Si no vemos la puntuación enemiga o tenemos igual o mayor puntuación
	(test (or (= ?open-ene 0) (and (= ?open-ene 1) (or (= 5 ?ptos-ene) (> 5 ?ptos-ene)))))

	=>
	
	; Actuación
	
	; Movemos el soldado hacia abajo
	(printout t "Ficha 5: enemigo a tiro, movemos arriba" crlf)
	(assert (mueve (num ?n-soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::fichas_5_abajo
	(declare (salience 54))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 5
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 5))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo abajo
	(test (and (= ?x-soldado ?x-ene) (= (- ?y-soldado 1) ?y-ene)))
	
	; Si no vemos la puntuación enemiga o tenemos igual o mayor puntuación
	(test (or (= ?open-ene 0) (and (= ?open-ene 1) (or (= 5 ?ptos-ene) (> 5 ?ptos-ene)))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia abajo
	(printout t "Ficha 5: enemigo a tiro, movemos abajo" crlf)
	(assert (mueve (num ?n-soldado) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::fichas_5_derecha
	(declare (salience 58))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 5
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 5))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo a la derecha
	(test (and (= (+ ?x-soldado 1) ?x-ene) (= ?y-soldado ?y-ene)))
	
	; Si no vemos la puntuación enemiga o tenemos igual o mayor puntuación
	(test (or (= ?open-ene 0) (and (= ?open-ene 1) (or (= 5 ?ptos-ene) (> 5 ?ptos-ene)))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia abajo
	(printout t "Ficha 5: enemigo a tiro, movemos a la derecha" crlf)
	(assert (mueve (num ?n-soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::fichas_5_izquierda
	(declare (salience 50))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 5
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 5))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo a a la izquierda
	(test (and (= (- ?x-soldado 1) ?x-ene) (= ?y-soldado ?y-ene)))
	
	; Si no vemos la puntuación enemiga o tenemos igual o mayor puntuación
	(test (or (= ?open-ene 0) (and (= ?open-ene 1) (or (= 5 ?ptos-ene) (> 5 ?ptos-ene)))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la izquierda
	(printout t "Ficha 5: enemigo a tiro, movemos a la izquierda" crlf)
	(assert (mueve (num ?n-soldado) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_evidente_arriba
	(declare (salience 48))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos un soldado
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos ?ptos-soldado))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo a arriba
	(test (and (= ?x-soldado ?x-ene) (= (+ ?y-soldado 1) ?y-ene)))
	
	; Si tenemos igual o mayor puntuación
	(test (and (= ?open-ene 1) (or (= ?ptos-soldado ?ptos-ene) (> ?ptos-soldado ?ptos-ene))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia arriba
	(printout t "Soldado: enemigo a tiro, movemos arriba" crlf)
	(assert (mueve (num ?n-soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_evidente_abajo
	(declare (salience 45))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos un soldado
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos ?ptos-soldado))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo a abajo
	(test (and (= ?x-soldado ?x-ene) (= (- ?y-soldado 1) ?y-ene)))
	
	; Si tenemos igual o mayor puntuación
	(test (and (= ?open-ene 1) (or (= ?ptos-soldado ?ptos-ene) (> ?ptos-soldado ?ptos-ene))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia abajo
	(printout t "Soldado: enemigo a tiro, movemos abajo" crlf)
	(assert (mueve (num ?n-soldado) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_evidente_derecha
	(declare (salience 46))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos un soldado
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos ?ptos-soldado))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo a la derecha
	(test (and (= (+ ?x-soldado 1) ?x-ene) (= ?y-soldado ?y-ene)))
	
	; Si tenemos igual o mayor puntuación
	(test (and (= ?open-ene 1) (or (= ?ptos-soldado ?ptos-ene) (> ?ptos-soldado ?ptos-ene))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia arriba
	(printout t "Soldado: enemigo a tiro, movemos derecha" crlf)
	(assert (mueve (num ?n-soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_evidente_izquierda
	(declare (salience 46))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos un soldado
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos ?ptos-soldado))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si el soldado tiene el enemigo a la izquierda
	(test (and (= (- ?x-soldado 1) ?x-ene) (= ?y-soldado ?y-ene)))
	
	; Si tenemos igual o mayor puntuación
	(test (and (= ?open-ene 1) (or (= ?ptos-soldado ?ptos-ene) (> ?ptos-soldado ?ptos-ene))))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la izquierda
	(printout t "Soldado: enemigo a tiro, movemos izquierda" crlf)
	(assert (mueve (num ?n-soldado) (mov 2) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;							;
;	4 - MOVIMIENTO DE TROPAS (marchamos a la guerra);
;	Prioridades (20-40)				;
;							;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Al tener menos prioridad éstas reglas sólo se activan cuando no hay
; enemigos a tiro y el rey está fuera de peligro

(defrule EQUIPO-A::mueve_ficha_6_arriba
	(declare (salience 38))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 6
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 6))

	; Seleccionamos a un 5
	(ficha (equipo "A") (num ?n-fic) (pos-x ?x-fic) (pos-y ?y-fic) (puntos 5))
	
	; Si no estamos demasiado adelantados con respecto a los 5
	(test (< (- ?y-soldado ?y-fic) 2))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia arriba
	(printout t "Ficha 6: movemos arriba" crlf)
	(assert (mueve (num ?n-soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_6_persigue_derecha
	(declare (salience 34))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 6
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 6))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si estamos arriba del todo
	(test (= ?y-soldado 8))
	
	; Si hay un enemigo a la derecha
	(test (and (< ?x-soldado ?x-ene) (= ?y-soldado ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la derecha
	(printout t "Ficha 6: perseguimos derecha" crlf)
	(assert (mueve (num ?n-soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_6_persigue_izquierda
	(declare (salience 34))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 6
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 6))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si estamos arriba del todo
	(test (= ?y-soldado 8))
	
	; Si hay un enemigo a la izquierda
	(test (and (> ?x-soldado ?x-ene) (= ?y-soldado ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la izquierda
	(printout t "Ficha 6: perseguimos izquierda" crlf)
	(assert (mueve (num ?n-soldado) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_5_arriba
	(declare (salience 37))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 5
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 5))

	; Seleccionamos al 6
	(ficha (equipo "A") (num ?n-fic) (pos-x ?x-fic) (pos-y ?y-fic) (puntos 6))
	
	; Si no estamos demasiado adelantados con respecto al 6
	(test (< (- ?y-soldado ?y-fic) 2))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia arriba
	(printout t "Ficha 5: movemos arriba" crlf)
	(assert (mueve (num ?n-soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_5_persigue_derecha
	(declare (salience 32))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 5
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 5))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si estamos arriba del todo
	(test (= ?y-soldado 8))
	
	; Si hay un enemigo a la derecha
	(test (and (< ?x-soldado ?x-ene) (= ?y-soldado ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la derecha
	(printout t "Ficha 5: perseguimos derecha" crlf)
	(assert (mueve (num ?n-soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_5_persigue_izquierda
	(declare (salience 32))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 5
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 5))
	
	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))
	
	; Si estamos arriba del todo
	(test (= ?y-soldado 8))
	
	; Si hay un enemigo a la izquierda
	(test (and (> ?x-soldado ?x-ene) (= ?y-soldado ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia la derecha
	(printout t "Ficha 5: perseguimos izquierda" crlf)
	(assert (mueve (num ?n-soldado) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_6_arriba_5_muerta
	(declare (salience 32))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 6
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 6))

	(ficha_5_muerta)
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia arriba
	(printout t "Ficha 6: movemos arriba" crlf)
	(assert (mueve (num ?n-soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_5_arriba_6_muerta
	(declare (salience 32))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 5
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 5))

	(ficha_6_muerta)
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia arriba
	(printout t "Ficha 5: movemos arriba" crlf)
	(assert (mueve (num ?n-soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_3_arriba_muertas
	(declare (salience 30))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 3
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 3))

	(ficha_6_muerta)
	(ficha_5_muerta)
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia arriba
	(printout t "Ficha 3: movemos arriba" crlf)
	(assert (mueve (num ?n-soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_3_persigue_derecha_muertas
	(declare (salience 30))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 3
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 3))

	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))

	(ficha_6_muerta)
	(ficha_5_muerta)
	
	; Si estamos arriba del todo
	(test (= ?y-soldado 8))
	
	; Si hay un enemigo a la derecha
	(test (and (< ?x-soldado ?x-ene) (= ?y-soldado ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia derecha
	(printout t "Ficha 3: movemos derecha" crlf)
	(assert (mueve (num ?n-soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::mueve_ficha_3_persigue_izquierda_muertas
	(declare (salience 30))
	
	; Condiciones
	
	(tiempo ?t) 
	
	; Seleccionamos la ficha 3
	(ficha (equipo "A") (num ?n-soldado) (pos-x ?x-soldado) (pos-y ?y-soldado) (puntos 3))

	; Seleccionamos un enemigo
	(ficha (equipo "B") (num ?n-ene) (pos-x ?x-ene) (pos-y ?y-ene) (descubierta ?open-ene) (puntos ?ptos-ene))

	(ficha_6_muerta)
	(ficha_5_muerta)
	
	; Si estamos arriba del todo
	(test (= ?y-soldado 8))
	
	; Si hay un enemigo a la izquierda
	(test (and (> ?x-soldado ?x-ene) (= ?y-soldado ?y-ene)))
	
	=>
	
	; Actuación
	
	; Movemos el soldado hacia izquierda
	(printout t "Ficha 3: movemos izquierda" crlf)
	(assert (mueve (num ?n-soldado) (mov 2) (tiempo ?t)))
)
