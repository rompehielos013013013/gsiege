;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Jesús Iglesias Jiménez-Mena, 2011
; Basadas en las reglas de Manuel Palomo Duarte, 2009
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El rey huye de quien tenga al lado MÁXIMA PRIORIDAD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::zigzag1
	(declare (salience 1000))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag2
	(declare (salience 1000))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag3
	(declare (salience 1000))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag4
	(declare (salience 1000))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Defensa en medio del tablero
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::muerde1
	(declare (salience 50))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) )
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::muerde2
	(declare (salience 50))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) )
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5 y 6 avanzan sin cuartel con la TERCARA máxima prioridad (6 tiene más prioridad). Primero abajo, si no se puede izq y si no derecha.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::seisabajo
	(declare (salience 99))
	(ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
	(test (< ?y 8))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::seisizq
	(declare (salience 98))
	(ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
	(test (< ?y 8))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::seisdercha
	(declare (salience 98))
	(ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
	(test (< ?y 8))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::cincoabajo
	(declare (salience 99))
	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
	(test (< ?y 8))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::cincoizq
	(declare (salience 97))
	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
	(test (< ?y 8))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::cincodercha
	(declare (salience 97))
	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
	(test (< ?y 8))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Atacar con las fichas 5 y 6 a tope!! SEGUNDA MÁXIMA PRIORIDAD 
;(así damos prioridad a un ataque de una ficha fuerte).
;El ataque hacia abajo no lo tenemos en cuenta porque ya avanzaría de por sí.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::6muerde
	(declare (salience 101))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::6muerde
	(declare (salience 101))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::5muerde
	(declare (salience 100))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::5muerde
	(declare (salience 100))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Si no hay nada mejor que hacer adelante mis valientes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::basica-3
  (declare (salience 22))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::basica-1
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (+ ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::basica-2
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (- ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::basica-3
  (declare (salience 22))
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


