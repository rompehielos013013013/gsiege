;--------;
; ATACAR ;
;--------;

(defrule EQUIPO-A::ataque_1
   (declare(salience 160))
   (tiempo ?t)
   (ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?y)) (puntos ?pb)
   (test (> ?p 2))
   (test (= ?xb (+ ?x 1)))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))

(defrule EQUIPO-A::ataque_2
   (declare(salience 160))
   (tiempo ?t)
   (ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?y)) (puntos ?pb)
   (test (> ?p 2))
   (test (= ?xb (- ?x 1)))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))

(defrule EQUIPO-A::ataque_3
   (declare(salience 160))
   (tiempo ?t)
   (ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (ficha(equipo "B") (num ?nb) (pos-x ?x) (pos-y ?yb)) (puntos ?pb)
   (test (> ?p 2))
   (test (= ?yb (+ ?y 1)))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))

(defrule EQUIPO-A::ataque_4
   (declare(salience 160))
   (tiempo ?t)
   (ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (ficha(equipo "B") (num ?nb) (pos-x ?x) (pos-y ?yb)) (puntos ?pb)
   (test (> ?p 2))
   (test (= ?yb (- ?y 1)))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))

;-------------;
; EL REY HUYE ;
;-------------;

(defrule EQUIPO-A::rey_atacado_derecha
   (declare(salience 150))
   (tiempo ?t)
   (ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
   (test (= ?x (- ?xb 1)))
   (test (= ?y ?yb))
   (not (ficha (equipo "B") (pos-x ?x2&:(= ?x (+ ?x2 1))) (pos-y ?y2&:(= ?y ?y2))))
   (not (ficha (equipo "B") (pos-x ?x3&:(= ?x (+ ?x3 2))) (pos-y ?y3&:(= ?y ?y3))))
   (not (ficha (equipo "B") (pos-x ?x4&:(= ?x (+ ?x4 1))) (pos-y ?y4&:(= ?y (- ?y4 1)))))
   (not (ficha (equipo "B") (pos-x ?x5&:(= ?x (+ ?x5 1))) (pos-y ?y5&:(= ?y (+ ?y5 1)))))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))

(defrule EQUIPO-A::rey_atacado_derecha_2
   (declare(salience 149))
   (tiempo ?t)
   (ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
   (test (= ?x (- ?xb 1)))
   (test (= ?y ?yb))
   (not (ficha (equipo "B") (pos-x ?x2&:(= ?x (+ ?x2 1))) (pos-y ?y2&:(= ?y (+ ?y2 1)))))
   (not (ficha (equipo "B") (pos-x ?x3&:(= ?x ?x3)) (pos-y ?y3&:(= ?y (+ ?y3 1)))))
   (not (ficha (equipo "B") (pos-x ?x4&:(= ?x ?x4)) (pos-y ?y4&:(= ?y (+ ?y4 2)))))
   (not (ficha (equipo "B") (pos-x ?x5&:(= ?x (- ?x5 1))) (pos-y ?y5&:(= ?y (+ ?y5 1)))))
    =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))

(defrule EQUIPO-A::rey_atacado_derecha_3
	(declare(salience 149))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?x (- ?xb 1)))
	(test (= ?y ?yb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (+ ?x2 1))) (pos-y ?y2&:(= ?y (- ?y2 1)))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x ?x3)) (pos-y ?y3&:(= ?y (- ?y3 1)))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x ?x4)) (pos-y ?y4&:(= ?y (- ?y4 2)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (- ?x5 1))) (pos-y ?y5&:(= ?y (- ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
	
(defrule EQUIPO-A::rey_atacado_izquierda
	(declare(salience 150))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?x (+ ?xb 1)))
	(test (= ?y ?yb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (+ ?x2 1))) (pos-y ?y2&:(= ?y (+ ?y2 1)))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x ?x3)) (pos-y ?y3&:(= ?y (+ ?y3 1)))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x ?x4)) (pos-y ?y4&:(= ?y (+ ?y4 2)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (- ?x5 1))) (pos-y ?y5&:(= ?y (+ ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
	
(defrule EQUIPO-A::rey_atacado_izquierda_2
	(declare(salience 149))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?x (+ ?xb 1)))
	(test (= ?y ?yb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (- ?x2 1))) (pos-y ?y2&:(= ?y ?y2))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x (- ?x3 2))) (pos-y ?y3&:(= ?y ?y3))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x (- ?x4 1))) (pos-y ?y4&:(= ?y (- ?y4 1)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (- ?x5 1))) (pos-y ?y5&:(= ?y (+ ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
	
(defrule EQUIPO-A::rey_atacado_izq_3
	(declare(salience 149))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?x (+ ?xb 1)))
	(test (= ?y ?yb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (+ ?x2 1))) (pos-y ?y2&:(= ?y (- ?y2 1)))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x ?x3)) (pos-y ?y3&:(= ?y (- ?y3 1)))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x ?x4)) (pos-y ?y4&:(= ?y (- ?y4 2)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (- ?x5 1))) (pos-y ?y5&:(= ?y (- ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
	
(defrule EQUIPO-A::rey_atacado_arriba
	(declare(salience 150))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?y (- ?yb 1)))
	(test (= ?x ?xb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (+ ?x2 1))) (pos-y ?y2&:(= ?y (+ ?y2 1)))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x ?x3)) (pos-y ?y3&:(= ?y (+ ?y3 1)))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x ?x4)) (pos-y ?y4&:(= ?y (+ ?y4 2)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (- ?x5 1))) (pos-y ?y5&:(= ?y (+ ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
	
(defrule EQUIPO-A::rey_atacado_arriba_2
	(declare(salience 149))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?y (- ?yb 1)))
	(test (= ?x ?xb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (+ ?x2 1))) (pos-y ?y2&:(= ?y ?y2))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x (+ ?x3 2))) (pos-y ?y3&:(= ?y ?y3))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x (+ ?x4 1))) (pos-y ?y4&:(= ?y (- ?y4 1)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (+ ?x5 1))) (pos-y ?y5&:(= ?y (+ ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))

(defrule EQUIPO-A::rey_atacado_arriba_3
	(declare(salience 149))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?y (- ?yb 1)))
	(test (= ?x ?xb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (- ?x2 1))) (pos-y ?y2&:(= ?y ?y2))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x (- ?x3 2))) (pos-y ?y3&:(= ?y ?y3))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x (- ?x4 1))) (pos-y ?y4&:(= ?y (- ?y4 1)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (- ?x5 1))) (pos-y ?y5&:(= ?y (+ ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))

(defrule EQUIPO-A::rey_atacado_abajo
	(declare(salience 150))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?y (+ ?yb 1)))
	(test (= ?x ?xb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (+ ?x2 1))) (pos-y ?y2&:(= ?y ?y2))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x (+ ?x3 2))) (pos-y ?y3&:(= ?y ?y3))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x (+ ?x4 1))) (pos-y ?y4&:(= ?y (- ?y4 1)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (+ ?x5 1))) (pos-y ?y5&:(= ?y (+ ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))

(defrule EQUIPO-A::rey_atacado_abajo_2
	(declare(salience 149))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?y (+ ?yb 1)))
	(test (= ?x ?xb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (- ?x2 1))) (pos-y ?y2&:(= ?y ?y2))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x (- ?x3 2))) (pos-y ?y3&:(= ?y ?y3))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x (- ?x4 1))) (pos-y ?y4&:(= ?y (- ?y4 1)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (- ?x5 1))) (pos-y ?y5&:(= ?y (+ ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
	
(defrule EQUIPO-A::rey_atacado_abajo_3
	(declare(salience 149))
	(tiempo ?t)
	(ficha(equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
	(ficha(equipo "B") (num ?nb) (pos-x ?xb) (pos-y ?yb))
	(test (= ?y (+ ?yb 1)))
	(test (= ?x ?xb))
	(not (ficha (equipo "B") (pos-x ?x2&:(= ?x (+ ?x2 1))) (pos-y ?y2&:(= ?y (- ?y2 1)))))
	(not (ficha (equipo "B") (pos-x ?x3&:(= ?x ?x3)) (pos-y ?y3&:(= ?y (- ?y3 1)))))
	(not (ficha (equipo "B") (pos-x ?x4&:(= ?x ?x4)) (pos-y ?y4&:(= ?y (- ?y4 2)))))
	(not (ficha (equipo "B") (pos-x ?x5&:(= ?x (- ?x5 1))) (pos-y ?y5&:(= ?y (- ?y5 1)))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))

;-----------------------------------------------------------;
; AVANZAR LOS 5 HASTA LA PRIMERA FILA DE FICHAS DEL ENEMIGO ;
;-----------------------------------------------------------;

(defrule EQUIPO-A::avance5
   (declare (salience 100))
   (ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 5))
   (test (<> 7 ?y))
   (tiempo ?t)
   (test (< 80 ?t))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;-------------------------------------;
; BARRER  HACIA EL CENTRO CON AMBOS 5 ;
;-------------------------------------;

(defrule EQUIPO-A::barrer5izq
   (declare (salience 95))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (tiempo ?t)
   (test (> 4 ?x))
   (test (= 7 ?y))
   (test (< 80 ?t))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::barrer5der
   (declare (salience 95))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (tiempo ?t)
   (test (< ?t 20))
   (test (< 5 ?x))
   (test (= 7 ?y))
   (test (< 80 ?t))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;------------------------------;
; AVANZAR HASTA LA ULTIMA FILA ;
;------------------------------;

(defrule EQUIPO-A::avance5_2_1
   (declare (salience 94))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (tiempo ?t)
   (test (= 7 ?y))
   (test (= 4 ?x))
   (test (< 80 ?t))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::avance5_2_2
   (declare (salience 94))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (test (= 7 ?y))
   (test (= 5 ?x))
   (tiempo ?t)
   (test (< 80 ?t))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;--------------------------------------------------------------;
; AVANZAR EL 6 Y EL 1 HACIA ARRIBA Y COLOCAR EL 1 DETRAS DEL 6 ;
;--------------------------------------------------------------;

(defrule EQUIPO-A::avance1
   (declare (salience 90))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 6))
   (test (= ?y1 (- ?y2 2)))
   (test (= ?x1 ?x2))
   (tiempo ?t)
   (test (< 80 ?t))
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::avance6
   (declare (salience 85))
   (ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 6))
   (test (<> 8 ?y))
   (tiempo ?t)
   (test (< 80 ?t))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mover6der_aux
   (declare (salience 84))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (test (= 1 ?x))
   (test (= 8 ?y))
   (tiempo ?t)
   (test (< 80 ?t))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::avance1_aux
   (declare (salience 83))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (test (= ?y 7))
   (test (= ?x 1))
   (tiempo ?t)
   (test (< 80 ?t))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;---------------------------------;
; BARRER LA ULTIMA FILA CON LOS 5 ;
;---------------------------------;

(defrule EQUIPO-A::barrer5izq_1
   (declare (salience 80))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (dimension ?dim&:(= ?y (- ?dim 1)))
   (tiempo ?t)
   (test (= 8 ?y))
   (test (< 80 ?t))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::barrer5der_1
   (declare (salience 80))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (dimension ?dim&:(= ?y ?dim))
   (tiempo ?t)
   (test (< 80 ?t))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;--------------------------------------;
; SI LOS 5 MURIERON, BARREMOS CON EL 6 ;
;--------------------------------------;

(defrule EQUIPO-A::barrer6der
   (declare (salience 75))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (tiempo ?t)
   (test (= 8 ?y))
   (test (< 90 ?t))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;-----------------------------------------------------------;
; AVANZAR LOS 4 HASTA LA PRIMERA FILA DE FICHAS DEL ENEMIGO ;
;-----------------------------------------------------------;

(defrule EQUIPO-A::avance4
   (declare (salience 60))
   (ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 4))
   (test (<> 5 ?y))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;-------------------------------------;
; BARRER  HACIA EL CENTRO CON AMBOS 4 ;
;-------------------------------------;

(defrule EQUIPO-A::barrer4izq
   (declare (salience 55))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
   (tiempo ?t)
   (test (> 4 ?x))
   (test (= 5 ?y))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::barrer4der
   (declare (salience 55))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
   (tiempo ?t)
   (test (< 5 ?x))
   (test (= 5 ?y))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))
