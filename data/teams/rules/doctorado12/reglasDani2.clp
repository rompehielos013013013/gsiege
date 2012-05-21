;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::basica1
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-A ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y))
 ; (dimension ?dim&:(< ?x (/ ?dim 2)))
  (not (ficha (equipo "A") (pos-x ?x2&:(= ?x2 (+ ?x 1))) (pos-y ?y)))
;  (not (ficha (equipo "A") (pos-x (+ ?x 1)) (pos-y ?y)))
  =>
;  (printout t "EQUIPO-A mueve a" ?n " hacia 1 en t " ?t crlf)
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::basica2
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-A ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y))
; (dimension ?dim&:(> ?x (/ ?dim 2)))
  (not (ficha (equipo "A") (pos-x ?x2&:(= ?x2 (- ?x 1))) (pos-y ?y)))
;  (not (ficha (equipo "A") (pos-x (- ?x 1)) (pos-y ?y)))
  =>
;  (printout t "EQUIPO-A mueve a" ?n " hacia 2 en t " ?t crlf)
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::basica3
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-A ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y))
; (dimension ?dim&:(< ?y (/ ?dim 2)))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
;  (not (ficha (equipo "A") (pos-x ?x) (pos-y (+ ?y 1))))
  =>
;  (printout t "EQUIPO-A mueve a" ?n " hacia 3 en t " ?t crlf)
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::basica4
  (declare (salience 1))
  (tiempo ?t)
;  (not (movido-A ?t))
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y))
; (dimension ?dim&:(> ?y (/ ?dim 2)))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (- ?y 1)))))
;  (not (ficha (equipo "A") (pos-x ?x) (pos-y (- ?y 1))))
  =>
;  (printout t "EQUIPO-A mueve a" ?n " hacia 4 en t " ?t crlf)
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::termina
  (declare (salience 100))
  (tiempo ?t)
  (mueve (tiempo ?t))
  =>
  (pop-focus))


(defrule EQUIPO-A::atacar1
  (declare (salience 20))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1)
  (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2)
  (puntos ?p2) (descubierta 1))
  (test (and (> ?p1 ?p2) (= ?y1 ?y2) (> ?x1 ?x2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))



(defrule EQUIPO-A::atacar2
  (declare (salience 20))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1)
  (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2)
  (puntos ?p2) (descubierta 1))
  (test (and (> ?p1 ?p2) (= ?y1 ?y2) (< ?x1 ?x2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::atacar3
  (declare (salience 20))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1)
  (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2)
  (puntos ?p2) (descubierta 1))
  (test (and (> ?p1 ?p2) (= ?x1 ?x2) (< ?y1 ?y2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::atacar4
  (declare (salience 20))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1)
  (puntos ?p1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2)
  (puntos ?p2) (descubierta 1))
  (test (and (> ?p1 ?p2) (= ?x1 ?x2) (> ?y1 ?y2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::huir1
  (declare (salience 20))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1)
  (puntos 1))
  (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2)
  (puntos 5))
  (test (> ?y1 ?y2))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::despistar
(declare (salience 10))
(ficha (equipo "A") (num 112) (pos-x ?x1) (pos-y ?y1))
(test (< ?y1 4))
(not (ficha (equipo "A") (pos-x ?x1) (pos-y ?y2&:(= ?y2 (+ 1 ?y1)))))
(tiempo ?t)
=>
(assert (mueve (num 112) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::reyparado1
(declare (salience 25))
(ficha (equipo "A") (num 111) (pos-x ?x1) (pos-y ?y1))
(not (ficha (equipo "A") (pos-y ?y1) (pos-x ?x2&:(= ?x2 (+ 1 ?x1)))))
(tiempo ?t)
=>
(assert (mueve (num 111) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::reypara2
(declare (salience 25))
(ficha (equipo "A") (num 111) (pos-x ?x1) (pos-y ?y1))
(not (ficha (equipo "A") (pos-y ?y1) (pos-x ?x2&:(= ?x2 (- ?x1 1)))))
(tiempo ?t)
=>
(assert (mueve (num 111) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::reyesconde1
(declare (salience 20))
(ficha (equipo "A") (num 111) (pos-x ?x1) (pos-y ?y1))
(ficha (equipo "B") (pos-x ?x1) (pos-y ?y2&:(= ?y2 (+ ?y1 1))))
(tiempo ?t)
=>
(assert (mueve (num 111) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::reyesconde2
(declare (salience 20))
(ficha (equipo "A") (num 111) (pos-x ?x1) (pos-y ?y1))
(ficha (equipo "B") (pos-x ?x1) (pos-y ?y2&:(= ?y2 (- ?y1 1))))
(tiempo ?t)
=>
(assert (mueve (num 111) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::reyesconde3
(declare (salience 20))
(ficha (equipo "A") (num 111) (pos-x ?x1) (pos-y ?y1))
(ficha (equipo "B") (pos-y ?y1) (pos-x ?x2&:(= ?x2 (+ ?x1 1))))
(tiempo ?t)
=>
(assert (mueve (num 111) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::reyesconde4
(declare (salience 20))
(ficha (equipo "A") (num 111) (pos-x ?x1) (pos-y ?y1))
(ficha (equipo "B") (pos-y ?y1) (pos-x ?x2&:(= ?x2 (- ?x1 1))))
(tiempo ?t)
=>
(assert (mueve (num 111) (mov 1) (tiempo ?t))))



(defrule EQUIPO-A::atacar6_1
  (declare (salience 50))
  (ficha (equipo "A") (num 128) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (> ?x1 ?x2)))
  (tiempo ?t)
=>
(assert (mueve (num 128) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::atacar6_2
  (declare (salience 50))
  (ficha (equipo "A") (num 128) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (< ?x1 ?x2)))
  (tiempo ?t)
=>
(assert (mueve (num 128) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::atacar6_3
  (declare (salience 50))
  (ficha (equipo "A") (num 128) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (> ?y1 ?y2)))
  (tiempo ?t)
=>
(assert (mueve (num 128) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::atacar6_4
  (declare (salience 50))
  (ficha (equipo "A") (num 128) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (< ?y1 ?y2)))
  (tiempo ?t)
=>
(assert (mueve (num 128) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::atacar6_11
  (declare (salience 55))
  (ficha (equipo "A") (num 128) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= ?x2 (- ?x1 1))))
  (tiempo ?t)
=>
(assert (mueve (num 128) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::atacar6_22
  (declare (salience 56))
  (ficha (equipo "A") (num 128) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= ?x2 (+ ?x1 1))))
  (tiempo ?t)
=>
(assert (mueve (num 128) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::atacar6_33
  (declare (salience 57))
  (ficha (equipo "A") (num 128) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= ?y2 (+ ?y1 1))))
  (tiempo ?t)
=>
(assert (mueve (num 128) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::atacar6_44
  (declare (salience 58))
  (ficha (equipo "A") (num 128) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= ?y2 (- ?y1 1))))
  (tiempo ?t)
=>
(assert (mueve (num 128) (mov 4) (tiempo ?t))))



(defrule EQUIPO-A::atacar4_1
  (declare (salience 30))
  (ficha (equipo "A") (num ?n1)(puntos 4)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (> ?x1 ?x2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::atacar4_2
  (declare (salience 30))
  (ficha (equipo "A") (num ?n1)(puntos 4)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (< ?x1 ?x2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::atacar4_3
  (declare (salience 30))
  (ficha (equipo "A") (num ?n1)(puntos 4)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (> ?y1 ?y2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::atacar4_4
  (declare (salience 30))
  (ficha (equipo "A") (num ?n1)(puntos 4)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (< ?y1 ?y2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::atacar5_1
  (declare (salience 40))
  (ficha (equipo "A") (num ?n1)(puntos 5)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (> ?x1 ?x2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::atacar5_2
  (declare (salience 40))
  (ficha (equipo "A") (num ?n1)(puntos 5)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (< ?x1 ?x2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::atacar5_3
  (declare (salience 40))
  (ficha (equipo "A") (num ?n1)(puntos 5)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (> ?y1 ?y2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::atacar5_4
  (declare (salience 40))
  (ficha (equipo "A") (num ?n1)(puntos 5)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (< ?y1 ?y2)))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::atacar5_11
  (declare (salience 41))
  (ficha (equipo "A") (num ?n1)(puntos 5)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= ?x2 (- ?x1 1))))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::atacar5_22
  (declare (salience 42))
  (ficha (equipo "A") (num ?n1)(puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= ?x2 (+ ?x1 1))))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::atacar5_33
  (declare (salience 43))
  (ficha (equipo "A") (num ?n1)(puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= ?y2 (+ ?y1 1))))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::atacar5_44
  (declare (salience 44))
  (ficha (equipo "A") (num ?n1)(puntos 5) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= ?y2 (- ?y1 1))))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))



(defrule EQUIPO-A::atacar4_11
  (declare (salience 31))
  (ficha (equipo "A") (num ?n1)(puntos 4)(pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= ?x2 (- ?x1 1))))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::atacar4_22
  (declare (salience 32))
  (ficha (equipo "A") (num ?n1)(puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?y1 ?y2) (= ?x2 (+ ?x1 1))))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::atacar4_33
  (declare (salience 33))
  (ficha (equipo "A") (num ?n1)(puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= ?y2 (+ ?y1 1))))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::atacar4_44
  (declare (salience 34))
  (ficha (equipo "A") (num ?n1)(puntos 4) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (and (= ?x1 ?x2) (= ?y2 (- ?y1 1))))
  (tiempo ?t)
=>
(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

