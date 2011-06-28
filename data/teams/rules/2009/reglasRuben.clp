;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  Para el equipo de los Mamotretos!                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Rubén Díaz Sánchez, 209
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;
; Fichero para annadir reglas


; REGLAS INDIVIDUALES PARA LA FICHA 6:
(defrule EQUIPO-A::Inicial6
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (< ?y 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::Barrido6derecha
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (= ?y 7))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Barrido6arriba
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (= ?x 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::Barrido6izquierda
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (= ?y 8))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Barrido6abajo
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (= ?x 1))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))
;fini ficha 6

; REGLAS INDIVIDUALES PARA LA FICHA 5:

(defrule EQUIPO-A::Barrido5derecha
  (declare (salience 46))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (= ?y 7))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Barrido5arriba
  (declare (salience 46))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (= ?x 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::Barrido5izquierda
  (declare (salience 46))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (= ?y 8))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Barrido5abajo
  (declare (salience 46))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (= ?x 1))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))
;fini ficha 5


; REGLAS INDIVIDUALES PARA LA FICHA 4:

(defrule EQUIPO-A::Barrido4derecha
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (test (= ?y 7))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Barrido4arriba
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (test (= ?x 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::Barrido4izquierda
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (test (= ?y 8))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Barrido4abajo
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (test (= ?x 1))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))
;fini ficha 4



(defrule EQUIPO-A::MovimientoT2
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?xa) (pos-y ?ya))
  (test (> ?t 15))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoT2primi
  (declare (salience 41))
  (tiempo ?t)
  (ficha (equipo "A") (num A125) (puntos 2) (pos-x ?xa) (pos-y ?ya))
  (test (> ?t 15))
  =>
  (assert (mueve (num A125) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoT5
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num A115) (puntos 5) (pos-x ?xa) (pos-y ?ya))
  (test (< ?ya 8))
  =>
  (assert (mueve (num A115) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoT5atack
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num A115) (puntos 5) (pos-x ?xa) (pos-y ?ya))
  (test (= ?ya 8))
  =>
  (assert (mueve (num A115) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Barrido3
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?xa) (pos-y ?ya))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::Barrido4
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?xa) (pos-y ?ya))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


;Movimiento defensivo para el 5 y el 1
(defrule EQUIPO-A::MovimientoDef5
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?xa) (pos-y 2))
  (test (> ?t 30))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoDef1
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?xa) (pos-y 1))
  (test (> ?t 30))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoDef1Der
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?xa) (pos-y ?ya))
  (ficha (equipo "B") (num ?nb) (puntos ?pb) (pos-x ?xb) (pos-y ?yb))
  (test (and (= ?ya ?yb) (= ?xb (- ?xa 1))))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoDef1Iz
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?xa) (pos-y ?ya))
  (ficha (equipo "B") (num ?nb) (puntos ?pb) (pos-x ?xb) (pos-y ?yb))
  (test (and (= ?ya ?yb) (= ?xb (+ ?xa 1))))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoDef1ab
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?xa) (pos-y ?ya))
  (ficha (equipo "B") (num ?nb) (puntos ?pb) (pos-x ?xb) (pos-y ?yb))
  (test (or (and (= ?ya ?yb) (= ?xb (- ?xa 1))) ) ((and (= ?ya ?yb) (= ?xb (+ ?xa 1))) ))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoDef1ar
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?xa) (pos-y ?ya))
  (ficha (equipo "B") (pos-x ?xb) (pos-y ?yb))
  (test (or (and (= ?ya ?yb) (= ?xb (- ?xa 1))) ) ( (and (= ?ya ?yb) (= ?xb (+ ?xa 1))) ) )
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


; Fin de la defensa

(defrule EQUIPO-A::MovimientoDefbasicoTodosD
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?nb) (puntos ?pb) (pos-x ?xb) (pos-y ?yb) (descubierta 1))
  (test (and (= ?x ?xb) (= ?yb (+ ?y 1))))
  (test (< ?x 7))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoDefbasicoTodosI
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?nb) (puntos ?pb) (pos-x ?xb) (pos-y ?yb) (descubierta 1))
  (test (and (= ?x ?xb) (= ?yb (+ ?y 1))))
  (test (> ?x 2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::MovimientoDefbasicoTodosAtaque
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?nb) (puntos ?pb) (pos-x ?xb) (pos-y ?yb) (descubierta 1))
  (test (and (= ?x ?xb) (= ?yb (+ ?y 1))))
  (test (< ?pb ?p))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


