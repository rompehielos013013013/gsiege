;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  para el equipo DavidRomero                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; David Romero Santos, 2011
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El rey huye de quien tenga al lado
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::rey_huye_der
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::rey_huye_izq
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::rey_huye_arr
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::rey_huye_abj
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimiento inicial del rey
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::1adelante
	(declare (salience 79))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 1))
	(tiempo ?t)
	(test (= ?x 5))
        (test (= ?y 2))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimiento de los 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::5adelante
	(declare (salience 76))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 5))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::5izquierda
	(declare (salience 73))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 5))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::5derecha
	(declare (salience 74))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(not(= ?x (- ?x2 1))))
	(test(not(= ?x (- ?x2 2))))
	(test(not(= ?x (- ?x2 3))))
	(test(not(= ?x (- ?x2 4))))
	(test(not(= ?x (- ?x2 5))))
	(test(not(= ?x (- ?x2 6))))
	(test(not(= ?x (- ?x2 7))))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque de los 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::5ataca_abajo
	(declare (salience 77))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::5ataca_arriba
	(declare (salience 76))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::5ataca_derecha
	(declare (salience 77))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::5ataca_izquierda
	(declare (salience 77))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::5ataca_abajo2
	(declare (salience 77))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
	(test(> 5 ?p2))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::5ataca_arriba2
	(declare (salience 76))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
	(test(> 5 ?p2))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::5ataca_derecha2
	(declare (salience 77))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
	(test(> 5 ?p2))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::5ataca_izquierda2
	(declare (salience 77))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
	(test(> 5 ?p2))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimiento de los 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::4adelante
	(declare (salience 71))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 4))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::4izquierda
	(declare (salience 69))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 4))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::4derecha
	(declare (salience 70))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 4))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(not(= ?x (- ?x2 1))))
	(test(not(= ?x (- ?x2 2))))
	(test(not(= ?x (- ?x2 3))))
	(test(not(= ?x (- ?x2 4))))
	(test(not(= ?x (- ?x2 5))))
	(test(not(= ?x (- ?x2 6))))
	(test(not(= ?x (- ?x2 7))))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque de los 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::4ataca_abajo
	(declare (salience 73))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 4))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::4ataca_arriba
	(declare (salience 73))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 4))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::4ataca_derecha
	(declare (salience 73))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 4))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::4ataca_izquierda
	(declare (salience 73))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 4))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::4ataca_abajo2
	(declare (salience 73))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
	(test(> 4 ?p2))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::4ataca_arriba2
	(declare (salience 73))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
	(test(> 4 ?p2))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::4ataca_derecha2
	(declare (salience 73))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
	(test(> 4 ?p2))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::4ataca_izquierda2
	(declare (salience 73))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
	(test(> 4 ?p2))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimiento de los 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::3adelante
	(declare (salience 67))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 3))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::3izquierda
	(declare (salience 65))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 3))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::3derecha
	(declare (salience 66))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 3))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(not(= ?x (- ?x2 1))))
	(test(not(= ?x (- ?x2 2))))
	(test(not(= ?x (- ?x2 3))))
	(test(not(= ?x (- ?x2 4))))
	(test(not(= ?x (- ?x2 5))))
	(test(not(= ?x (- ?x2 6))))
	(test(not(= ?x (- ?x2 7))))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque de los 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::3ataca_abajo
	(declare (salience 69))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 3))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::3ataca_arriba
	(declare (salience 69))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 3))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::3ataca_derecha
	(declare (salience 69))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 3))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::3ataca_izquierda
	(declare (salience 69))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 3))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::3ataca_abajo2
	(declare (salience 69))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
	(test(> 3 ?p2))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::3ataca_arriba2
	(declare (salience 69))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
	(test(> 3 ?p2))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::3ataca_derecha2
	(declare (salience 69))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
	(test(> 3 ?p2))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::3ataca_izquierda2
	(declare (salience 69))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
	(test(> 3 ?p2))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimiento de los 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::2adelante
	(declare (salience 63))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 2))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::2izquierda
	(declare (salience 61))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 2))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::2derecha
	(declare (salience 62))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 2))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(not(= ?x (- ?x2 1))))
	(test(not(= ?x (- ?x2 2))))
	(test(not(= ?x (- ?x2 3))))
	(test(not(= ?x (- ?x2 4))))
	(test(not(= ?x (- ?x2 5))))
	(test(not(= ?x (- ?x2 6))))
	(test(not(= ?x (- ?x2 7))))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque de los 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::2ataca_abajo
	(declare (salience 65))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 2))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::2ataca_arriba
	(declare (salience 65))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 2))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::2ataca_derecha
	(declare (salience 65))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 2))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::2ataca_izquierda
	(declare (salience 65))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 2))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::2ataca_abajo2
	(declare (salience 65))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 2))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
	(test(> 2 ?p2))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::2ataca_arriba2
	(declare (salience 65))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 2))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
	(test(> 2 ?p2))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::2ataca_derecha2
	(declare (salience 65))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 2))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
	(test(> 2 ?p2))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::2ataca_izquierda2
	(declare (salience 65))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 2))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
	(test(> 2 ?p2))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimiento del 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::6adelante
	(declare (salience 59))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 6))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::6izquierda
	(declare (salience 57))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 6))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::6derecha
	(declare (salience 58))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(not(= ?x (- ?x2 1))))
	(test(not(= ?x (- ?x2 2))))
	(test(not(= ?x (- ?x2 3))))
	(test(not(= ?x (- ?x2 4))))
	(test(not(= ?x (- ?x2 5))))
	(test(not(= ?x (- ?x2 6))))
	(test(not(= ?x (- ?x2 7))))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque del 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::6ataca_abajo
	(declare (salience 61))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::6ataca_arriba
	(declare (salience 61))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::6ataca_derecha
	(declare (salience 61))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::6ataca_izquierda
	(declare (salience 61))
	(ficha (equipo "A")(num ?n)(pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2) (descubierta 0))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::6ataca_abajo2
	(declare (salience 61))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (+ ?y2 1)))
	(test(> 6 ?p2))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::6ataca_arriba2
	(declare (salience 61))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?x ?x2))
	(test(= ?y (- ?y2 1)))
	(test(> 6 ?p2))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::6ataca_derecha2
	(declare (salience 61))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (- ?x2 1)))
	(test(> 6 ?p2))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::6ataca_izquierda2
	(declare (salience 61))
	(ficha (equipo "A")(num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(ficha (equipo "B")  (pos-x ?x2) (puntos ?p2) (pos-y ?y2) (descubierta 1))
	(tiempo ?t)
	(test(= ?y ?y2))
	(test(= ?x (+ ?x2 1)))
	(test(> 6 ?p2))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))
