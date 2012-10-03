;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Javier Villegas Gomez; 2012
;
;
; Disponible bajo los términos de la GNU 
; General Public License (GPL) version 3 o superior
;


; Enemigo a la izquierda del 1 huye a la derecha

(defrule EQUIPO-A::Huye1
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x1) (pos-y ?y))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
	(test (= ?x2 (- ?x1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

; Enemigo a la izquierda del 1 huye abajo

(defrule EQUIPO-A::Huye2
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x1) (pos-y ?y))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
	(test (= ?x2 (- ?x1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

; Enemigo a la izquierda del 1 huye arriba

(defrule EQUIPO-A::Huye3
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x1) (pos-y ?y))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
	(test (= ?x2 (- ?x1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

; Enemigo a la derecha del 1 huye a la izquierda

(defrule EQUIPO-A::Huye4
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x1) (pos-y ?y))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
	(test (= ?x2 (+ ?x1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

; Enemigo a la derecha del 1 huye arriba

(defrule EQUIPO-A::Huye5
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x1) (pos-y ?y))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
	(test (= ?x2 (+ ?x1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

; Enemigo a la derecha del 1 huye abajo

(defrule EQUIPO-A::Huye6
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x1) (pos-y ?y))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
	(test (= ?x2 (+ ?x1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

; Enemigo abajo del 1 huye arriba

(defrule EQUIPO-A::Huye7
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y1))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
	(test (= ?y2 (- ?y1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

; Enemigo abajo del 1 huye a la izquierda

(defrule EQUIPO-A::Huye8
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y1))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
	(test (= ?y2 (- ?y1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

; Enemigo abajo del 1 huye a la derecha

(defrule EQUIPO-A::Huye9
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y1))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
	(test (= ?y2 (- ?y1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

; Enemigo arriba del 1 huye abajo

(defrule EQUIPO-A::Huye10
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y1))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
	(test (= ?y2 (+ ?y1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

; Enemigo arriba del 1 huye a la derecha

(defrule EQUIPO-A::Huye11
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y1))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
	(test (= ?y2 (+ ?y1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

; Enemigo arriba del 1 huye a la izquierda

(defrule EQUIPO-A::Huye12
 	 (declare (salience 50))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y1))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
	(test (= ?y2 (+ ?y1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)






;Mata derecha

(defrule EQUIPO-A::Mata1
 	 (declare (salience 42))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos ?p1) (pos-x ?x1) (pos-y ?y))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
	(test (> ?p1 1))
	(test (>= ?p1 ?p2))
	(test (= ?x2 (+ ?x1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

;Mata izquierda

(defrule EQUIPO-A::Mata2
 	 (declare (salience 42))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos ?p1) (pos-x ?x1) (pos-y ?y))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y))
	(test (> ?p1 1))
	(test (>= ?p1 ?p2))
	(test (= ?x2 (- ?x1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

;Mata arriba

(defrule EQUIPO-A::Mata3
 	 (declare (salience 42))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos ?p1) (pos-x ?x) (pos-y ?y1))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
	(test (> ?p1 1))
	(test (>= ?p1 ?p2))
	(test (= ?y2 (+ ?y1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;Mata abajo

(defrule EQUIPO-A::Mata4
 	 (declare (salience 42))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos ?p1) (pos-x ?x) (pos-y ?y1))
	(ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x) (pos-y ?y2))
	(test (> ?p1 1) )
	(test (>= ?p1 ?p2))
	(test (= ?y2 (- ?y1 1)))
  	=>
 	 (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)










; Si no hay nada que hacer avanzo con el 6

(defrule EQUIPO-A::Avanzar6
 	 (declare (salience 41))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  	=>
 	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

; Si no hay nada que hacer avanzo con los 5

(defrule EQUIPO-A::Avanzar5
 	 (declare (salience 40))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  	=>
 	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

; Si no hay nada que hacer avanzo con los 4

(defrule EQUIPO-A::Avanzar4
 	 (declare (salience 39))
  	(tiempo ?t)
  	(ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  	=>
 	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)






; Y si tampoco hay nada que hacer, me acerco para atacar con el que pueda

(defrule EQUIPO-A::Buscarizquierda
   (declare (salience 20))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y1))
   (test (> ?p1 1)) 
   (test (< ?x2 ?x1))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))   
) 

(defrule EQUIPO-A::Buscarderecha
   (declare (salience 20))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x2) (pos-y ?y1))
   (test (> ?p1 1)) 
   (test (> ?x2 ?x1))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))   
) 

(defrule EQUIPO-A::Buscararriba
   (declare (salience 20))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x1) (pos-y ?y2))
   (test (> ?p1 1)) 
   (test (> ?y2 ?y1))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))   
) 

(defrule EQUIPO-A::Buscarabajo
   (declare (salience 20))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (ficha (equipo "B") (num ?m) (puntos ?p2) (pos-x ?x1) (pos-y ?y2))
   (test (> ?p1 1)) 
   (test (> ?y2 ?y1))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))   
) 


