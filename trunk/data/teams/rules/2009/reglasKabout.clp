;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Diego Sánchez Díaz 2009
;
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Rey Intocable
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Rey1
(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p) (num ?n2))
	(test (or (= (+ ?y1 1) ?y2) (= (- ?y1 1) ?y2) ))
	=> 
	(printout t "Movimiento Rey1" crlf)
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Rey2
(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p) (num ?n2))
	(test (or (= (+ ?y1 1) ?y2) (= (- ?y1 1) ?y2) ))
	=> 
	(printout t "Movimiento Rey2" crlf)
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Rey3
(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p) (num ?n2))
	(test (or (= (+ ?x1 1) ?x2) (= (- ?x1 1) ?x2) ))
	=> 
	(printout t "Movimiento Rey3" crlf)
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Rey4
(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p) (num ?n2))
	(test (or (= (+ ?x1 1) ?x2) (= (- ?x1 1) ?x2) ))
	=> 
	(printout t "Movimiento Rey4" crlf)
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Priorizamos comer ficha antes que avanzar      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Comer
	(declare (salience 40))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p2) (num ?n2))
	(test (and (> ?p1 1) (= (+ ?x1 1) ?x2) ))
	=> 
	(printout t "Movimiento Comer" crlf)
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Comer1
	(declare (salience 40))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p2) (num ?n2))
	(test (and (> ?p1 1) (= (- ?x1 1) ?x2) ))
	=> 
	(printout t "Movimiento Comer1" crlf)
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Comer2
	(declare (salience 40))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y1) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (> ?p1 1) (= (- ?y1 1) ?y2) ))
	=> 
	(printout t "Movimiento Comer2" crlf)
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::Comer3
	(declare (salience 40))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y1) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (> ?p1 1) (= (+ ?y1 1) ?y2)) )
	=> 
	(printout t "Movimiento Comer3" crlf)
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avanzan los peones primero    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Peon_Adelante
	(declare (salience 23))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 2))
	=> 
	(printout t "Movimiento Peon_Adelante" crlf)
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avanza el heroe si hay        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Heroe_Adelante
	(declare (salience 30))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	=> 
	(printout t "Movimiento Heroe_Adelante" crlf)
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Heroe_Fondo
	(declare (salience 30))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 6))
	=> 
	(printout t "Movimiento Heroe_Fondo" crlf)
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Heroe_Fondo1
	(declare (salience 30))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 6))
	=> 
	(printout t "Movimiento Heroe_Fondo1" crlf)
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Heroe_Fondo2
	(declare (salience 31))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x 8) (pos-y 8) (puntos 6))
	=> 
	(printout t "Movimiento Heroe_Fondo2" crlf)
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)
3
	(declare (salience 31))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x 1) (pos-y 8) (puntos 6))
	=> 
	(printout t "Movimiento Heroe_Fondo3" crlf)
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avanzan los caballeros        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Campeon_Adelante
	(declare (salience 25))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
	=> 
	(printout t "Movimiento Campeon_Adelante" crlf)
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avanzan los 4                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ro_Adelante
	(declare (salience 24))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
	=> 
	(printout t "Movimiento Campeon_Adelante" crlf)
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avanzan los 3       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::to_Adelante
	(declare (salience 24))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
	=> 
	(printout t "Movimiento Campeon_Adelante" crlf)
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Se le da prioridad a avanzar hacia delante ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Avanzar
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(test (and (> ?t 130) (> ?p 1) ))
	=> 
	(printout t "Movimiento Avanzar" crlf)
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Luego tiene la misma prioridad avanzar para cualquier lado  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Izquierda
	(declare (salience 10))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(test (> ?p 1))
	=> 
	(printout t "Movimiento Izquierda" crlf)
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Derecha
	(declare (salience 10))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(test (> ?p 1))
	=> 
	(printout t "Movimiento Derecha" crlf)
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Abajo
	(declare (salience 10))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(test (> ?p 1))
	=> 
	(printout t "Movimiento Abajo" crlf)
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimientos finales del rey               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Final
	(declare (salience 5))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (!= ?p2 1) (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)))
	=> 
	(printout t "Movimiento Final" crlf)
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Final1
	(declare (salience 5))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (!= ?p2 1) (= (- ?y1 1) ?y2) (= (+ ?x1 1) ?x2)))
	=> 
	(printout t "Movimiento Final1" crlf)
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Final2
	(declare (salience 5))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (!= ?p2 1) (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)))
	=> 
	(printout t "Movimiento Final2" crlf)
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::Final3
	(declare (salience 5))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (!= ?p2 1) (= (+ ?y1 1) ?y2) (= (+ ?x1 1) ?x2)))
	=> 
	(printout t "Movimiento Final3" crlf)
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Final4
	(declare (salience 5))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (!= ?p2 1) (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)))
	=> 
	(printout t "Movimiento Final4" crlf)
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::Final5
	(declare (salience 5))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (!= ?p2 1) (= (+ ?y1 1) ?y2) (= (- ?x1 1) ?x2)))
	=> 
	(printout t "Movimiento Final5" crlf)
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Final6
	(declare (salience 5))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (!= ?p2 1) (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)))
	=> 
	(printout t "Movimiento Final6" crlf)
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Final7
	(declare (salience 5))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos 1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2))
	(test (and (!= ?p2 1) (= (- ?y1 1) ?y2) (= (- ?x1 1) ?x2)))
	=> 
	(printout t "Movimiento Final7" crlf)
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Huida de una ficha descubierta  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Huida
(declare (salience 50))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y1) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p2) (num ?n2) (descubierta 1))
	(test (and (< ?p1 ?p2) (or (= (+ ?y1 1) ?y2) (= (- ?y1 1) ?y2) )))
	=> 
	(printout t "Movimiento Huida" crlf)
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Huida2
(declare (salience 50))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y1) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p2) (num ?n2) (descubierta 1))
	(test (and (< ?p1 ?p2) (or (= (+ ?y1 1) ?y2) (= (- ?y1 1) ?y2) )))
	=> 
	(printout t "Movimiento Huida2" crlf)
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Huida3
(declare (salience 50))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p2) (num ?n2) (descubierta 1))
	(test (and (< ?p1 ?p2) (or (= (+ ?x1 1) ?x2) (= (- ?x1 1) ?x2) )))
	=> 
	(printout t "Movimiento Huida3" crlf)
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Huida4
(declare (salience 50))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) (puntos ?p2) (num ?n2) (descubierta 1))
	(test (and (< ?p1 ?p2) (or (= (+ ?x1 1) ?x2) (= (- ?x1 1) ?x2) )))
	=> 
	(printout t "Movimiento Huida4" crlf)
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)

