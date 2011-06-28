;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Juan Antonio Caballero Hernández
;
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

; Fichero para añadir reglas


(defrule EQUIPO-A::activa_bs 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Comprueba si se ha llegado a la esquina

(declare (salience 80))
	(ficha (equipo "A") (pos-x 8) (pos-y 8) (puntos 6) (num ?n))
	(not(bs))
=>
	(printout t "borde superior activado" crlf)
	(assert (bs))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                    AVANZAR                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance6_1 ;;;;;avance recto del 6
   (declare (salience 78))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::avance6_2 ;;;;;avance del 6 a la derecha
   (declare (salience 77))
   (ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 6))
   (test (= ?y 8))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::avance6_3 ;;;;;nuevo avance del 6 a la izquierda
   (declare (salience 78))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (bs)
   (test (> ?y 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::avance6_4 ;;;;;nuevo avance del 6 a la derecha
   (declare (salience 78))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (bs)
   (test (> ?y 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::avance6_5 ;;;;; retroceso del 6
   (declare (salience 78))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (bs)
   (test (> ?y 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::avance5_1 ;;;;;avance recto del 5
   (declare (salience 75))
   (ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::avance5_2 ;;;;;avance del 5 a la izquierda
   (declare (salience 75))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (test (> ?y 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::avance5_3 ;;;;;avance del 5 a la derecha
   (declare (salience 75))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (test (> ?y 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::avance5_4 ;;;;;retroceso del 5
   (declare (salience 75))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (test (> ?y 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::avance4_1 ;;;;;avance recto del 4
   (declare (salience 70))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::avance4_2 ;;;;;avance del 4 a la izquierda
   (declare (salience 70))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
   (test (> ?y 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::avance4_3 ;;;;;avance del 4 a la derecha
   (declare (salience 70))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
   (test (> ?y 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::avance4_4 ;;;;;retroceso del 4
   (declare (salience 70))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
   (test (> ?y 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t))))4


;(defrule EQUIPO-A::avance3
;   (declare (salience 65))
;   (ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 3))
;   (tiempo ?t)
;   =>
;   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                    ATAQUE SEGURO                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque-seguro-arriba
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque-seguro-abajo
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ataque-seguro-derecha
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ataque-seguro-izquierda
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                   ATAQUE CON EL 6                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque6-derecha
   (declare (salience 78))
   (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ataque6-izquierda
   (declare (salience 79))
   (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataque6-arriba
   (declare (salience 78))
   (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque6-abajo
   (declare (salience 77))
   (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                   ATAQUE CON EL 5                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque5-derecha
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ataque5-izquierda
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataque5-arriba
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque5-abajo
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                   ATAQUE CON EL 4                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque4-derecha
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ataque4-izquierda
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataque4-arriba
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque4-abajo
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                       OTRAS                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::otra_1
  (declare (salience 9))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::otra_2
  (declare (salience 9))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::otra_3
  (declare (salience 9))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::otra_4
  (declare (salience 9))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

