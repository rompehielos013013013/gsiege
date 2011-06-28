;;; Reglas Daniel Salazar Recio


;;;;;;;;;;;;; REGLAS PARA FICHA 5 (PRIORIDAD MAX. 65) ;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;ficha 5 ataca por banda hasta llegar al fondo
(defrule EQUIPO-A::ataquebanda5
	 (declare (salience 60))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
	 (test (< ?y1 7))
	 (tiempo ?t)
=>
	(printout t "Ataque por banda con ficha de 5 puntos en " ?x1 ?y1 crlf)
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;ficha 5 llega a fila 7, sigue avanzando
(defrule EQUIPO-A::ataquebanda5_2
	 (declare (salience 61))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 7))
	 (not (ficha (equipo "A") (num ?n2) (puntos 5) (pos-x ?x2) (pos-y 8)))
	 (ficha (equipo "B") (num ?n3) (puntos ?p) (pos-x ?x3) (pos-y 8))
	 (tiempo ?t)
=>
	(printout t "Avanzando hacia fila 8" crlf)
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)






;;;;;;;;;;ficha 5 en posición (1,8) comienza su internada hacia la derecha
(defrule EQUIPO-A::internada5derecha
	 (declare (salience 60))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x 1) (pos-y 8))
	 (tiempo ?t)
=>
	(assert (ataqueinternadaderecha))
	(assert (enfila8))
	(printout t "Internada hacia derecha de ficha de 5 puntos en 0,8" crlf)
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

;;;;;;;;;ficha 5 en posición (8,8) comienza su internada hacia la izquierda
(defrule EQUIPO-A::internada5izquierda
	 (declare (salience 60))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x 8) (pos-y 8))
	 (tiempo ?t)
=>
	(assert (ataqueinternadaizquierda))
	(assert (enfila8))
	(printout t "Internada hacia izquierda de ficha de 5 puntos en 8,8" crlf)
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

;;;;;;;;;ficha 5 en posicion (x,8) continua su internada hacia la derecha
(defrule EQUIPO-A::internada5derecha2
       	 (declare (salience 60))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 8))
	 (test (<> ?x1 8))
	 (ataqueinternadaderecha)
	 (tiempo ?t)
=>
	(printout t "Continuacion internada hacia derecha de ficha de 5 puntos en " ?x1 " 8" crlf)
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

;;;;;;;;;ficha 5 en posicion (x,8) continua su internada hacia la izquierda
(defrule EQUIPO-A::internada5izquierda2
       	 (declare (salience 60))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 8))
	 (test (<> ?x1 0))
	 (ataqueinternadaizquierda)
	 (tiempo ?t)
=>
	(printout t "Continuacion internada hacia izquierda de ficha de 5 puntos en " ?x1 " 8" crlf)
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

:::::::::;Ya hay una ficha 5 en la fila 8 y la otra ha llegado a 0,7, arrasar fila 7 con esta ficha (activando)
(defrule EQUIPO-A::activando_bfila7der
	 (declare (salience 65))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 8))
	 (ficha (equipo "A") (num ?n2) (puntos 5) (pos-x 1) (pos-y 7))
=>
	(printout t "Activando bfila7der" crlf)
	(assert (fila7derecha))
)

;;;;;;;;;;Ya hay una ficha 5 en la fila 8 y la otra ha llegado a 8,7, arrasar fila 7 con esta ficha (activando)
(defrule EQUIPO-A::activando_bfila7izq
	 (declare (salience 65))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 8))
	 (ficha (equipo "A") (num ?n2) (puntos 5) (pos-x 8) (pos-y 7))
=>
	(printout t "Activando bfila7izq" crlf)
	(assert (fila7izquierda))
)

;;;;;;;;;;;Arrasar fila 7 hacia la derecha
(defrule EQUIPO-A::arrasarfila7der
	 (declare (salience 60))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 7))
	 (fila7derecha)
	 (tiempo ?t)
=>
	(printout t "Arrasando fila 7 con ficha de 5 hacia derecha" crlf)
	(assert ( mueve (num ?n1) (mov 1) (tiempo ?t)))
)

;;;;;;;;;;Arrasar fila 7 hacia la izquierda
(defrule EQUIPO-A::arrasarfila7izq
	 (declare (salience 60))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 7))
	 (fila7izquierda)
	 (tiempo ?t)
=>
	(printout t "Arrasando fila 7 con ficha de 5 hacia izquierda" crlf)
	(assert ( mueve (num ?n1) (mov 2) (tiempo ?t)))
)

;;;;;;;;;Detección de muerte
(defrule EQUIPO-A::muertefichas5
	 (declare (salience 80))
	 (not (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1)))
=>
	(assert (muertefichas5))
)

;Regla inútil (creo)
(defrule EQUIPO-A::muerteficha5_2
	 (declare (salience 80))
	 (not (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 8)))
	 ?bandera<- (enfila8)
=>
	(retract ?bandera)
)

;Cuando llega a la esquina, da la vuelta, sería interesante comprobar si hay fichas en esa fila, y sino moverse a otra
(defrule EQUIPO-A::darlavuelta1
	 (declare (salience 65))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x 8) (pos-y 8))
	 ?bandera<- (ataqueinternadaderecha)
=>
	(retract ?bandera)
	(assert (ataqueinternadaizquierda))
)

;Lo mismo para la otra esquina
(defrule EQUIPO-A::darlavuelta2
	 (declare (salience 65))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x 1) (pos-y 1))
	 ?bandera<- (ataqueinternadaizquierda)
=>
	(retract ?bandera)
	(assert (ataqueinternadaderecha))
)

(defrule EQUIPO-A::paso_atras
	 (declare (salience 66))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 8))
	 (not (ficha (equipo "B") (num ?n2) (puntos ?p) (pos-x ?x2) (pos-y 8)))
	 ?bandera<- (ataqueinternadaizquierda)
=>
	(retract ?bandera)
	(assert (pasoatras))
)

(defrule EQUIPO-A::paso_atras_2
	 (declare (salience 66))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 8))
	 (not (ficha (equipo "B") (num ?n2) (puntos ?p) (pos-x ?x2) (pos-y 8)))
	 ?bandera<- (ataqueinternadaderecha)
	 
=>
	(retract ?bandera)
	(assert (pasoatras))
)

(defrule EQUIPO-A::detect_pasoatras1
	 (declare (salience 85))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 8))
	 (ficha (equipo "B") (num ?n2) (puntos ?p) (pos-x ?x2) (pos-y 7))
	 (test (< ?x2 ?x1))
	 ?bandera<- (pasoatras)
	 (tiempo ?t)
=>
	(retract ?bandera)
	(assert (fila7izquierda))
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::detect_pasoatras2
	 (declare (salience 85))
	 (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y 8))
	 (ficha (equipo "B") (num ?n2) (puntos ?p) (pos-x ?x2) (pos-y 7))
	 (test (> ?x2 ?x1))
	 ?bandera<- (pasoatras)
	 (tiempo ?t)
=>
	(retract ?bandera)
	(assert (fila7derecha))
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)




;;; Queda dar la vuelta y atacar hacia donde haya fichas en eje X
;;;;;;;;;;;;;;;; REGLAS FICHA 6 (PRIORIDAD MAX. 70);;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;   reglas defensivas    ;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::defensa_ficha6_der
	 (declare (salience 100))
	 (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	 (ficha (equipo "B") (num ?n2) (puntos ?p) (pos-x ?x2) (pos-y ?y2))
	 (test (and (= ?x1 (+ ?x2 1)) (= ?y1 ?y2)))
	 (tiempo ?t)
=>
	(printout t "Defendiendo con 6 hacia la derecha" crlf)
	(assert ( mueve (num ?n1) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::defensa_ficha6_izq
	 (declare (salience 100))
	 (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	 (ficha (equipo "B") (num ?n2) (puntos ?p) (pos-x ?x2) (pos-y ?y2))
	 (test (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)))
	 (tiempo ?t)
=>
	(printout t "Defendiendo con 6 hacia la izquierda" crlf)
	(assert ( mueve (num ?n1) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::defensa_ficha6_up
	 (declare (salience 100))
	 (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	 (ficha (equipo "B") (num ?n2) (puntos ?p) (pos-x ?x2) (pos-y ?y2))
	 (test (and (= ?x1 ?x2) (= ?y1 (+ ?y2 1))))
	 (tiempo ?t)
=>
	(printout t "Defendiendo con 6 hacia arriba" crlf)
	(assert ( mueve (num ?n1) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::defensa_ficha6_down
	 (declare (salience 100))
	 (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	 (ficha (equipo "B") (num ?n2) (puntos ?p) (pos-x ?x2) (pos-y ?y2))
	 (test (and (= ?x1 ?x2) (= ?y1 (- ?y2 1))))
	 (tiempo ?t)
=>
	(printout t "Defendiendo con 6 hacia abajo" crlf)
	(assert ( mueve (num ?n1) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;; REGLAS SUICIDA ;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque_sucida6_1
	 (declare (salience 60))
	 (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	 (muertefichas5)
	 (test (< ?y1 7))
	 (tiempo ?t)
=>
	(printout t "Avanzando 6" crlf)
	(assert ( mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_suicida6_2
	 (declare (salience 65))
	 (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	 (not (ficha (equipo "B") (num ?n2) (puntos ?p) (pos-x ?x2) (pos-y ?y2&:(> ?y2 ?y1))))
	 (ficha (equipo "B") (num ?n3) (puntos ?p2) (pos-x ?x3&:(< ?x3 ?x1)) (pos-y ?y1))
	 (muertefichas5)
	 (tiempo ?t)
=>
	(printout t "Avanzando 6" crlf)
	(assert ( mueve (num ?n1) (mov 2) (tiempo ?t)))
)


;Queda por hacer:
;ficha 5 en internada hacia la derecha llega a 8,8  ----------> hacer retract de la bandera y retrasar posicion
;ficha 5 en internada hacia la izquierda llega a 1,8 --------> hacer retract de la bandera y retrasar posicion
;Si la ficha 5 de la fila 7 llega a 1,7 o 8,7 --------> retract bandera y a hacer otra cosa
;Alguna regla para 6 y para 4 y ataque suicida de 3 y peones!!!



(defrule EQUIPO-A::ataquebanda4
	 (declare (salience 50))
	 (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
	 (test (< ?y1 7))
	 (tiempo ?t)
=>
	(printout t "ataquebanda2 con ficha de 4 en " ?x1 ?y1 crlf)
	(assert ( mueve (num ?n1) (mov 3) (tiempo ?t)))
)
