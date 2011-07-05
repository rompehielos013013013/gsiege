
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;	Rabbit - Módulo de IA para el equipo Rabbit                       ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;	Autor: Ezequiel Vázquez De la Calle


;;; Activar caza aleatoria para los 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Cuando acaba el barrido en la última fila ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::caza5
(declare (salience 80))
	(not (caza5))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y 8) (puntos 5))
	(test (or(= ?x1 5) (= ?x1 4)))
	(tiempo ?t)
=>
	(printout t "Activada caza5" crlf)
	(assert (caza5))
)

;;; Activar avance para los cuatros ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Si han caido los dos cincos, activamos los cuatros ;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::caza4
(declare (salience 80))
	(not (ficha (equipo "A") (num R51) ))
	(not (ficha (equipo "A") (num R52) ))
	(tiempo ?t)
=>
	(assert (caza4))
)


;;; Activar avance para el seis ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Si han caido los dos cincos y los dos cuatros, activamos el seis ;;;;;;;;;;

(defrule EQUIPO-A::HailAndKill
(declare (salience 80))
	(not (ficha (equipo "A") (num R51) ))
	(not (ficha (equipo "A") (num R52) ))
	(not (ficha (equipo "A") (num R41) ))
	(not (ficha (equipo "A") (num R42) ))
	(tiempo ?t)
=>
	(assert (HailAndKill))
)


;;; Movimiento de ataque básico: Por los flancos ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Mueve verticalmente a cualquiera de los dos 5 que están en los flancos ;;;;

(defrule EQUIPO-A::flancos
(declare (salience 60))
	(not (caza5))
	(ficha (equipo "A") (num ?n1) (puntos 5) (pos-y ?y1))
	(tiempo ?t)
	(test (not (= ?y1 8)))
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)


;;; Movimiento de ataque básico, segunda parte ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Cuando los 5 llegan a y = 8, empiezan un barrido hacia el centro ;;;;;;;;;;

(defrule EQUIPO-A::barridoDer
(declare (salience 60))
	(not (caza5))
	(ficha (equipo "A") (num R52) (pos-x ?x) (pos-y 8))
	(tiempo ?t)
=>
	(assert (mueve (num R52) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::barridoIzq
(declare (salience 60))
	(not (caza5))
	(ficha (equipo "A") (num R51) (pos-x ?x) (pos-y 8))
	(tiempo ?t)
=>
	(assert (mueve (num R51) (mov 1) (tiempo ?t)))
)

;;; Caza aleatoria para los cincos ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Una vez que se han hecho los barridos, se activa la caza aleatoria ;;;;;;;;

(defrule EQUIPO-A::Caza5-FichaPegada1
(declare (salience 65))
	(caza5)
	(ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Caza5-FichaPegada2
(declare (salience 65))
	(caza5)
	(ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Caza5-FichaPegada3
(declare (salience 65))
	(caza5)
	(ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?x1 ?x2) (= ?y1 (- ?y2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Caza5-FichaPegada4
(declare (salience 65))
	(caza5)
	(ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?x1 ?x2) (= ?y1 (+ ?y2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)	


;;; Mariscal alerta ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; El 6 sólo se mueve si tiene una ficha enemiga al lado ;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::PosicionSeis
(declare (salience 75))
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x 4) (pos-y 2))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Alerta6-1
(declare (salience 71))
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Alerta6-2
(declare (salience 71))
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Alerta6-3
(declare (salience 71))
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?x1 ?x2) (= ?y1 (- ?y2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Alerta6-4
(declare (salience 71))
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?x1 ?x2) (= ?y1 (+ ?y2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)	


;;; HailAndKill ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Cza aleatoria para el seis, en caso de que caigan los cuatros y los cincos;

(defrule EQUIPO-A::HailAndKill-FichaPegada1
(declare (salience 75))
	(HailAndKill)
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::HailAndKill-FichaPegada2
(declare (salience 75))
	(HailAndKill)
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::HailAndKill-FichaPegada3
(declare (salience 75))
	(HailAndKill)
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?x1 ?x2) (= ?y1 (- ?y2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::HailAndKill-FichaPegada4
(declare (salience 75))
	(HailAndKill)
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?x1 ?x2) (= ?y1 (+ ?y2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)	



;;; Avance para los cuatros ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::AvanzarCuatros
(declare (salience 55))
	(caza4)
	(ficha (equipo "A") (num ?n1) (puntos 4) (pos-y ?y1))
	(tiempo ?t)
	(test (not (= ?y1 8)))
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

;;; Ataque de los cuatros ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Ataque-Cuatros1
(declare (salience 70))
	(ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Ataque-Cuatros2
(declare (salience 70))
	(ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Ataque-Cuatros3
(declare (salience 70))
	(ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?x1 ?x2) (= ?y1 (- ?y2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Ataque-Cuatros4
(declare (salience 70))
	(ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and(= ?x1 ?x2) (= ?y1 (+ ?y2 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)


;;; Banzai ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Si no quedan ni cincos, ni cuatros, ni el seis, kamikazes todos ;;;;;;;;;;;

(defrule EQUIPO-A::Banzai
(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (puntos ?p1) (pos-y ?y1))
	(test (not (= ?y1 8)))
	(test (not (= ?p1 1)))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Banzai2
(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (puntos ?p1) (pos-y ?y1))
	(test (= ?y1 8))
	(test (not (= ?p1 1)))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Banzai2
(declare (salience 35))
	(ficha (equipo "A") (num ?n1) (puntos ?p1) (pos-y ?y1))
	(test (= ?y1 8))
	(test (not (= ?p1 1)))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)


;;; Rey Defensa ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Movimientos de huida del Rey ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Si el enemigo está a la izquierda o la derecha, huyo arriba

(defrule EQUIPO-A::ReyHuida1
(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?y1 ?y2) (or (= ?x1 (- ?x2 1)) (= ?x1 (+ ?x2 1)) )))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

;;; Si el enemigo está a la izquierda o la derecha, y hay una ficha arriba, huyo abajo

(defrule EQUIPO-A::ReyHuida1-AmigoArriba
(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
	(ficha (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?y1 ?y2) (or (= ?x1 (- ?x2 1)) (= ?x1 (+ ?x2 1)) )))
	(test (and (= ?x1 ?x3) (= ?y1 (- ?y3 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)

;;; Si el enemigo está arriba o abajo, huyo a la izquierda

(defrule EQUIPO-A::ReyHuida2
(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x1 ?x2) (or (= ?y1 (- ?y2 1)) (= ?y1 (+ ?y2 1)) )))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

;;; Si el enemigo está arriba o abajo, y hay una ficha a la izquierda, huyo a la derecha

(defrule EQUIPO-A::ReyHuida2-AmigoIzquierda
(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
	(ficha (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x1 ?x2) (or (= ?y1 (- ?y2 1)) (= ?y1 (+ ?y2 1)) )))
	(test (and(= ?y1 ?y3) (= ?x1 (- ?x3 1))))
	(tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

