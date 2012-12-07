;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  para el equipo Manuel Romero                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Manuel Romero Pino, 2012
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El 1 huye si esta amenazado
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; esquiva obstaculo si soy equipo A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::esq_obs_der
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(obstaculo (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x2 4) (= ?y2 4) (= ?y2 (+ ?y1 1)) (= ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::esq_obs_izq
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(obstaculo (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x2 4) (= ?y2 4) (= ?y2 (+ ?y1 1)) (= ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::esq_obs_arriba
	(declare (salience 15))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(obstaculo (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x2 4) (= ?y2 4) (= ?y1 ?y2) (or(= ?x2(+ ?x1 1))(= ?x2(- ?x1 1)))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::esq_obs_abajo
	(declare (salience 15))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(obstaculo (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x2 4) (= ?y2 4) (= ?y1 ?y2) (or(= ?x2(+ ?x1 1))(= ?x2(- ?x1 1)))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; esquiva obstaculo si soy equipo B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::esq_obs_derB
	(declare (salience 78))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(obstaculo (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x2 5) (= ?y2 5) (= ?y2 (+ ?y1 1)) (= ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::esq_obs_izqB
	(declare (salience 78))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p))
	(obstaculo (pos-x ?x2) (pos-y ?y2))
	(test (and (= ?x2 5) (= ?y2 5) (= ?y2 (+ ?y1 1)) X(= ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Atacar fichas descubiertas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::atacarizq
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(tiempo ?t)	
	(test (and (> ?p1 ?p2) (= ?y1 ?y2) (> ?x1 ?x2)))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::atacardrcha
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(tiempo ?t)	
	(test (and (> ?p1 ?p2) (= ?y1 ?y2) (< ?x1 ?x2)))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::atacararriba
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(tiempo ?t)	
	(test (and (> ?p1 ?p2) (< ?y1 ?y2) (= ?x1 ?x2)))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::atacarabajo
	(declare (salience 40))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
	(tiempo ?t)	
	(test (and (> ?p1 ?p2) (> ?y1 ?y2) (= ?x1 ?x2)))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movi. 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
; Movimientos 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::5adelante
	(declare (salience 60))
	(ficha (equipo "A")(num ?n1)(pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B")(num ?n2)(pos-x ?x2) (pos-y ?y2) (puntos ?p))	
	(tiempo ?t)
	(not(ficha (puntos 6)))
	(test (or (= ?y2 (+ ?y1 1))
		(= ?y2 (+ ?y1 2)) 
		(= ?y2 (+ ?y1 3)) 
		(= ?y2 (+ ?y1 4)) 
		(= ?y2 (+ ?y1 5)) 
		(= ?y2 (+ ?y1 6)) 
		(= ?y2 (+ ?y1 7))))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::5atras
	(declare (salience 59))
	(ficha (equipo "A")(num ?n1)(pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B")(num ?n2)(pos-x ?x2) (pos-y ?y2) (puntos ?p))
	(tiempo ?t)
	(not (ficha (puntos 6)))	
	(test (or (= ?y2 (- ?y1 1))
		(= ?y2 (- ?y1 2)) 
		(= ?y2 (- ?y1 3)) 
		(= ?y2 (- ?y1 4)) 
		(= ?y2 (- ?y1 5)) 
		(= ?y2 (- ?y1 6)) 
		(= ?y2 (- ?y1 7))))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque5izq
	(declare (salience 62))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(not (ficha (puntos 6)))	
	(tiempo ?t)
	(test (and (= ?y1 ?y2) (> ?x1 ?x2) ))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque5der
	(declare (salience 61))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(tiempo ?t)
	(not (ficha (puntos 6)))
	(test (and (= ?y1 ?y2) (< ?x1 ?x2) ))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimientos 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::4adelante
	(declare (salience 60))
	(ficha (equipo "A")(num ?n1)(pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B")(num ?n2)(pos-x ?x2) (pos-y ?y2) (puntos ?p))	
	(tiempo ?t)
	(not(ficha (puntos 5)))
	(test (or (= ?y2 (+ ?y1 1))
		(= ?y2 (+ ?y1 2)) 
		(= ?y2 (+ ?y1 3)) 
		(= ?y2 (+ ?y1 4)) 
		(= ?y2 (+ ?y1 5)) 
		(= ?y2 (+ ?y1 6)) 
		(= ?y2 (+ ?y1 7))))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::4atras
	(declare (salience 59))
	(ficha (equipo "A")(num ?n1)(pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B")(num ?n2)(pos-x ?x2) (pos-y ?y2) (puntos ?p))
	(tiempo ?t)
	(not (ficha (puntos 5)))	
	(test (or (= ?y2 (- ?y1 1))
		(= ?y2 (- ?y1 2)) 
		(= ?y2 (- ?y1 3)) 
		(= ?y2 (- ?y1 4)) 
		(= ?y2 (- ?y1 5)) 
		(= ?y2 (- ?y1 6)) 
		(= ?y2 (- ?y1 7))))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque4izq
	(declare (salience 62))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(not (ficha (puntos 5)))	
	(tiempo ?t)
	(test (and (= ?y1 ?y2) (> ?x1 ?x2) ))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque4der
	(declare (salience 61))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(tiempo ?t)
	(not (ficha (puntos 5)))
	(test (and (= ?y1 ?y2) (< ?x1 ?x2) ))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimientos 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::3adelante
	(declare (salience 60))
	(ficha (equipo "A")(num ?n1)(pos-x ?x1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B")(num ?n2)(pos-x ?x2) (pos-y ?y2) (puntos ?p))	
	(tiempo ?t)
	(not(ficha (puntos 4)))
	(test (or (= ?y2 (+ ?y1 1))
		(= ?y2 (+ ?y1 2)) 
		(= ?y2 (+ ?y1 3)) 
		(= ?y2 (+ ?y1 4)) 
		(= ?y2 (+ ?y1 5)) 
		(= ?y2 (+ ?y1 6)) 
		(= ?y2 (+ ?y1 7))))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::3atras
	(declare (salience 59))
	(ficha (equipo "A")(num ?n1)(pos-x ?x1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B")(num ?n2)(pos-x ?x2) (pos-y ?y2) (puntos ?p))
	(tiempo ?t)
	(not (ficha (puntos 4)))	
	(test (or (= ?y2 (- ?y1 1))
		(= ?y2 (- ?y1 2)) 
		(= ?y2 (- ?y1 3)) 
		(= ?y2 (- ?y1 4)) 
		(= ?y2 (- ?y1 5)) 
		(= ?y2 (- ?y1 6)) 
		(= ?y2 (- ?y1 7))))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ataque 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque3izq
	(declare (salience 62))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(not (ficha (puntos 4)))	
	(tiempo ?t)
	(test (and (= ?y1 ?y2) (> ?x1 ?x2) ))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque3der
	(declare (salience 61))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 3))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(tiempo ?t)
	(not (ficha (puntos 4)))
	(test (and (= ?y1 ?y2) (< ?x1 ?x2) ))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Movimientos 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::2kamikazeadelante
	(declare (salience 31))
	(ficha (equipo "A")(num ?n1)(pos-x ?x1) (pos-y ?y1) (puntos 2))
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

(defrule EQUIPO-A::2kamikazeatras
	(declare (salience 30))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
	(tiempo ?t)
	(test (or (= ?y2 (- ?y1 1))
		(= ?y2 (- ?y1 2)) 
		(= ?y2 (- ?y1 3)) 
		(= ?y2 (- ?y1 4)) 
		(= ?y2 (- ?y1 5)) 
		(= ?y2 (- ?y1 6)) 
		(= ?y2 (- ?y1 7))))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::2kamikazeizq
	(declare (salience 33))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(tiempo ?t)
	(test (and (= ?y1 ?y2) (> ?x1 ?x2)))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::2kamikazeder
	(declare (salience 32))
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 2))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))	
	(tiempo ?t)
	(test (and (= ?y1 ?y2) (< ?x1 ?x2)))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

