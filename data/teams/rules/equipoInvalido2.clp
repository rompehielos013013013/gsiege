;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Mario Márquez Luciano

; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Reglas de observación
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::ObservarCon21
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 2))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))   
)

(defrule EQUIPO-A::ObservarCon22
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 2))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ObservarCon23
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 2))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ObservarCon24
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (pos-x ?x1) (puntos 2))
   (test (= ?y1 8))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)
 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Reglas de ataque
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::AR
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (- ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::AA
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 (+ ?y2 1)) (= ?x1 ?x2)))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::AI
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (- ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::AD
   (declare (salience 80))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
   (test (> ?p1 ?p2))
   (test (and(= ?y1 ?y2) (= ?x1 (+ ?x2 1))))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

