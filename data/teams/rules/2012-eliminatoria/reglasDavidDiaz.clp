

;=============================================================
; Reglas básicas de Inteligencia Artificial para el equipo A
;=============================================================

; David Diaz Garcia, 2011
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior


;--------------------------------------------------------------------------
; El rey huye de cualquier ficha enemiga que tenga al lado
; Las reglas de huida se ejecutan con MÁXIMA PRIORIDAD
;--------------------------------------------------------------------------

  ; Si el rey tiene una ficha enemiga enfrente o detras de el, huye
  ; hacia la decrecha si puede

(defrule EQUIPO-A::huirDrcha
	(declare (salience 1000))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t)))) 


  ; Si el rey tiene una ficha enemiga enfrente o detras de el, huye
  ; hacia la izquierda si puede

(defrule EQUIPO-A::huirIzqda
	(declare (salience 1000))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (= ?y1 (+ ?y2 1)) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t)))) 


  ; Si el rey tiene una ficha enemiga a la izquierda o derecha de el, huye
  ; hacia la arriba si puede

(defrule EQUIPO-A::huirArriba
	(declare (salience 1000))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 


  ; Si el rey tiene una ficha enemiga a la izquierda o derecha de el, huye
  ; hacia abajo si puede

(defrule EQUIPO-A::huirAbajo
	(declare (salience 100))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 


;--------------------------------------------------------------------------
; Reglas para atacar con las fichas 5 y 6
;-------------------------------------------------------------------------- 

  ; Ataque ciego a cualquier ficha no descubierta

(defrule EQUIPO-A::ataqueDrcha
	(declare (salience 90))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(test (and (> ?p1 4) (= ?x1 (+ ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataqueIzqda
	(declare (salience 90))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(test (and (> ?p1 4) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataqueAbajo
	(declare (salience 90))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(test (and (> ?p1 4) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ataqueArriba
	(declare (salience 90))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(test (and (> ?p1 4) (= ?y1 (+ ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))  


(defrule EQUIPO-A::persigueDrcha
	(declare (salience 81))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(test (and (> ?p1 4) (< ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::persigueIzqda
	(declare (salience 81))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(test (and (> ?p1 4) (> ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::persigueArriba
	(declare (salience 81))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(test (and (> ?p1 4) (< ?y1 ?y2)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 


(defrule EQUIPO-A::persigueAbajo
	(declare (salience 82))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(test (and (> ?p1 4) (> ?y1 ?y2)))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 


  ; Las fichas numero 5 mueven hacia arriba (pueden llegar hasta el borde)
  ; siempre y cuando no tengan una ficha al lado que comer.

(defrule EQUIPO-A::moverArriba5
	(declare (salience 80))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p))
	(test (and (= ?p 5) (< ?y1 8)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

  ; Las ficha numero 6 mueven hacia arriba (puede llegar hasta la penultima fila)
  ; siempre y cuando no tenga una ficha al lado que comer.

(defrule EQUIPO-A::moverArriba6
	(declare (salience 81))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p))
	(test (and (= ?p 6) (< ?y1 7)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))



; A continuacion, las mismas reglas que las enteriores pero para las
; fichas pequenyas

(defrule EQUIPO-A::ataqueDrchaP
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(test (and (> ?p1 1) (= ?x1 (+ ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataqueIzqdaP
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(test (and (> ?p1 1) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataqueAbajoP
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?y1 (- ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ataqueArribaP
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(test (and (> ?p1 1) (= ?y1 (+ ?y2 1))))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))  



(defrule EQUIPO-A::persigueDrchaP
	(declare (salience 12))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(test (and (> ?p1 1) (< ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::persigueIzqdaP
	(declare (salience 12))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(test (and (> ?p1 1) (> ?x1 ?x2)))
	=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::persigueArribagP
	(declare (salience 11))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(test (and (> ?p1 1) (< ?y1 ?y2)))
	=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t)))) 


(defrule EQUIPO-A::persigueAbajoP
	(declare (salience 13))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(test (and (> ?p1 1) (> ?y1 ?y2)))
	=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t)))) 

