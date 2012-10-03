;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Reglas de Inteligencia Artificial                   ;
;  reglas de Manuel Jesús Pérez Zurera                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::embestida6izq
   (declare (salience 60))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y) (pos-x ?x1) (puntos ?p1)) 
   (ficha (equipo "B") (pos-y ?y) (pos-x ?x2))
   (test (= ?p1 6)) 
   (test (< ?x2 ?x1))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))   
) ;esta si

(defrule EQUIPO-A::embestida6der
   (declare (salience 60))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y) (pos-x ?x1) (puntos ?p1)) 
   (ficha (equipo "B") (pos-y ?y) (pos-x ?x2))
   (test (= ?p1 6)) 
   (test (> ?x2 ?x1))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))   
) ;esta si

(defrule EQUIPO-A::embestida6abajo
   (declare (salience 60))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x) (puntos ?p1)) 
   (ficha (equipo "B") (pos-y ?y2) (pos-x ?x))
   (test (= ?p1 6)) 
   (test (< ?y2 ?y1))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))   
) ;esta si

(defrule EQUIPO-A::embestida6arriba
   (declare (salience 60))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x) (puntos ?p1)) 
   (ficha (equipo "B") (pos-y ?y2) (pos-x ?x))
   (test (= ?p1 6)) 
   (test (> ?y2 ?y1))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))   
) ;esta si


(defrule EQUIPO-A::embestidaabajo
   (declare (salience 40))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x) (puntos ?p1)) 
   (ficha (equipo "B") (pos-y ?y2) (pos-x ?x) (puntos ?p2))
   (test (>= ?p1 4)) 
   (test (<= ?p2 ?p1))
   (test (< ?y2 ?y1))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))   
) ;esta si

(defrule EQUIPO-A::embestidaarriba
   (declare (salience 40))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x) (puntos ?p1)) 
   (ficha (equipo "B") (pos-y ?y2) (pos-x ?x) (puntos ?p2))
   (test (>= ?p1 4)) 
   (test (<= ?p2 ?p1))
   (test (> ?y2 ?y1))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))   
) ;esta si

(defrule EQUIPO-A::embestidader
   (declare (salience 40))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y) (pos-x ?x1) (puntos ?p1)) 
   (ficha (equipo "B") (pos-y ?y) (pos-x ?x2) (puntos ?p2))
   (test (>= ?p1 4)) 
   (test (<= ?p2 ?p1))
   (test (> ?x2 ?x1))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))   
) ;esta si

(defrule EQUIPO-A::embestidader
   (declare (salience 40))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y) (pos-x ?x1) (puntos ?p1)) 
   (ficha (equipo "B") (pos-y ?y) (pos-x ?x2) (puntos ?p2))
   (test (>= ?p1 4)) 
   (test (<= ?p2 ?p1))
   (test (< ?x2 ?x1))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))   
) ;esta si

;Si hay alguien a la derecha del rey y las casillas de abajo están libres
(defrule EQUIPO-A::Huidareyabajo
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (pos-x ?x1) (pos-y ?y))
  (test (= ?x (+ ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;Si hay alguien a la derecha del rey y arriba está libre
(defrule EQUIPO-A::Huidareyabajo
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (pos-x ?x) (pos-y ?y1))
  (test (= ?y (- ?y1 1)))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;Si hay alguien a la izquierda del rey y arriba está libre
(defrule EQUIPO-A::huidareyarriba3
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (pos-x ?x1) (pos-y ?y))
  (test (= ?x (+ ?x1 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Si hay alguien debajo del rey y arriba está libre
(defrule EQUIPO-A::huidareyarriba2
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (pos-x ?x) (pos-y ?y1))
  (test (= ?y1 (- ?y 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Si hay alguien debajo del rey y a la izquierda está libre
(defrule EQUIPO-A::huidarreyizq
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (pos-x ?x) (pos-y ?y1))
  (test (= ?y1 (- ?y 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;Si hay alguien a la derecha del rey y a la derecha está libre
(defrule EQUIPO-A::huidareyderecha2
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (pos-x ?x) (pos-y ?y1))
  (test (= ?y (- ?y1 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))
