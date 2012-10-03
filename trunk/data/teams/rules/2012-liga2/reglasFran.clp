(defrule EQUIPO-A::numero_uno
  (declare (salience 16))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Ataque izquierda
(defrule EQUIPO-A::numero_dos
  (declare (salience 17))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (+ ?x2 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Ataque derecha
(defrule EQUIPO-A::numero_tres
  (declare (salience 17))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (- ?x2 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Ataque abajo
(defrule EQUIPO-A::numero_cuatro
  (declare (salience 18))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;Ataque arriba
(defrule EQUIPO-A::numero_cinco
  (declare (salience 18))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Ficha 6 última fila;;

(defrule EQUIPO-A::numero_seis
  (declare (salience 17))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y 8))
  (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y 8))
  (test (< (- ?x ?x1) 4))
  (test (> (- ?x ?x1) 0))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::numero_siete
  (declare (salience 17))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y 8))
  (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y 8))
  (test (< (- ?x1 ?x) 4))
  (test (> (- ?x1 ?x) 0))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Reglas para ficha 5;;

;; Mover hacia arriba
(defrule EQUIPO-A::numero_ocho
  (declare (salience 13))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Atacar izquierda
(defrule EQUIPO-A::numero_nueve
  (declare (salience 15))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (+ ?x2 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;; Atacar derecha
(defrule EQUIPO-A::numero_diez
  (declare (salience 15))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (- ?x2 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Atacar abajo
(defrule EQUIPO-A::numero_once
  (declare (salience 14))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;; Atacar arriba
(defrule EQUIPO-A::numero_doce
  (declare (salience 14))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Ficha 5 en la última linea;;
(defrule EQUIPO-A::numero_trece
  (declare (salience 13))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y 8))
  (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y 8))
  (test (< (- ?x ?x1) 4))
  (test (> (- ?x ?x1) 0))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::numero_catorce
  (declare (salience 13))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y 8))
  (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y 8))
  (test (< (- ?x1 ?x) 4))
  (test (> (- ?x1 ?x) 0))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))





;;Si p2<p atacar izquierda
(defrule EQUIPO-A::numero_quince
  (declare (salience 12))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y) (descubierta 1))
  (test (= ?x (+ ?x2 1)))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Si p2<p atacar derecha

(defrule EQUIPO-A::numero_dieciseis
  (declare (salience 12))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y) (descubierta 1))
  (test (= ?x (- ?x2 1)))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Si p2<p atacar abajo

(defrule EQUIPO-A::numero_diecisiete
  (declare (salience 13))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x) (pos-y ?y2) (descubierta 1))
  (test (= ?y (+ ?y2 1)))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;Si p2<p atacar arriba

(defrule EQUIPO-A::numero_dieciocho
  (declare (salience 13))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x) (pos-y ?y2) (descubierta 1))
  (test (= ?y (- ?y2 1)))
  (test (< ?p2 ?p))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Otras fichas si las demás están ocultas;;

;; Atacar izquierda

(defrule EQUIPO-A::numero_diecinueve
  (declare (salience 11))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (+ ?x2 1)))
  (test (<> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;; Atacar derecha

(defrule EQUIPO-A::numero_veinte
  (declare (salience 11))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
  (test (= ?x (- ?x2 1)))
  (test (<> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;; Atacar abajo

(defrule EQUIPO-A::numero_veintiuno
  (declare (salience 11))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (<> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;; Atacar arriba

(defrule EQUIPO-A::numero_veintidos
  (declare (salience 11))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (<> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;A correr!!!;;

;;Si hay alguien a la izquierda del rey y no hay nadie abajo-izq abajo-derecha abajo-abajo
(defrule EQUIPO-A::numero_veintitre
  (declare (salience 25))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
  (test (= ?x (- ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::numero_veinticuatro
  (declare (salience 24))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
  (test (= ?x (- ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Si hay alguien a la derecha del rey y no hay nadie abajo-izq abajo-derecha abajo-abajo
(defrule EQUIPO-A::numero_veinticinco
  (declare (salience 25))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
  (test (= ?x (+ ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::numero_veintiseis
  (declare (salience 24))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
  (test (= ?x (+ ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Si hay alguien a la derecha del rey y no hay nadie arriba-izq arriba-derecha arriba-arriba
(defrule EQUIPO-A::numero_veintisiete
  (declare (salience 24))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y (- ?y1 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;Si hay alguien a la derecha del rey y no hay nadie arriba-izq arriba-derecha arriba-arriba
(defrule EQUIPO-A::numero_veintiocho
  (declare (salience 24))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y (- ?y1 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Si hay alguien a la derecha del rey y no hay nadie arriba-izq arriba-derecha arriba-arriba
(defrule EQUIPO-A::numero_veintinueve
  (declare (salience 24))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y (- ?y1 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Si hay alguien a la izquierda del rey y no hay nadie arriba-izq aarriba-derecha arriba-arriba
(defrule EQUIPO-A::numero_treinta
  (declare (salience 24))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x1) (pos-y ?y))
;  (not (ficha (equipo "B") (pos-y ?y2&:(<> ?y2 (+ ?y 1))) (pos-x ?x2&:(<> ?x2 (+ ?x 1)))))
;; Arriba-derecha
;  (not (ficha (equipo "B") (pos-y ?y3&:(<> ?y3 (+ ?y 1))) (pos-x ?x3&:(<> ?x3 (- ?x 1))))) 
;;Arriba-izquierda
;  (not (ficha (equipo "B") (pos-y ?y4&:(<> ?y4 (+ ?y 1))) (pos-x ?x4&:(<> ?x4 ?x)))) 
;; Arriba
;  (not (ficha (equipo "B") (pos-y ?y5&:(<> ?y5 (+ ?y 2))) (pos-x ?x5&:(<> ?x5 ?x)))) 
;;Dos arriba 
  (test (= ?x (+ ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Si hay alguien debajo del rey y no hay nadie arriba-izq aarriba-derecha arriba-arriba
(defrule EQUIPO-A::numero_treintayuno
  (declare (salience 25))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y1 (- ?y 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Si hay alguien debajo del rey y no hay nadie arriba-izq aarriba-derecha arriba-arriba
(defrule EQUIPO-A::numero_treintaydos
  (declare (salience 25))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y1 (- ?y 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Si hay alguien debajo del rey y no hay nadie arriba-izq aarriba-derecha arriba-arriba
(defrule EQUIPO-A::numero_treintaytres
  (declare (salience 25))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p) (pos-x ?x) (pos-y ?y1))
  (test (= ?y1 (- ?y 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A:numero_treintaycuatro
  (declare (salience 10))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (obstaculo (pos-x ?xo) (pos-y ?yo)) 
(test (or(<> ?xo ?x) (= ?xo ?x)))
(test (<> ?yo (+ ?y 1)))
(test (> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A:numero_treintaycinco
  (declare (salience 10))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (obstaculo (pos-x ?xo) (pos-y ?yo)) 
(test (<> ?xo (- ?x 1)))
(test (or(<> ?yo ?y) (= ?yo ?y)))
(test (> ?p 1))
  =>
 (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A:numero_treintayseis
  (declare (salience 10))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (obstaculo (pos-x ?xo) (pos-y ?yo)) 
(test (<> ?xo (+ ?x 1)))
(test (or(<> ?yo ?y) (= ?yo ?y)))
(test (> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A:numero_treintaysiete
  (declare (salience 10))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))
  (obstaculo (pos-x ?xo) (pos-y ?yo)) 
(test (or(<> ?xo ?x) (= ?xo ?x)))
(test (<> ?yo (- ?y 1)))
(test (> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))




