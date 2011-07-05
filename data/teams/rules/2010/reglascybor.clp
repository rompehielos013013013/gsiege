;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                 Reglas de Inteligencia Artificial                       ;
;                     básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;				Fichas	                                 ;
; 				1 - Rey					 ;
;			        2 - Peón				 ;
; 				3 - Torre                                ;
; 				4 - Alfil                                ;
; 				5 - Caballo                              ;
; 				6 - Reina                                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Moisés Gautier Gómez

(defrule EQUIPO-A::death
(declare (salience 80))
  (not (ficha (equipo "A") (puntos 4) ))
  (not (ficha (equipo "A") (puntos 5) ))
  =>
  (assert(matar1))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::movPrincipal
(declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 5)) 
  
  (test (< ?ya 6))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::farol
(declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 4))

  (test  (< ?ya 6))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::mov1
(declare (salience 10))
  (tiempo ?t)
  (matar-1-ya)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa)) 
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::moitorpedo1
(declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))

  (test (= ?xb (- ?xa 1)))
  (test (= ?yb (+ ?ya 1)))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::moitorpedo2
(declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))

  (test (= ?xb (+ ?xa 1)))
  (test (= ?yb (+ ?ya 1)))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::moitorpedo3
(declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	
  (test (= ?xb (- ?xa 1)))
  (test (= ?yb (- ?ya 1)))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::moitorpedo4
(declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
  
  (test (= ?xb (+ ?xa 1)))
  (test (= ?yb (- ?ya 1)))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::destruccion1
(declare (salience 44))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xa) (pos-y ?yb))

  (test (= ?ya (- ?yb 1)))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::destruccion2
(declare (salience 42))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?ya))

  (test (= ?xa (- ?xb 1)))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::destruccion3
(declare (salience 42))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?ya))
	
  (test (= ?xa (+ ?xb 1)))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::colacao1
(declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?ya) )

  (test (> ?xb ?xa))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::colacao2
(declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?ya) )

  (test (< ?xb ?xa))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::retaguardia1
(declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb) (puntos ?pb) (descubierta 1))

  (test (= ?xb (- ?xa 1)))
  (test (= ?yb (+ ?ya 1)))
  (test (> ?pb ?pa))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::retaguardia2
(declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb) (puntos ?pb) (descubierta 1))
  
  (test (= ?xb (+ ?xa 1)))
  (test (= ?yb (+ ?ya 1)))
  (test (> ?pb ?pa))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::retrasar1
(declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xa) (pos-y ?yb) (puntos ?pb) (descubierta 1))

  (test (= ?ya (- ?yb 1)))
  (test (> ?pb ?pa))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::retrasar2
(declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?ya) (puntos ?pb) (descubierta 1))

  (test (= ?xa (- ?xb 1)))
  (test (> ?pb ?pa))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::retrasar3
(declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?ya) (puntos ?pb) (descubierta 1))

  (test (> ?pb ?pa))
  (test (= ?xa (+ ?xb 1)))
  (test (or (<> ?pa 1) (<> ?pa 6)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ficharey1
(declare (salience 78))
  (not (matar1))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
  (ficha (equipo "A") (num ?n3) (pos-x ?xb) (pos-y ?yc) (puntos 1))
  
  (test (= ?yc (- ?yb 2)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ficharey2
(declare (salience 78))
  (not(matar1))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
  (ficha (equipo "A") (num ?n3) (pos-x ?xc) (pos-y ?yb) (puntos 1))

  (test (= ?xc (- ?xb 2)))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::ficharey3
(declare (salience 78))
  (not(matar1))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
  (ficha (equipo "A") (num ?n3) (pos-x ?xb) (pos-y ?yc) (puntos 1))

  (test (= ?yc (- ?yb 1)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ficharey4
(declare (salience 78))
  (not(matar1))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
  (ficha (equipo "A") (num ?n3) (pos-x ?xc) (pos-y ?yb) (puntos 1))

  (test (= ?xc (- ?xb 1)))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::posfijarey
(declare (salience 80))
  (ficha (equipo "A") (puntos 1))
  (tiempo ?t)
  =>
  (printout t "No conviene moverlo" crlf)
)

(defrule EQUIPO-A::posfijareina
(declare (salience 77))
  (not (matar1))
  (ficha (equipo "A") (puntos 6))
  (tiempo ?t)
  =>
  (printout t "No conviene moverla" crlf)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::reina1
(declare (salience 60))
	 (matar1)
	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (not (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos 6) (descubierta 1)))
	 (tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::reina2
(declare (salience 78))
	 (matar1)
	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1) (puntos ?p))
	 (test (<> ?p 6))
	 (test (< ?x2 ?x1))	 
	 (tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::reina3
(declare (salience 79))
	 (matar1)
	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1) (puntos ?p))
	 (test (<> ?p 6))
	 (test (> ?x2 ?x1))	 
	 (tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::reina4
(declare (salience 79))
	 (matar1)
	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p))
	 (test (<> ?p 6))
	 (test (= ?y2 (+ ?y1 1)))	 
	 (tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::reina5
(declare (salience 78))
	 (matar1)
	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p))
	 (test (= ?p 6))
	 (test (= ?y2 (+ ?y1 1)))	 
	 (tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::reina6
(declare (salience 79))
	 (matar1)
	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p))
	 (test (= ?p 6))
	 (test (= ?y2 (+ ?y1 1)))	 
	 (tiempo ?t)
=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

