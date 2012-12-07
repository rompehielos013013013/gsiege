;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
; Juan de Dios Alvarez Rodriguez, 2011
; Basadas en las reglas de Manuel Palomo Duarte, 2009
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;
; MOVS : 1 => avanza X
;        2 => retrocede X
;        3 => avanza Y
;        4 => retrocede Y
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El rey huye de quien tenga al lado                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::zigzag1
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag2
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag3
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::zigzag4
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Atacar con el 6 si hay algo cerca                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataca61
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?y) (puntos 6))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?y))
  (test (< ?xa ?xb))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataca62
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?y) (puntos 6))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?y))
  (test (> ?xa ?xb))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataca63
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?x) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?nb) (pos-x ?x) (pos-y ?yb))
  (test (< ?ya ?yb))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ataca64
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?x) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?nb) (pos-x ?x) (pos-y ?yb))
  (test (> ?ya ?yb))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Manda el 6 a matar                                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::mandar6
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
  (test (<> ?y 7))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Atacar con el 5 si hay algo cerca                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataca51
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?y))
  (test (< ?xa ?xb))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataca52
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?y))
  (test (> ?xa ?xb))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataca53
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?x) (pos-y ?ya) (puntos 5))
  (ficha (equipo "B") (num ?nb) (pos-x ?x) (pos-y ?yb))
  (test (< ?ya ?yb))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ataca54
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?x) (pos-y ?ya) (puntos 5))
  (ficha (equipo "B") (num ?nb) (pos-x ?x) (pos-y ?yb))
  (test (> ?ya ?yb))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Manda los 5 a matar                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::mandar5
  (declare (salience 35))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (test (<> ?y 7))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Atacar con lo que queda, si hay algo cerca y es una ;
; buena idea                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataca41
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?y) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?y) (puntos ?pb) (descubierta 1))
  (test (and (> ?pa ?pb) (< ?xa ?xb)))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataca42
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?y) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?y) (puntos ?pb) (descubierta 1))
  (test (and (> ?pa ?pb) (> ?xa ?xb)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataca43
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?x) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?x) (pos-y ?yb) (puntos ?pb) (descubierta 1))
  (test (and (> ?pa ?pb) (< ?ya ?yb)))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ataca44
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?x) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?x) (pos-y ?yb) (puntos ?pb) (descubierta 1))
  (test (and (> ?pa ?pb) (> ?ya ?yb)))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Si no, usa las reglas básicas (todo para el centro) ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
