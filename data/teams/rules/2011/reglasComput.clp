;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Francisco Jose Reyes Sanchez, 2011
;
; Disponible bajo los términos de la GNU 
; General Public License (GPL) version 3 o superior
;
;


;Huida Rey

(defrule EQUIPO-A::huidarey12
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::huidarey13
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::huidarey14
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::huidarey21
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 1))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::huidarey23
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 1))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::huidarey24
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 1))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::huidarey34
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (= (- ?y2 ?y1) 1))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::huidarey31
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (= (- ?y2 ?y1) 1))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::huidarey32
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (= (- ?y2 ?y1) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))




(defrule EQUIPO-A::huidarey43
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (= (- ?y1 ?y2) 1))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::huidarey41
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (= (- ?y1 ?y2) 1))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::huidarey42
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (= (- ?y1 ?y2) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))




; ATACAR DESCUBIERTA

(defrule EQUIPO-A::matar1
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (puntos ?p2)(pos-x ?x2) (pos-y ?y2)(descubierta 1))
  (test (< ?p2 ?p1))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::matar2
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (puntos ?p2)(pos-x ?x2) (pos-y ?y2)(descubierta 1))
  (test (< ?p2 ?p1))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::matar3
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2)(descubierta 1))
  (test (< ?p2 ?p1))
  (test (= (- ?y2 ?y1) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::matar4
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2)(puntos ?p2) (pos-x ?x2) (pos-y ?y2)(descubierta 1))
  (test (< ?p2 ?p1))
  (test (= (- ?y1 ?y2) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))



; Ficha 6

(defrule EQUIPO-A::ataque61
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque62
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataque63
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque64
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::perseguir61
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::perseguir62
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::perseguir63
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::perseguir64
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::mover61
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (< ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::mover62
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (> ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::mover63
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (< ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mover64
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (> ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


; Ficha 5

(defrule EQUIPO-A::ataque51
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque52
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataque53
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque54
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::perseguir51
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::perseguir52
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::perseguir53
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::perseguir54
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::mover51
  (declare (salience 49))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (< ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::mover52
  (declare (salience 49))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (> ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::mover53
  (declare (salience 49))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (< ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mover54
  (declare (salience 49))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (> ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


;Ficha 4

(defrule EQUIPO-A::ataque41
  (declare (salience 58))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque42
  (declare (salience 58))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataque43
  (declare (salience 58))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque44
  (declare (salience 58))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::perseguir41
  (declare (salience 52))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::perseguir42
  (declare (salience 52))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::perseguir43
  (declare (salience 52))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::perseguir44
  (declare (salience 52))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::mover41
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (< ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::mover42
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (> ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::mover43
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (< ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mover44
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (> ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))



;Ficha 3

(defrule EQUIPO-A::ataque31
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque32
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataque33
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque34
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::perseguir31
  (declare (salience 44))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::perseguir32
  (declare (salience 44))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::perseguir33
  (declare (salience 44))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::perseguir34
  (declare (salience 44))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 2))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::mover31
  (declare (salience 38))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (< ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::mover32
  (declare (salience 38))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (> ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::mover33
  (declare (salience 38))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (< ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mover34
  (declare (salience 38))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 3) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (> ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))



;FICHA 2

(defrule EQUIPO-A::ataque21
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 2) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque22
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 2) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x1 ?x2) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::ataque23
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 2) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::ataque24
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 2) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::mover21
  (declare (salience 25))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 2) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (< ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::mover22
  (declare (salience 25))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 2) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (> ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::mover23
  (declare (salience 25))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 2) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (< ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mover24
  (declare (salience 25))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 2) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x1 ?x2))
  (test (> ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))




