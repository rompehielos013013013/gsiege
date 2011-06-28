;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Carlos Villegas Núnez 2009
;
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;; POSICION INICIAL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::posicioninicial1
  (declare (salience 78))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x 4) (pos-y 2) (puntos 5))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::posicioninicial2
  (declare (salience 78))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x 4) (pos-y 3) (puntos 5))
   =>
   (assert (posini))
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Si no hay nada mejor que hacer ;;;;;;;;;;;;;;;;;

;; A la cargaaaaaa!!!

(defrule EQUIPO-A::basica1
  (declare (salience 9))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (test (> ?p 1))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;; LLegamos al final, la carga ha fallado... pues ... que sea lo que dios quiera...

;;Ataque hacia arriba !!!!!!

(defrule EQUIPO-A::ataquecubierta1
	(declare(salience 9))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)(pos-y ?y2) (puntos ?p2))
	(test (and (= ?x1 ?x2) (< ?y1 ?y2)))
	(test (> ?p1 1))
	(tiempo ?t)
	=>
	(assert(mueve(num ?n1)(mov 3)(tiempo ?t)))
)


;;Ataque hacia abajo!!!!!

(defrule EQUIPO-A::ataquecubierta2
	(declare(salience 9))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)(pos-y ?y2) (puntos ?p2))
	(test (and (= ?x1 ?x2) (> ?y1 ?y2)))
	(test (> ?p1 1))
	(tiempo ?t)
	=>
	(assert(mueve(num ?n1)(mov 4)(tiempo ?t)))
)

;;Ataque hacia la derecha!!!!!

(defrule EQUIPO-A::ataquecubierta3
	(declare(salience 9))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)(pos-y ?y2) (puntos ?p2))
	(test (and (= ?y1 ?y2) (< ?x1 ?x2)))
	(test (> ?p1 1))
	(tiempo ?t)
	=>
	(assert(mueve(num ?n1)(mov 1)(tiempo ?t)))
)

;;Ataque hacia la izquierda!!!!
 
(defrule EQUIPO-A::ataquecubierta4
	(declare(salience 9))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)(pos-y ?y2) (puntos ?p2))
	(test (and (= ?y1 ?y2) (> ?x1 ?x2)))
	(test (> ?p1 1))
	(tiempo ?t)
	=>
	(assert(mueve(num ?n1)(mov 2)(tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Ataque a una ficha descubierta ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Ataque hacia arriba !!!!!!

(defrule EQUIPO-A::ataquedescubierta1
	(declare(salience 30))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)(pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and(> ?p1 ?p2) (= ?x1 ?x2) (< ?y1 ?y2)))
	(tiempo ?t)
	=>
	(assert(mueve(num ?n1)(mov 3)(tiempo ?t)))
)


;;Ataque hacia abajo!!!!!

(defrule EQUIPO-A::ataquedescubierta2
	(declare(salience 30))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)(pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and(> ?p1 ?p2) (= ?x1 ?x2) (> ?y1 ?y2)))
	(tiempo ?t)
	=>
	(assert(mueve(num ?n1)(mov 4)(tiempo ?t)))
)

;;Ataque hacia la derecha!!!!!

(defrule EQUIPO-A::ataquedescubierta3
	(declare(salience 30))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)(pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and(> ?p1 ?p2) (= ?y1 ?y2) (< ?x1 ?x2)))
	(tiempo ?t)
	=>
	(assert(mueve(num ?n1)(mov 1)(tiempo ?t)))
)

;;Ataque hacia la izquierda!!!!
 
(defrule EQUIPO-A::ataquedescubierta4
	(declare(salience 30))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2)(pos-y ?y2) (puntos ?p2) (descubierta 1))
	(test (and(> ?p1 ?p2) (= ?y1 ?y2) (> ?x1 ?x2)))
	(tiempo ?t)
	=>
	(assert(mueve(num ?n1)(mov 2)(tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; REGLAS FICHA 6;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Mover el 6 hacia arriba.
(defrule EQUIPO-A::basica60
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (> ?y 1))
  (posini)
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;;Atacar si hay ficha en la casilla de la izquierda. Eje X
(defrule EQUIPO-A::atacando69
  (declare (salience 69))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de la derecha. Eje X
(defrule EQUIPO-A::atacando68
  (declare (salience 68))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de abajo. Eje Y

(defrule EQUIPO-A::atacando67
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de arriba. Eje Y

(defrule EQUIPO-A::atacando66
  (declare (salience 66))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


;;Atacar si hay ficha en la casilla de la izquierda. Eje X
(defrule EQUIPO-A::atacando65
  (declare (salience 65))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (< ?x ?x2))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de la derecha. Eje X
(defrule EQUIPO-A::atacando64
  (declare (salience 64))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (> ?x ?x2))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de abajo. Eje Y

(defrule EQUIPO-A::atacando63
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (> ?y ?y2))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de arriba. Eje Y

(defrule EQUIPO-A::atacando62
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (> ?y ?y2))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; REGLAS FICHA 5;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;Mover el 5 hacia arriba. Ataque frontal!! Ha muerto nuestro Héroe!!
(defrule EQUIPO-A::basica50
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (> ?y 1))
  (test (= ?x 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de la izquierda. Eje X
(defrule EQUIPO-A::atacando59
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de la derecha. Eje X
(defrule EQUIPO-A::atacando58
  (declare (salience 58))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de abajo. Eje Y

(defrule EQUIPO-A::atacando57
  (declare (salience 57))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de arriba. Eje Y

(defrule EQUIPO-A::atacando55
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


;;Atacar si hay ficha en la casilla de la izquierda. Eje X
(defrule EQUIPO-A::atacando55
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (< ?x ?x2))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de la derecha. Eje X
(defrule EQUIPO-A::atacando54
  (declare (salience 54))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (> ?x ?x2))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de abajo. Eje Y

(defrule EQUIPO-A::atacando53
  (declare (salience 53))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (> ?y ?y2))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;Atacar si hay ficha en la casilla de arriba. Eje Y

(defrule EQUIPO-A::atacando52
  (declare (salience 52))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (> ?y ?y2))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Reglas del Rey;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Viene un enemigo por arriba, huye!!

(defrule EQUIPO-A::reyhuyendo1
   (declare (salience 80))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
   (ficha (equipo "B") (pos-x ?x3) (pos-y ?y3))
   (test (= ?x1 ?x2))
   (test (= (+ ?y1 1) ?y2))
   (test (neq ?y1 ?y3))
   (test (neq (+ ?x1 1) ?x3))
   
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

;;Viene un enemigo por abajo, huye!!

(defrule EQUIPO-A::reyhuyendo2
   (declare (salience 80))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
   (ficha (equipo "B") (pos-x ?x3) (pos-y ?y3))
   (test (= ?x1 ?x2))
   (test (= (+ ?y2 1) ?y1))
   (test (neq ?y1 ?y3))
   (test (neq (+ ?x3 1) ?x1))
   
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

;;Viene un enemigo por la derecha, huye!!

(defrule EQUIPO-A::reyhuyendo3
   (declare (salience 80))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
   (ficha (equipo "B") (pos-x ?x3) (pos-y ?y3))
   (test (= ?y1 ?y2))
   (test (= (+ ?x2 1) ?x1))
   (test (neq ?x1 ?x3))
   (test (neq (+ ?y1 1) ?y3))
   
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

;;Viene un enemigo por la izquierda, huye!!

(defrule EQUIPO-A::reyhuyendo4
   (declare (salience 80))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
   (ficha (equipo "B") (pos-x ?x3) (pos-y ?y3))
   (test (= ?y1 ?y2))
   (test (= (+ ?x1 1) ?x2))
   (test (neq ?x1 ?x3))
   (test (neq (+ ?y1 1) ?y3))
   
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Reglas Defensa del Rey;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Por la patria!!

(defrule EQUIPO-A::suicidio1
  (declare (salience 80))
  (tiempo ?t)
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (ficha (equipo "B") (pos-x ?x3) (pos-y ?y3))
   (test (= ?y1 ?y2))
   (test (= (+ ?x1 1) ?x2))
   (test (= (+ ?x2 1) ?x3))
   
   =>
   (assert (mueve (num ?n2) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::suicidio2
  (declare (salience 80))
  (tiempo ?t)
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (ficha (equipo "B") (pos-x ?x3) (pos-y ?y3))
   (test (= ?y1 ?y2))
   (test (= (+ ?x2 1) ?x1))
   (test (= (+ ?x3 1) ?x2))
   
   =>
   (assert (mueve (num ?n2) (mov 2) (tiempo ?t))))
