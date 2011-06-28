;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo Pepeluis                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;Jose Luis Falcon Ramirez
;
;
;
(defrule EQUIPO-A::defensa1
	(declare (salience 80))
	(ficha (equipo "A") (pos-x ?x) (pos-y 2) (puntos 1) (num ?n))
	(not(sinseis))
	(not(der))
	(not(izq))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque1
	(declare (salience 60))
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
	(not(tope))
	(not(der))
	(not(izq))
	(not(sinseis))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque2
	(declare (salience 60))
	(ficha (equipo "A") (pos-x ?x) (pos-y 8) (puntos 6) (num ?n))
	(not(sinseis))
	(tiempo ?t)
	=>
	(assert (tope))
	(assert (der))
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque2-2
	(declare (salience 60))
	(ficha (equipo "A") (pos-x ?x) (pos-y 8) (puntos 6) (num ?n))
	(not(sinseis))
	(tiempo ?t)
	(der)
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque3
	(declare (salience 60))
	(ficha (equipo "A") (pos-x 8) (pos-y ?y) (puntos 6) (num ?n))
	(not(sinseis))
	(tope)
	(tiempo ?t)
	?h<-(tope)
	?f<-(der)
	=>
	(retract ?f)
	(retract ?h)
	(assert (izq))
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque4
	(declare (salience 60))
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
	(not(sinseis))
	(izq)
	(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

defrule EQUIPO-A::ataque4-2
	(declare (salience 60))
	(ficha (equipo "A") (pos-x 1) (pos-y ?y) (puntos 6) (num ?n))
	(not(sinseis))
	(tiempo ?t)
	(izq)
	?h<-(izq)
	=>
	(retract(?h))
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
	(assert (der))
)

(defrule EQUIPO-A::muertoseis
	(declare (salience 80))
	(not(sinseis))
	(not(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n)))
	(tiempo ?t)
	=>
	(assert (sinseis))
)

(defrule EQUIPO-A::ataque5
	(declare (salience 70))
	(sinseis)
	(tiempo ?t)
	(ficha (equipo "A") (pos-x 8) (pos-y ?y) (puntos 5) (num ?n))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::muerte5
	(declare (salience 80))
	(sinseis)
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos ?p) (num A582))
	?h<-(barr5)
	?f<-(barr5-2)
	?k<-(top)
	=>
	(retract ?h)
	(retract ?f)
	(retract ?k)
)

(defrule EQUIPO-A::ataque5-1
	(declare (salience 65))
	(sinseis)
	(tiempo ?t)
	(ficha (equipo "A") (pos-x 7) (pos-y ?y) (puntos 5) (num ?n))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque6
	(declare (salience 70))
	(sinseis)
	(not(barr5))
	(not(barr5-2))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y 8) (puntos 5) (num ?n))
	=>
	(assert (barr5-2))
	(assert (top))
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

;El barrido del segundo 5 se hara de abajo hacia arriba

(defrule EQUIPO-A::ataquebarrinv
	(declare (salience 72))
	(sinseis)
	(not(barr5))
	(not(barr5-2))
	(not(top))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x 1) (pos-y ?y) (puntos 5) (num ?n))
	=>
	(assert (barr5))
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::ataque6-1
	(declare (salience 70))
	(sinseis)
	(not(barr5))
	(barr5-2)
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 5) (num ?n))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque7
	(declare (salience 70))
	(sinseis)
	(not (barr5))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x 1) (pos-y ?y) (puntos 5) (num ?n))
	=>
	(assert (barr5))
	(assert (top))
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;Barrido 5 -> Mover derecha 5

(defrule EQUIPO-A::ataque8
	(declare (salience 70))
	(sinseis)
	(not(barr5-2))
	(top)
	(barr5)
	(tiempo ?t)
	(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 5) (num ?n))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque9
	(declare (salience 70))
	(sinseis)
	(barr5)
	(top)
	(not(barr5-2))
	(tiempo ?t)
	(ficha (equipo "A") (pos-x 8) (pos-y ?y) (puntos 5) (num ?n))
	?h<-(barr5)
	=>
	(retract ?h)
	(assert (barr5-2))
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)
 
(defrule EQUIPO-A::ataqueclasico1
	(declare (salience 75))
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2) (descubierta 1))
	(test (= ?y1 ?y2)) 
	(test (< ?x1 ?x2))
	(test (> ?p1 ?p2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataqueclasico2
	(declare (salience 75))
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2) (descubierta 1))
	(test(= ?y1 ?y2))
	(test (> ?x1 ?x2))
	(test (> ?p1 ?p2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataqueclasico3
	(declare (salience 75))
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2) (descubierta 1))
	(test(< ?y1 ?y2)) 
	(test (= ?x1 ?x2)) 
	(test (> ?p1 ?p2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataqueclasico4
	(declare (salience 75))
	(ficha (equipo "A") (pos-x ?x1) (pos-y ?y1) (puntos ?p1) (num ?n1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (num ?n2) (descubierta 1))
	(test(> ?y1 ?y2)) 
	(test (= ?x1 ?x2)) 
	(test (> ?p1 ?p2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::retirada
	(declare (salience 80))
	(ficha (equipo "A") (pos-x ?x) (pos-y 3) (puntos 1) (num ?n))
	(sinseis)
	(tiempo ?t)
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)
