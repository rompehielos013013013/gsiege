;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Álvaro León Rodríguez, 2009
;
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

; Fichero para annadir reglas



(defrule EQUIPO-A::ATAQUE_EXITOSO_ARRIBA
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ATAQUE_EXITOSO_ABAJO
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ATAQUE_EXITOSO_DER
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ATAQUE_EXITOSO_IZ
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::AVANZAR_6
  (declare (salience 72))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (<> ?y ?dim))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::IZQUIERDA_6
  (declare (salience 71))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::DERECHA_6
  (declare (salience 71))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::RETROCEDER_6
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test (and (= ?y ?dim) (= ?x 8)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ATACAR_6_IZQ
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_6_DER
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_6_ABAJO
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_6_ARRIBA
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::AVANZAR_5
  (declare (salience 62))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (<> ?y ?dim))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::IZQUIERDA_5
  (declare (salience 61))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::DERECHA_5
  (declare (salience 61))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::RETROCEDER_5
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test (and (= ?y ?dim) (= ?x 8)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_5_IZQ
  (declare (salience 65))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_5_DER
  (declare (salience 65))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_5_ABAJO
  (declare (salience 66))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_5_ARRIBA
  (declare (salience 65))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::AVANZAR_4
  (declare (salience 52))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (test (<> ?y ?dim))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::IZQUIERDA_4
  (declare (salience 51))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::DERECHA_4
  (declare (salience 51))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::RETROCEDER_4
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test (and (= ?y ?dim) (= ?x 8)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_4_IZQ
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_4_DER
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_4_ABAJO
  (declare (salience 56))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_4_ARRIBA
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::AVANZAR_3
  (declare (salience 42))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (test (<> ?y ?dim))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::IZQUIERDA_3
  (declare (salience 41))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::DERECHA_3
  (declare (salience 41))
  (tiempo ?t)
  (dimension ?dim)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::RETROCEDER_3
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (dimension ?dim)
  (test (and (= ?y ?dim) (= ?x 8)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_3_IZQ
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_3_DER
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_3_ABAJO
  (declare (salience 46))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ATACAR_3_ARRIBA
  (declare (salience 44))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))





