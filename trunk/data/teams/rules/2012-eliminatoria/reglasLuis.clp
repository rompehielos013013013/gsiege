;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;          Reglas de Inteligencia Artificial           ;
;               para el equipo A                       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;						       ;
;						       ;
;             Luis Martínez Zarza, 2012.	       ;
;						       ;
;						       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Evitamos que el rey sea atacado                      ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Lo primordial de nuestra estrategia es que nuestro Rey no corra peligro. Con las siguientes reglas cortesía de M.Palomo, hacemos que nuestro rey le haga la
;pirula a todo aquel que se lo quiera comer.

(defrule EQUIPO-A::1_huye_der
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::1_huye_izq
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::1_huye_arr
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::1_huye_abj
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimientos del 6, primordial vamos a matar          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;La estrategia a seguir es barrer cualquier cosa que se nos ponga por delante con el 6. Una buena defensa siempre es un buen ataque.


;Si no tenemos enemigos a nuestro alrededor avanzamos

(defrule EQUIPO-A::6adelante
	(declare (salience 60))
	(ficha (equipo "A")(num ?n1)(pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B")(num ?n2)(pos-x ?x2) (pos-y ?y2) (puntos ?p))	
	(tiempo ?t)
	(test (or (= ?y2 (+ ?y1 1))
		(= ?y2 (+ ?y1 2)) 
		(= ?y2 (+ ?y1 3)) 
		(= ?y2 (+ ?y1 4)) 
		(= ?y2 (+ ?y1 5)) 
		(= ?y2 (+ ?y1 6)) 
		(= ?y2 (+ ?y1 7))))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::6atras
	(declare (salience 59))
	(ficha (equipo "A")(num ?n1)(pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B")(num ?n2)(pos-x ?x2) (pos-y ?y2) (puntos ?p) (descubierta 0))	
	(tiempo ?t)
	(test (or (= ?y2 (- ?y1 1))
		(= ?y2 (- ?y1 2)) 
		(= ?y2 (- ?y1 3)) 
		(= ?y2 (- ?y1 4)) 
		(= ?y2 (- ?y1 5)) 
		(= ?y2 (- ?y1 6)) 
		(= ?y2 (- ?y1 7))))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataque6izq
	(declare (salience 62))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(tiempo ?t)
	(test (and (= ?y1 ?y2) (> ?x1 ?x2)))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque6der
	(declare (salience 61))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(tiempo ?t)
	(test (and (= ?y1 ?y2) (< ?x1 ?x2)))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Atacamos a todo trapo, sin contenplaciones          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Si nuestro rey no corre peligro haremos que cualquier ficha ataque a lo que tenga mas próximo.
;Para ello priorizaremos que si nuestra ficha encuentra algún enemigo a dos posiciones mas de donde se encuentra, nos movemos. Así conseguimos que nuestra ataque a
;mayor distancia.
;Si no se encuentra a dos posiciones, entonces se econtrará a una, por lo cual haremos lo mismo.


;Nos movemos hacia la derecha si estamos a una casilla mas de su posicion. 

(defrule EQUIPO-A::atacar1
	(declare (salience 50))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test (and (= ?y ?y2) (= ?x (- ?x2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;Nos movemos hacia la izquierda si estamos a una casilla mas de su posicion. 

(defrule EQUIPO-A::atacar2
	(declare (salience 50))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test (and (= ?y ?y2) (= ?x (+ ?x2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;Nos movemos hacia la arriba si estamos a una casilla mas de su posicion. 

(defrule EQUIPO-A::atacar3
	(declare (salience 50))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test (and (= ?x ?x2) (= ?y (+ ?y2 1))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Nos movemos hacia la abajo si estamos a una casilla mas de su posicion. 

(defrule EQUIPO-A::atacar4
	(declare (salience 50))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test (and (= ?x ?x2) (= ?y (- ?y2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;Nos movemos hacia la derecha si estamos a dos casillas mas de su posicion. 

(defrule EQUIPO-A::atacar11
	(declare (salience 51))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test (and (= ?y ?y2) (= ?x (- ?x2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))


;Nos movemos hacia la izquierda si estamos a dos casillas mas de su posicion. 

(defrule EQUIPO-A::atacar21
	(declare (salience 51))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test (and (= ?y ?y2) (= ?x (+ ?x2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))


;Nos movemos hacia la arriba si estamos a dos casillas mas de su posicion. 

(defrule EQUIPO-A::atacar31
	(declare (salience 51))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test (and (= ?x ?x2) (= ?y (+ ?y2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;Nos movemos hacia la abajo si estamos a dos casillas mas de su posicion. 

(defrule EQUIPO-A::atacar41
	(declare (salience 51))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test (and(= ?x ?x2) (= ?y (- ?y2 2))))
		(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;					     ;
; Nos movemos si no hay nada mejor que hacer ;
;					     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Por ultimo en nuestra estrategia, nos moveremos como venga en gana si ninguna de las reglas anteriores se hacen. 
;Como dato importante, diremos que nuestro rey no se mueva aleatoriamente por ahí

(defrule EQUIPO-A::mover-adelante
  (declare (salience 31))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (test (not(= ?p 1)))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mover-derecha
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (test (not(= ?p 1)))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::mover-izquierda
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (test (not(= ?p 1)))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))
