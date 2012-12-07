;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reglas de Inteligencia Artificial para Gades Siege   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Estefanía Rodríguez Quirós

(defrule EQUIPO-A::topalante
	(declare (salience 48))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 6))
	=>
	(assert (mueve(num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::topallaoder
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(test (or (= ?y 2) (= ?y 7)))
	=>
	(assert (mueve(num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::atras6
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(test (or (and (= ?x 1) (= ?y 8)) (and (= ?x 8) (= ?y 1))))
	=>
	(assert (mueve(num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::topallaoizq
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(test (or (= ?y 8) (= ?y 1)))
	=>
	(assert (mueve(num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::6comeatras
	(declare(salience 52))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(test (= ?y1 (+ ?y2 1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::6comealante
	(declare(salience 52))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(test (= ?y1 (- ?y2 1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::6comeder
	(declare(salience 52))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(test (= ?x1 (- ?x2 1)))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::6comeizq
	(declare(salience 52))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(test (= ?x1 (+ ?x2 1)))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::reyalahuida1
	(declare(salience 60))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B") (num ?n22) (pos-x ?x22) (pos-y ?y2) (puntos ?p22))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	(test (and (<> ?x1 (+ ?x22 1)) (<> ?y (+ ?y2 1))))
	(test (and (<> ?x1 (- ?x22 1)) (<> ?y (+ ?y2 1))))
	(test (or (<> ?x1 ?x22) (<> ?y (+ ?y2 2))))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::reyalahuida2
	(declare(salience 60))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B") (num ?n22) (pos-x ?x22) (pos-y ?y2) (puntos ?p22))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	(test (and (<> ?x1 (+ ?x22 1)) (<> ?y (- ?y2 1))))
	(test (and (<> ?x1 (- ?x22 1)) (<> ?y (- ?y2 1))))
	(test (<> ?y (- ?y2 2)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::reyalahuida3
	(declare(salience 60))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n22) (pos-x ?x2) (pos-y ?y22) (puntos ?p22))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	(test (and (<> ?y1 (+ ?y22 1)) (<> ?x (- ?x2 1))))
	(test (and (<> ?y1 (- ?y22 1)) (<> ?x (- ?x2 1))))
	(test (<> ?x (- ?x2 2)))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::reyalahuida4
	(declare(salience 60))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n22) (pos-x ?x2) (pos-y ?y22) (puntos ?p22))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	(test (and (<> ?y1 (+ ?y22 1)) (<> ?x (+ ?x2 1))))
	(test (and (<> ?y1 (- ?y22 1)) (<> ?x (+ ?x2 1))))
	(test (<> ?x (+ ?x2 2)))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::reyalahuida5
	(declare(salience 59))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x2) (pos-y ?y1) (puntos 1))
	(test (and (= ?x1 ?x2) (= ?y1 (+ ?y2 1))))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::reyalahuida6
	(declare(salience 59))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x2) (pos-y ?y1) (puntos 1))
	(test (and (= ?x1 ?x2) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::reyalahuida7
	(declare(salience 59))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x2) (pos-y ?y) (puntos 1))
	(test (= ?x1 (+ ?x2 1)))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::reyalahuida8
	(declare(salience 59))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x2) (pos-y ?y) (puntos 1))
	(test (= ?x1 (- ?x2 1)))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::soloelrey1
	(declare(salience 1))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x2) (pos-y ?y1) (puntos 1))
	(test (or (<> ?y1 (+ ?y2 1)) (<> ?x1 (- ?x2 1))))
	(test (or (<> ?y1 (- ?y2 1)) (<> ?x1 (- ?x2 1))))
	(test (or (<> ?y1 ?y2) (<> ?x1 (- ?x2 1))))
	(test (or (<> ?y1 ?y2) (<> ?x1 (- ?x2 2))))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::soloelrey2
	(declare(salience 1))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x2) (pos-y ?y1) (puntos 1))
	(test (or (<> ?y1 (+ ?y2 1)) (<> ?x1 (+ ?x2 1))))
	(test (or (<> ?y1 (- ?y2 1)) (<> ?x1 (+ ?x2 1))))
	(test (or (<> ?y1 ?y2) (<> ?x1 (+ ?x2 1))))
	(test (or (<> ?y1 ?y2) (<> ?x1 (+ ?x2 2))))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::soloelrey3
	(declare(salience 1))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x2) (pos-y ?y1) (puntos 1))
	(test (or (<> ?x1 (+ ?x2 1)) (<> ?y1 (- ?y2 1))))
	(test (or (<> ?x1 (- ?x2 1)) (<> ?y1 (- ?y2 1))))
	(test (or (<> ?x1 ?x2) (<> ?y1 (- ?y2 1))))
	(test (or (<> ?x1 ?x2) (<> ?y1 (- ?y2 2))))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::soloelrey4
	(declare(salience 1))
	(tiempo ?t)
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(ficha (equipo "A") (num ?n1) (pos-x ?x2) (pos-y ?y1) (puntos 1))
	(test (or (<> ?x1 (+ ?x2 1)) (<> ?y1 (+ ?y2 1))))
	(test (or (<> ?x1 (- ?x2 1)) (<> ?y1 (+ ?y2 1))))
	(test (or (<> ?x1 ?x2) (<> ?y1 (+ ?y2 1))))
	(test (or (<> ?x1 ?x2) (<> ?y1 (+ ?y2 2))))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecho1
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (- ?x2 1))) 
	                              (pos-y ?y2&:(= ?y1 (+ ?y2 1)))
	                              (puntos ?p2)
	                              (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecho2
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (- ?x2 1))) 
	                              (pos-y ?y2&:(= ?y1 (- ?y2 1)))
	                              (puntos ?p2)
	                              (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecho3
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (+ ?x2 1))) 
	                              (pos-y ?y2&:(= ?y1 (- ?y2 1)))
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecho4
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (+ ?x2 1))) 
	                              (pos-y ?y2&:(= ?y1 (+ ?y2 1)))
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::alacecho5
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (+ ?x2 2)))
	                              (pos-y ?y) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecho6
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (- ?x2 2)))
	                              (pos-y ?y) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecho7
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) 
	                              (pos-y ?y2&:(= ?y1 (+ ?y2 2)))
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecho8
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) 
	                              (pos-y ?y2&:(= ?y1 (- ?y2 2)))
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecholejos1
	(declare(salience 49))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (- ?x2 1))) 
	                              (pos-y ?y2&:(= ?y1 (+ ?y2 2))) 
	                              (puntos ?p2)
	                              (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecholejos2
	(declare(salience 49))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (- ?x2 1))) 
	                              (pos-y ?y2&:(= ?y1 (- ?y2 2))) 
	                              (puntos ?p2)
	                              (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecholejos3
	(declare(salience 49))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (+ ?x2 1))) 
	                              (pos-y ?y2&:(= ?y1 (- ?y2 2)))
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecholejos4
	(declare(salience 49))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (+ ?x2 1))) 
	                              (pos-y ?y2&:(= ?y1 (+ ?y2 2)))
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecholejos5
	(declare(salience 49))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (+ ?x2 3)))
	                              (pos-y ?y) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecholejos6
	(declare(salience 49))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (- ?x2 3)))
	                              (pos-y ?y) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecholejos7
	(declare(salience 49))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) 
	                              (pos-y ?y2&:(= ?y1 (+ ?y2 3)))
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::alacecholejos8
	(declare(salience 49))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) 
	                              (pos-y ?y2&:(= ?y1 (- ?y2 3)))
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::alacechoarriba
	(declare(salience 38))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::alacechoabajo
	(declare(salience 38))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::alacechoder
	(declare(salience 38))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::alacechoizq
	(declare(salience 38))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::niom4
	(declare(salience 52))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta ?d))
	(test (= ?y1 (+ ?y2 1)))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::niom3
	(declare(salience 52))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2) (puntos ?p2) (descubierta ?d))
	(test (= ?y1 (- ?y2 1)))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::niom2
	(declare(salience 52))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta ?d))
	(test (= ?x1 (+ ?x2 1)))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::niom1
	(declare(salience 52))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y) (puntos ?p2) (descubierta ?d))
	(test (= ?x1 (- ?x2 1)))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::perohaceralgo1
	(declare(salience 51))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1&:(<= ?y1 3)) 
	                    (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2&:(or (= ?y2 7) (= ?y2 8)))
	                    (puntos ?p2&:(= ?p2 6)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::perohaceralgo2
	(declare(salience 48))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y 4)
	                    (puntos ?p1&:(or (= ?p1 4) (= ?p1 5))))
	(ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2&:(= ?y2 8))
	                    (puntos ?p2&:(= ?p2 6)))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::2ftw4
	(declare(salience 10))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) 
	                    (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::2ftw1
	(declare(salience 10))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) 
	                    (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::2ftw2
	(declare(salience 10))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) 
	                    (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::2ftw3
	(declare(salience 10))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) 
	                    (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::noquedaotra1
	(declare(salience 11))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (- ?x2 1))) 
	                              (pos-y ?y2&:(or (= ?y1 (+ ?y2 1)) (= ?y1 (+ ?y2 2)))) 
	                              (puntos ?p2)
	                              (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::noquedaotra2
	(declare(salience 11))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (- ?x2 1))) 
	                              (pos-y ?y2&:(or (= ?y1 (- ?y2 1)) (= ?y1 (- ?y2 2)))) 
	                              (puntos ?p2)
	                              (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::noquedaotra3
	(declare(salience 11))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (+ ?x2 1))) 
	                              (pos-y ?y2&:(or (= ?y1 (- ?y2 1)) (= ?y1 (- ?y2 2)))) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::noquedaotra4
	(declare(salience 11))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (+ ?x2 1))) 
	                              (pos-y ?y2&:(or (= ?y1 (+ ?y2 1)) (= ?y1 (+ ?y2 2)))) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::noquedaotra5
	(declare(salience 11))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (+ ?x2 2))) 
	                              (pos-y ?y) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::noquedaotra6
	(declare(salience 11))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2&:(= ?x1 (- ?x2 2))) 
	                              (pos-y ?y) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::noquedaotra7
	(declare(salience 11))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) 
	                              (pos-y ?y2&:(= ?y1 (+ ?y2 2))) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::noquedaotra8
	(declare(salience 11))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos ?p1&:(or (= ?p1 2) (= ?p1 3))))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) 
	                              (pos-y ?y2&:(= ?y1 (- ?y2 2))) 
	                              (puntos ?p2) (descubierta ?d))
	(test (or (<> ?d 1) (<= ?p2 ?p1)))
	=>
	(assert (mueve(num ?n1) (mov 1) (tiempo ?t)))
)