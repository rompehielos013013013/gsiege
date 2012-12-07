;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Ignacio Traverso Ribón, 2011
;
;
; Disponible bajo los términos de la GNU 
; General Public License (GPL) version 3 o superior
;

(defrule EQUIPO-A::Regla1
  (declare (salience 66))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::Regla2
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (+ ?x2 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Regla3
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (- ?x2 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Regla4
  (declare (salience 68))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::Regla5
  (declare (salience 68))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;Ficha 6 en la última linea;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::ReglaLL1
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y 8))
  (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y 8))
  (test (< (- ?x ?x1) 4))
  (test (> (- ?x ?x1) 0))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ReglaLL2
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y 8))
  (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y 8))
  (test (< (- ?x1 ?x) 4))
  (test (> (- ?x1 ?x) 0))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;;;;;;;;,Reglas para fichas 5;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,

(defrule EQUIPO-A::Regla6
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::Regla7
  (declare (salience 65))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (+ ?x2 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Regla8
  (declare (salience 65))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (- ?x2 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Regla9
  (declare (salience 64))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::Regla10
  (declare (salience 64))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;Ficha 5 en la última linea
(defrule EQUIPO-A::ReglaLL3
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y 8))
  (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y 8))
  (test (< (- ?x ?x1) 4))
  (test (> (- ?x ?x1) 0))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;;;;Ficha 5 en la última linea
(defrule EQUIPO-A::ReglaLL4
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y 8))
  (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y 8))
  (test (< (- ?x1 ?x) 4))
  (test (> (- ?x1 ?x) 0))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;;;;;;;;Reglas de ataque del resto

;;;;;;;;;;REgla para 4;;;;;;;;;;
(defrule EQUIPO-A::Regla11
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y) (descubierta 1))
  (test (= ?x (+ ?x2 1)))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Regla12
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y) (descubierta 1))
  (test (= ?x (- ?x2 1)))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Regla13
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x) (pos-y ?y2) (descubierta 1))
  (test (= ?y (+ ?y2 1)))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::Regla14
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x) (pos-y ?y2) (descubierta 1))
  (test (= ?y (- ?y2 1)))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Otras fichas si las otras no estuvieran descubiertas;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Regla11
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (+ ?x2 1)))
  (test (<> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::Regla12
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (- ?x2 1)))
  (test (<> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::Regla13
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (<> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::Regla14
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (<> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;Huida del rey;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Si hay alguien a la izquierda del rey y no hay nadie abajo-izq abajo-derecha abajo-abajo
(defrule EQUIPO-A::Regla15
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
  (test (= ?x (- ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::Regla15
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
  (test (= ?x (- ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Si hay alguien a la derecha del rey y no hay nadie abajo-izq abajo-derecha abajo-abajo
(defrule EQUIPO-A::Regla25
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
  (test (= ?x (+ ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::Regla26
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
  (test (= ?x (+ ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Si hay alguien a la derecha del rey y no hay nadie arriba-izq arriba-derecha arriba-arriba
(defrule EQUIPO-A::Regla20
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y (- ?y1 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;Si hay alguien a la derecha del rey y no hay nadie arriba-izq arriba-derecha arriba-arriba
(defrule EQUIPO-A::Regla21
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y (- ?y1 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Si hay alguien a la derecha del rey y no hay nadie arriba-izq arriba-derecha arriba-arriba
(defrule EQUIPO-A::Regla22
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y (- ?y1 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Si hay alguien a la izquierda del rey y no hay nadie arriba-izq aarriba-derecha arriba-arriba
(defrule EQUIPO-A::Regla23
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
;  (not (ficha (equipo "B") (pos-y ?y2&:(<> ?y2 (+ ?y 1))) (pos-x ?x2&:(<> ?x2 (+ ?x 1))))) ;;Arriba a la derecha
;  (not (ficha (equipo "B") (pos-y ?y3&:(<> ?y3 (+ ?y 1))) (pos-x ?x3&:(<> ?x3 (- ?x 1))))) ;;Arriba a la izquierda
;  (not (ficha (equipo "B") (pos-y ?y4&:(<> ?y4 (+ ?y 1))) (pos-x ?x4&:(<> ?x4 ?x)))) ;;Justo arriba
;  (not (ficha (equipo "B") (pos-y ?y5&:(<> ?y5 (+ ?y 2))) (pos-x ?x5&:(<> ?x5 ?x)))) ;;Dos arriba en la misma x
  (test (= ?x (+ ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Si hay alguien debajo del rey y no hay nadie arriba-izq aarriba-derecha arriba-arriba
(defrule EQUIPO-A::Regla16
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y1 (- ?y 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Si hay alguien debajo del rey y no hay nadie arriba-izq aarriba-derecha arriba-arriba
(defrule EQUIPO-A::Regla17
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y1 (- ?y 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Si hay alguien debajo del rey y no hay nadie arriba-izq aarriba-derecha arriba-arriba
(defrule EQUIPO-A::Regla18
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y1 (- ?y 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))
