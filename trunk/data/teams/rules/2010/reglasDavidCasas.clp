;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;   	David Casas v1.0 - Módulo de IA para el equipo DavidCasas             ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;	Autor: David Casas Molina.


;;;;;;;;;;;;;;;;;;
;; [[ Reglas ]] ;;
;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::FlagA6Muerta
    (declare (salience 79))
    (not (ficha (equipo "A") (puntos 6)))
    =>
    (assert (FlagA6Muerta))
)

(defrule EQUIPO-A::FlagA5Muerta
    (declare (salience 79))
    (not (ficha (equipo "A") (puntos 5)))
    =>
    (assert (FlagA5Muerta))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::A1HuidaArriba
    (declare (salience 77))
    (tiempo ?t)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (pos-x ?xA) (pos-y ?yA) (puntos 1))
    (test (or (or (and (= ?xA ?xB) (= (+ ?yA 1) ?yB)) (and (= ?xA ?xB) (= ?yA (+ ?yB 1)))) (or (and (= (+ ?xA 1) ?xB) (= ?yA ?yB)) (and (= ?xA (+ ?xB 1)) (= ?yA ?yB)))))
    (test (not (and (= ?xA ?xB) (= (+ ?yA 1) ?yB))))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A1HuidaAbajo
    (declare (salience 77))
    (tiempo ?t)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (pos-x ?xA) (pos-y ?yA) (puntos 1))
    (test (or (or (and (= ?xA ?xB) (= (+ ?yA 1) ?yB)) (and (= ?xA ?xB) (= ?yA (+ ?yB 1)))) (or (and (= (+ ?xA 1) ?xB) (= ?yA ?yB)) (and (= ?xA (+ ?xB 1)) (= ?yA ?yB)))))
    (test (not (and (= ?xA ?xB) (= ?yA (+ ?yB 1)))))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A1HuidaDerecha
    (declare (salience 77))
    (tiempo ?t)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (pos-x ?xA) (pos-y ?yA) (puntos 1))
    (test (or (or (and (= ?xA ?xB) (= (+ ?yA 1) ?yB)) (and (= ?xA ?xB) (= ?yA (+ ?yB 1)))) (or (and (= (+ ?xA 1) ?xB) (= ?yA ?yB)) (and (= ?xA (+ ?xB 1)) (= ?yA ?yB)))))
    (test (not (and (= ?xA (+ ?xB 1)) (= ?yA ?yB))))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A1HuidaIzquierda
    (declare (salience 77))
    (tiempo ?t)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (pos-x ?xA) (pos-y ?yA) (puntos 1))
    (test (or (or (and (= ?xA ?xB) (= (+ ?yA 1) ?yB)) (and (= ?xA ?xB) (= ?yA (+ ?yB 1)))) (or (and (= (+ ?xA 1) ?xB)(= ?yA ?yB)) (and (= ?xA (+ ?xB 1)) (= ?yA ?yB)))))
    (test (not (and (= (+ ?xA 1) ?xB) (= ?yA ?yB))))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::A6InmolacionDerecha
    (declare (salience 75))
    (tiempo ?t)
    (ficha (equipo "B") (puntos 6) (pos-x ?xB) (descubierta 1))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-x ?xA))
    (test (< ?xA ?xB))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A6InmolacionIzquierda
    (declare (salience 75))
    (tiempo ?t)
    (ficha (equipo "B") (puntos 6) (pos-x ?xB) (descubierta 1))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-x ?xA))
    (test (> ?xA ?xB))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::A6InmolacionArriba
    (declare (salience 74))
    (tiempo ?t)
    (ficha (equipo "B") (puntos 6) (pos-y ?yB) (descubierta 1))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-y ?yA))
    (test (< ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A6InmolacionAbajo
    (declare (salience 74))
    (tiempo ?t)
    (ficha (equipo "B") (puntos 6) (pos-y ?yB) (descubierta 1))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-y ?yA))
    (test (> ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A6BusquedaDerecha
    (declare (salience 73))
    (tiempo ?t)
    (ficha (equipo "B") (puntos 5) (pos-x ?xB) (descubierta 1))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-x ?xA))
    (test (< ?xA ?xB))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A6BusquedaIzquierda
    (declare (salience 73))
    (tiempo ?t)
    (ficha (equipo "B") (puntos 5) (pos-x ?xB) (descubierta 1))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-x ?xA))
    (test (> ?xA ?xB))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::A6BusquedaArriba
    (declare (salience 72))
    (tiempo ?t)
    (ficha (equipo "B") (puntos 5) (pos-y ?yB) (descubierta 1))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-y ?yA))
    (test (< ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A6BusquedaAbajo
    (declare (salience 72))
    (tiempo ?t)
    (ficha (equipo "B") (puntos 5) (pos-y ?yB) (descubierta 1))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-y ?yA))
    (test (> ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A6AtaqueArriba
    (declare (salience 71))
    (tiempo ?t)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= (+ ?yA 1) ?yB))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A6AtaqueAbajo
    (declare (salience 71))
    (tiempo ?t)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= ?yA (+ ?yB 1)))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A6AtaqueDerecha
    (declare (salience 70))
    (tiempo ?t)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-x ?xA) (pos-y ?yA))
    (test (= (+ ?xA 1) ?xB))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A6AtaqueIzquierda
    (declare (salience 70))
    (tiempo ?t)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 6) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA (+ ?xB 1)))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::A22Adelantar1de2
    (declare (salience 68))
    (tiempo ?t)
    (ficha (equipo "A") (num 22) (pos-y 2))
    =>
    (assert (mueve (num 22) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::A24Adelantar1de2
    (declare (salience 68))
    (tiempo ?t)
    (ficha (equipo "A") (num 24) (pos-y 2))
    =>
    (assert (mueve (num 24) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::A27Adelantar1de2
    (declare (salience 68))
    (tiempo ?t)
    (ficha (equipo "A") (num 27) (pos-y 2))
    =>
    (assert (mueve (num 27) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::A22Adelantar2de2
    (declare (salience 67))
    (tiempo ?t)
    (ficha (equipo "A") (num 22) (pos-y 3))
    =>
    (assert (mueve (num 22) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::A24Adelantar2de2
    (declare (salience 67))
    (tiempo ?t)
    (ficha (equipo "A") (num 24) (pos-y 3))
    =>
    (assert (mueve (num 24) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::A27Adelantar2de2
    (declare (salience 67))
    (tiempo ?t)
    (ficha (equipo "A") (num 27) (pos-y 3))
    =>
    (assert (mueve (num 27) (mov 3) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::A5AtaqueArriba
    (declare (salience 56))
    (tiempo ?t)
;    (FlagA6Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 5) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= (+ ?yA 1) ?yB))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A5AtaqueAbajo
    (declare (salience 56))
    (tiempo ?t)
;    (FlagA6Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 5) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= ?yA (+ ?yB 1)))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A5AtaqueDerecha
    (declare (salience 55))
    (tiempo ?t)
;    (FlagA6Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 5) (pos-x ?xA) (pos-y ?yA))
    (test (= (+ ?xA 1) ?xB))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A5AtaqueIzquierda
    (declare (salience 55))
    (tiempo ?t)
;    (FlagA6Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 5) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA (+ ?xB 1)))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::A5AtaqueArribaLejano
    (declare (salience 54))
    (tiempo ?t)
;    (FlagA6Muerta)
    (ficha (equipo "B") (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 5) (pos-y ?yA))
    (test (< ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A5AtaqueAbajoLejano
    (declare (salience 54))
    (tiempo ?t)
;    (FlagA6Muerta)
    (ficha (equipo "B") (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 5) (pos-y ?yA))
    (test (> ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A5AtaqueDerechaLejano
    (declare (salience 53))
    (tiempo ?t)
;    (FlagA6Muerta)
    (ficha (equipo "B") (pos-x ?xB))
    (ficha (equipo "A") (num ?a) (puntos 5) (pos-x ?xA))
    (test (< ?xA ?xB))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A5AtaqueIzquierdaLejano
    (declare (salience 53))
    (tiempo ?t)
;    (FlagA6Muerta)
    (ficha (equipo "B") (pos-x ?xB))
    (ficha (equipo "A") (num ?a) (puntos 5) (pos-x ?xA))
    (test (> ?xA ?xB))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::A4AtaqueArriba
    (declare (salience 56))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 4) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= (+ ?yA 1) ?yB))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A4AtaqueAbajo
    (declare (salience 56))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 4) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= ?yA (+ ?yB 1)))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A4AtaqueDerecha
    (declare (salience 55))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 4) (pos-x ?xA) (pos-y ?yA))
    (test (= (+ ?xA 1) ?xB))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A4AtaqueIzquierda
    (declare (salience 55))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 4) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA (+ ?xB 1)))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::A4AtaqueArribaLejano
    (declare (salience 54))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 4) (pos-y ?yA))
    (test (< ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A4AtaqueAbajoLejano
    (declare (salience 54))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 4) (pos-y ?yA))
    (test (> ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A4AtaqueDerechaLejano
    (declare (salience 53))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB))
    (ficha (equipo "A") (num ?a) (puntos 4) (pos-x ?xA))
    (test (< ?xA ?xB))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A4AtaqueIzquierdaLejano
    (declare (salience 53))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB))
    (ficha (equipo "A") (num ?a) (puntos 4) (pos-x ?xA))
    (test (> ?xA ?xB))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::A3AtaqueArriba
    (declare (salience 45))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 3) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= (+ ?yA 1) ?yB))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A3AtaqueAbajo
    (declare (salience 45))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 3) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= ?yA (+ ?yB 1)))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A3AtaqueDerecha
    (declare (salience 44))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 3) (pos-x ?xA) (pos-y ?yA))
    (test (= (+ ?xA 1) ?xB))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A3AtaqueIzquierda
    (declare (salience 44))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 3) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA (+ ?xB 1)))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::A2AtaqueArriba
    (declare (salience 35))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 2) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= (+ ?yA 1) ?yB))
    =>
    (assert (mueve(num ?a) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::A2AtaqueAbajo
    (declare (salience 35))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 2) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA ?xB))
    (test (= ?yA (+ ?yB 1)))
    =>
    (assert (mueve(num ?a) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::A2AtaqueDerecha
    (declare (salience 34))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 2) (pos-x ?xA) (pos-y ?yA))
    (test (= (+ ?xA 1) ?xB))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 1) (tiempo ?t)))
)


(defrule EQUIPO-A::A2AtaqueIzquierda
    (declare (salience 34))
    (tiempo ?t)
    (FlagA6Muerta)
    (FlagA5Muerta)
    (ficha (equipo "B") (pos-x ?xB) (pos-y ?yB))
    (ficha (equipo "A") (num ?a) (puntos 2) (pos-x ?xA) (pos-y ?yA))
    (test (= ?xA (+ ?xB 1)))
    (test (= ?yA ?yB))
    =>
    (assert (mueve(num ?a) (mov 2) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
