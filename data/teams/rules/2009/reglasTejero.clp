;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A 
;Juan Antonio Tejero Fernandez                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defrule EQUIPO-A::5y6muertos_abajo1
;desplaza el 1 hacia abajo
   (declare (salience 80))
   (not(ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6)))
   (not(ficha (equipo "A") (num A2) (pos-x ?x)(pos-y ?y) (puntos 5)))
	(ficha (equipo "A") (num ?n) (pos-x ?x1)(pos-y ?y1) (puntos 1))

   (tiempo ?t)
   =>

   (assert (mueve (num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::5y6muertos_2
   (declare (salience 80))
   (not(ficha (equipo "A") (num ?n6) (pos-x 3)(pos-y 8) (puntos 5)))
   (not(ficha (equipo "A") (num A2) (pos-x ?x5)(pos-y ?y5) (puntos 5)))

   (ficha (equipo "A") (num ?n5) (pos-x ?x5_2)(pos-y ?y5_2) (puntos 5) )
	(ficha (equipo "A") (num ?n) (pos-x ?x)(pos-y ?y) (puntos 1))
	(test(> ?x 1))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n5) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;todas fichas para adelante para que dure un poco mas

(defrule EQUIPO-A::avance3_1_
   (declare (salience 79))
   (not(ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6)))
   (not(ficha (equipo "A") (num ?n5) (pos-x ?x)(pos-y ?y) (puntos 5)))

   (ficha (equipo "A") (num ?n) (pos-x ?x)(pos-y ?y) (puntos 3))

   (tiempo ?t)
   =>

   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::avance4_1_
   (declare (salience 80))
   (not(ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6)))
   (not(ficha (equipo "A") (num ?n5) (pos-x ?x)(pos-y ?y) (puntos 5)))

   (ficha (equipo "A") (num ?n) (pos-x ?x)(pos-y ?y) (puntos 4))

   (tiempo ?t)
   =>

   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::avance2_1_
   (declare (salience 78))
   (not(ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6)))
   (not(ficha (equipo "A") (num ?n5) (pos-x ?x)(pos-y ?y) (puntos 5)))

   (ficha (equipo "A") (num ?n) (pos-x ?x)(pos-y ?y) (puntos 2))

   (tiempo ?t)
   =>

   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
tres primeros movimientos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance6_1
   (declare (salience 70))
   (ficha (equipo "A") (num ?n)  (pos-y 2) (puntos 6))

   (tiempo ?t)
   =>
;	(printout t ">>>>>>>>>>>>><movimiento 1<<<<<<<<<<<<<<<<<<<" crlf)
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::avance6_2
   (declare (salience 65))
   (ficha (equipo "A") (num ?n) (pos-y 3) (puntos 6))

   (tiempo ?t)
   =>
;	(printout t ">>>>>>>>>>>>><movimiento 2<<<<<<<<<<<<<<<<<<<" crlf)
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::avance5_3
   (declare (salience 60))
   (ficha (equipo "A") (num A2) (pos-y ?y) (puntos 5))
	(test(= 1 ?y ))	

   (tiempo ?t)
   =>
;	(printout t ">>>>>>>>>>>>><movimiento 3<<<<<<<<<<<<<<<<<<<" crlf)
   (assert (mueve (num A2) (mov 3) (tiempo ?t))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
repetir bucle hasta arriba
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::avance6_1_bucle
   (declare (salience 30))
   (ficha (equipo "A") (num ?n) (pos-x 1)(pos-y ?y) (puntos 6))

	(test(>= 7   ?y ))
   (tiempo ?t)
   =>
;	(printout t ">>>>>>>>>>>>><movimiento 4<<<<<<<<<<<<<<<<<<< x = 1 y = "  ?y crlf)
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; primer tipo avance 1, en funcion del 6
(defrule EQUIPO-A::avance1_bucle
   (declare (salience 40))
   (ficha (equipo "A") (num ?n) (pos-x ?x1)(pos-y ?y1) (puntos 1))

   (ficha (equipo "A") (num ?n6)  (pos-x ?x6)  (pos-y ?y6)   )
	(test( =  ?y6 ( + 2 ?y1)) )
   (tiempo ?t)
   =>

	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::avance5_1_bucle

   (declare (salience 35))
   (ficha (equipo "A") (num A2) (pos-x ?x)(pos-y ?y) (puntos 5))
   (ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6))
   (ficha (equipo "A") (num ?n) (pos-y ?y1) (puntos 1))
    (test( =  ?y1 ?y) )
   (tiempo ?t)
   =>

	(assert (mueve (num A2) (mov 3) (tiempo ?t))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; si el 6 muere

(defrule EQUIPO-A::avance5_1_bucle2

   (declare (salience 80))
   (ficha (equipo "A") (num A2) (pos-x 2)(pos-y ?y) (puntos 5))
   (not(ficha (equipo "A") (num ?n6) (pos-x 1)(pos-y ?y6) (puntos 6)))

   (tiempo ?t)
   =>
	 (printout t ">>>>>>>>>>>>>  mueve 5_1 porque 6 ha muerto <<<<<<<<<<<<<<<<<<< " crlf)
	(assert (mueve (num A2) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::avance5_2_bucle
   (declare (salience 80))

   (ficha (equipo "A") (num A1) (pos-x ?x)(pos-y ?y) (puntos 5))
   (ficha (equipo "A") (num ?n1) (pos-y ?y1) (puntos 1))
    (test( =  ?y1 ( + 2 ?y)) )
   (tiempo ?t)
   =>

	(assert (mueve (num A1) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bucle, mueve ficha 1 arriba del todo

(defrule EQUIPO-A::avance1_arriba_todo
   (declare (salience 75))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos 1))
	(test(= 7 ?y1))
   (tiempo ?t)

   =>

   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bucle, mueve ficha 5_1 a arriba del todo

(defrule EQUIPO-A::avance5_arriba_todo
   (declare (salience 74))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos 5))
   (ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6))
	(test(= 7 ?y1))
	(test( and (= ?x6 3) (= ?y6 8) ))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bucle, mueve ficha 6 a la izquierda
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::avance6_1_izquierda
   (declare (salience 73))
;necesita mucha prioridad
   (ficha (equipo "A") (num ?n) (pos-x ?x)(pos-y ?y) (puntos 6))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y ?y1) (puntos 1))
	(test(= 8 ?y))
	(test(  or(= ?y ( + 1 ?y1)) (= ?y ?y1)     ))
    ;;;; cuando esté el 1 un nivel por abajo o al mismo nivel;;;;
	(test(>= 2 ?x))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bucle, 4 movimientos finales 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque6_abajo
   (declare (salience 80))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y 1) (puntos ?p1)))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x2)(pos-y 2) (puntos ?p2)))
   (not(ficha (equipo "A") (num ?n2) (pos-x ?x3)(pos-y 3) (puntos ?p3)))

 	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) )
	 (test  (and (> ?y1 ?y2)(< ?p2  6) ))
     (tiempo ?t)
     =>
	 (printout t ">>>>>>>>>>>>>  ataque6_abajo <<<<<<<<<<<<<<<<<<<" crlf)
     (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::ataque6_arriba
   (declare (salience 78))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y 1) (puntos ?p1)))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x2)(pos-y 2) (puntos ?p2)))
   (not(ficha (equipo "A") (num ?n2) (pos-x ?x3)(pos-y 3) (puntos ?p3)))

 	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) )
	 (test  (and (< ?y1 ?y2)(< ?p2  6) ))
     (tiempo ?t)
     =>
	 (printout t ">>>>>>>>>>>>>  ataque6_arriba <<<<<<<<<<<<<<<<<<<" crlf)
     (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::ataque6_izqda
   (declare (salience 79))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y 1) (puntos ?p1)))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x2)(pos-y 2) (puntos ?p2)))
   (not(ficha (equipo "A") (num ?n2) (pos-x ?x3)(pos-y 3) (puntos ?p3)))
 	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) )
	 (test  (and (< ?x1 ?x2)(< ?p2  6) ))
     (tiempo ?t)
     =>
	 (printout t ">>>>>>>>>>>>>  ataque6_izqda <<<<<<<<<<<<<<<<<<<" crlf)
     (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::ataque6_drcha
   (declare (salience 77))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y 1) (puntos ?p1)))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x2)(pos-y 2) (puntos ?p2)))
   (not(ficha (equipo "A") (num ?n2) (pos-x ?x3)(pos-y 3) (puntos ?p3)))
 	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) )
	 (test  (and (> ?x1 ?x2)(< ?p2  6) ))
     (tiempo ?t)
     =>
	 (printout t ">>>>>>>>>>>>>  ataque6_drcha <<<<<<<<<<<<<<<<<<<" crlf)
     (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bucle, 4 movimientos finales 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque5_abajo
   (declare (salience 80))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y 1) (puntos ?p1)))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x2)(pos-y 2) (puntos ?p2)))
   (not(ficha (equipo "A") (num ?n2) (pos-x ?x3)(pos-y 3) (puntos ?p3)))
   (not(ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6)))
 	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) )
	 (test  (and (> ?y1 ?y2)(< ?p2  5) ))
     (tiempo ?t)
     =>
	 (printout t ">>>>>>>>>>>>>  ataque5_abajo <<<<<<<<<<<<<<<<<<<" crlf)
     (assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::ataque5_arriba
   (declare (salience 78))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y 1) (puntos ?p1)))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x2)(pos-y 2) (puntos ?p2)))
   (not(ficha (equipo "A") (num ?n2) (pos-x ?x3)(pos-y 3) (puntos ?p3)))
   (not(ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6)))

 	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) )
	 (test  (and (< ?y1 ?y2)(< ?p2  5) ))
     (tiempo ?t)
     =>
	 (printout t ">>>>>>>>>>>>>  ataque6_arriba <<<<<<<<<<<<<<<<<<<" crlf)
     (assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::ataque5_izqda
   (declare (salience 79))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y 1) (puntos ?p1)))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x2)(pos-y 2) (puntos ?p2)))
   (not(ficha (equipo "A") (num ?n2) (pos-x ?x3)(pos-y 3) (puntos ?p3)))
   (not(ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6)))
 	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) )
	 (test  (and (< ?x1 ?x2)(< ?p2  5) ))
     (tiempo ?t)
     =>
	 (printout t ">>>>>>>>>>>>>  ataque6_izqda <<<<<<<<<<<<<<<<<<<" crlf)
     (assert (mueve (num ?n1) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::ataque5_drcha
   (declare (salience 77))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x1)(pos-y 1) (puntos ?p1)))
   (not(ficha (equipo "A") (num ?n1) (pos-x ?x2)(pos-y 2) (puntos ?p2)))
   (not(ficha (equipo "A") (num ?n2) (pos-x ?x3)(pos-y 3) (puntos ?p3)))
   (not(ficha (equipo "A") (num ?n6) (pos-x ?x6)(pos-y ?y6) (puntos 6)))
 	 (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	 (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) )
	 (test  (and (> ?x1 ?x2)(< ?p2  5) ))
     (tiempo ?t)
     =>
	 (printout t ">>>>>>>>>>>>>  ataque6_drcha <<<<<<<<<<<<<<<<<<<" crlf)
     (assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
todos los 2, 3, y los 4 hacia adelante
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::avance3_1_bucle
   (declare (salience 30))
   (ficha (equipo "A") (num ?n6) (pos-x 3)(pos-y 8) (puntos 6))
   (ficha (equipo "A") (num ?n) (pos-x ?x)(pos-y ?y) (puntos 3))
	(test(<= ?y 5 ))
   (tiempo ?t)
   =>
	(printout t ">>>>>>>>>>>>>  avance 3 bucle <<<<<<<<<<<<<<<<<<< x  y " ?x ?y crlf)
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::avance4_1_bucle
   (declare (salience 25))
   (ficha (equipo "A") (num ?n6) (pos-x 3)(pos-y 8) (puntos 6))
   (ficha (equipo "A") (num ?n) (pos-x ?x)(pos-y ?y) (puntos 4))
	(test(<= ?y 5 ))
   (tiempo ?t)
   =>
	(printout t ">>>>>>>>>>>>>  avance 4 bucle <<<<<<<<<<<<<<<<<<< x  y " ?x ?y crlf)
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::avance2_1_bucle
   (declare (salience 20))
   (ficha (equipo "A") (num ?n6) (pos-x 3)(pos-y 8) (puntos 6))
   (ficha (equipo "A") (num ?n) (pos-x ?x)(pos-y ?y) (puntos 2))
	(test(<= ?y 5 ))
   (tiempo ?t)
   =>
	(printout t ">>>>>>>>>>>>>  avance 2 bucle <<<<<<<<<<<<<<<<<<< x  y " ?x ?y crlf)
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))



