;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Reglas de Inteligencia Artificial                   ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fco. Javier Bohórquez Ogalla                         ;
;                                                      ;
; Disponible bajo los términos de la GNU General Public; 
; License (GPL) version 3 o superior                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
; REGLAS GENERALES
; Estas reglas se aplican a todas las fichas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Huir si una ficha enemiga descubierta con mayor número
; amenaza 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::huir_00
  (declare (salience 61))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p2 ?p1) (and (= ?y1 ?y2) (= (- ?x2 ?x1) 1))))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir_01
  (declare (salience 61))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p2 ?p1) (and (= ?y1 ?y2) (= (- ?x1 ?x2) 1))))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir_02
  (declare (salience 61))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p2 ?p1) (and (= ?x1 ?x2) (= (- ?y2 ?y1) 1))))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir_04
  (declare (salience 61))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p2 ?p1) (and (= ?y1 ?y2) (= (- ?x2 ?x1) 1))))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir_05
  (declare (salience 61))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p2 ?p1) (and (= ?y1 ?y2) (= (- ?x1 ?x2) 1))))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir_06
  (declare (salience 61))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p2 ?p1) (and (= ?x1 ?x2) (= (- ?y2 ?y1) 1))))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Atacar si se da situación de amenaza a una ficha enemiga
; descubierta con menor rango.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::atacar_00
  (declare (salience 59))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p1 ?p2) (and (= ?y1 ?y2) (= (- ?x2 ?x1) 1))))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::atacar_01
  (declare (salience 59))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p1 ?p2) (and (= ?y1 ?y2) (= (- ?x1 ?x2) 1))))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::atacar_02
  (declare (salience 59))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p1 ?p2) (and (= ?x1 ?x2) (= (- ?y2 ?y1) 1))))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::atacar_03
  (declare (salience 59))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (and (> ?p1 ?p2) (and (= ?x1 ?x2) (= (- ?y1 ?y2) 1))))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
; FICHA 01
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Huir si una ficha enemiga (descubierta o no) amenazado
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::huir01_00
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= (- ?x2 ?x1) 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir01_01
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= (- ?x1 ?x2) 1)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir01_02
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= (- ?y2 ?y1) 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir01_04
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= (- ?x2 ?x1) 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir01_05
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= (- ?x1 ?x2) 1)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::huir01_06
  (declare (salience 70))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= (- ?y2 ?y1) 1)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FICHA 2 :
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avance.
; Si alguna ficha, no descubierta, esta en alguna horizontal de
; la ficha 2, esta avanza.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::espia00
  (declare (salience 40))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (descubierta 0))
  (test (and (= ?x1 ?x2) (< ?y1 ?y2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::espia01
  (declare (salience 40))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (descubierta 0))
  (test (and (= ?y1 ?y2) (< ?x1 ?x2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::espia02
  (declare (salience 40))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (descubierta 0))
  (test (and (= ?y1 ?y2) (< ?x2 ?x1)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ---- FICHA 5.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avanzar  
; Avanza en "y" para el ataque hasta alcanzar el máximo, siempre que
; existan fichas enemigas en la posición máxima "y". Si "y" es máximo 
; avanza en "x". Si no existen fichas enemigas en la posición 
; "y" máxima persige a cualquier enemigo no descubierto.  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza05_03
  (declare (salience 59))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (tiempo ?t)
  =>
  <
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza05_04
  (declare (salience 59))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (< ?x1 ?x2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza05_05
  (declare (salience 59))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (> ?x1 ?x2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza05_04_2
  (declare (salience 59))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (< ?x1 ?x2) (< ?x1 4)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza05_05_2
  (declare (salience 59))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (> ?x1 ?x2) (> ?x1 4)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::avanza05_05_3
  (declare (salience 58))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2)(descubierta 0))
  (test (< ?y2 ?y1))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
(defrule EQUIPO-A::avanza05_05_4
  (declare (salience 58))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (descubierta 0))
  (test (< ?y1 ?y2))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::avanza05_05_4
  (declare (salience 58))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2)(descubierta 0))
  (test (< ?x2 ?x1))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::avanza05_05_5
  (declare (salience 58))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (descubierta 0))
  (test (< ?x1 ?x2))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
; FICHA 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
; Proteger
; Intenta mantenerse en la diagonal del uno, una unidad 
; más en "x" e "y".
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::protege06_00
  (declare (salience 60))
  (ficha (equipo "A") (puntos 5))
  (ficha (equipo "A") (num ?n6) (pos-x ?x6) (pos-y ?y6) (puntos 6))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (test (< ?x6 (+ ?x1 1)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n6) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::protege06_01
  (declare (salience 60))
  (ficha (equipo "A") (puntos 5))
  (ficha (equipo "A") (num ?n6) (pos-x ?x6) (pos-y ?y6) (puntos 6))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (test (> ?x6 (+ ?x1 1)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n6) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::protege06_02
  (declare (salience 60))
  (ficha (equipo "A") (puntos 5))
  (ficha (equipo "A") (num ?n6) (pos-x ?x6) (pos-y ?y6) (puntos 6))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (test (< ?y6 (+ ?y1 1)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n6) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::protege06_03
  (declare (salience 60))
  (ficha (equipo "A") (puntos 5))
  (ficha (equipo "A") (num ?n6) (pos-x ?x6) (pos-y ?y6) (puntos 6))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
  (test (> ?y6 (+ ?y1 1)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n6) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  

  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FICHA 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Avanzar  
; Avanza en "y" para el ataque hasta alcanzar el máximo, siempre que
; existan fichas enemigas en la posición máxima "y". Si "y" es máximo 
; avanza en "x". Si no existen fichas enemigas en la posición 
; "y" máxima persige a cualquier enemigo no descubierto. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
(defrule EQUIPO-A::avanza04_03
  (declare (salience 49))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza04_04
  (declare (salience 49))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (< ?x1 ?x2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza04_05
  (declare (salience 49))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (> ?x1 ?x2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza04_04_2
  (declare (salience 49))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (< ?x1 ?x2) (< ?x1 4)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::avanza04_04_2
  (declare (salience 48))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (< ?x1 ?x2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza04_05_2
  (declare (salience 49))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (> ?x1 ?x2) (>= ?x1 4)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
(defrule EQUIPO-A::avanza04_05_2
  (declare (salience 48))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (> ?x1 ?x2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::avanza04_05_3
  (declare (salience 47))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2)(descubierta 0))
  (test (< ?y2 ?y1))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
(defrule EQUIPO-A::avanza04_05_4
  (declare (salience 47))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (descubierta 0))
  (test (< ?y1 ?y2))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::avanza05_05_4
  (declare (salience 47))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2)(descubierta 0))
  (test (< ?x2 ?x1))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::avanza05_05_5
  (declare (salience 47))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (descubierta 0))
  (test (< ?x1 ?x2))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FICHA 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Atacar  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza03_03
  (declare (salience 42))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza03_04
  (declare (salience 42))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (< ?x1 ?x2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza03_05
  (declare (salience 42))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (> ?x1 ?x2)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza03_04_2
  (declare (salience 42))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (< ?x1 ?x2) (< ?x1 4)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
(defrule EQUIPO-A::avanza03_05_2
  (declare (salience 42))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y 8))
  (test (and (= ?y1 8) (> ?x1 ?x2) (> ?x1 4)))
  (tiempo ?t)
  =>
  
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
