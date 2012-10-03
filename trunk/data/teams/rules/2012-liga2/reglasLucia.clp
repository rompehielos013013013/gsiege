;Reglas:
;;;;;;;;;;;;;;;;;;;;Lucía Batista Flores;;;;;;;;;;;;;;;;


;;;;;;;;;;Movimiento Básicos;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::subir
  (declare (salience 31))
  (tiempo ?t)
  (ficha (equipo "A") (num ?nsub) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  =>
  (assert (mueve (num ?nsub) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::drcha
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?ndrch) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  =>
  (assert (mueve (num ?ndrch) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::izqda
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?nizq) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
  =>
  (assert (mueve (num ?nizq) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;Movimientos de los 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::movimientocincos
(declare (salience 29))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n5) (pos-x ?x5) (pos-y ?y5) (puntos 5)) 
  
  (test (< ?y5 6))
  =>
  (assert (mueve (num ?n5) (mov 3) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;Movimientos de los 4 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::movimientocuatros
(declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n4) (pos-x ?x4) (pos-y ?y4) (puntos 4))

  (test  (< ?y4 6))
  =>
  (assert (mueve (num ?n4) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;Esquivar_enemigo;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::esquivar_arriba
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?narriba) (pos-x ?x1) (pos-y ?y) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y))
	(test (or (=  (+ ?x2 1) ?x1) (= (- ?x2 1) ?x1 )))
	=>
	(assert (mueve (num ?narriba) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::esquivar_abajo
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?nabajo) (pos-x ?x1) (pos-y ?y2) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x2) (pos-y ?y2))
	(test (or (=  (+ ?x2 1) ?x1) (= ?x1 (- ?x2 1))))
	=>
	(assert (mueve (num ?nabajo) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::esquivar_drcha
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?ndrch) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x) (pos-y ?y2))
	(test (or (=  (+ ?y2 1) ?y1) (= (- ?y2 1)?y1 )))
	=>
	(assert (mueve (num ?ndrch) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::esquivar_izq
	(declare (salience 75))
	(tiempo ?t)
	(ficha (equipo "A") (num ?nizq) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B")  (pos-x ?x1) (pos-y ?y2))
	(test (or (=  (+ ?y2 1) ?y1) (=  (- ?y2 1) ?y1)))
	=>
	(assert (mueve (num ?nizq) (mov 2) (tiempo ?t)))) 


;;;;;;;;;;;;;;;;;;Acercamientos_enemigo;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defrule EQUIPO-A::acercamiento_subir
	(declare (salience 65))
	(ficha (equipo "A") (num ?nasub) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(tiempo ?t)
	(test (> ?p1 ?p2))
	(test (> ?y2 ?y1))
	(test (not(= ?p1 1)))  
=>
	(assert (mueve (num ?nasub) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::acercamiento_bajar
	(declare (salience 63))
	(ficha (equipo "A") (num ?nabaj) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2) (puntos ?p2))
	(tiempo ?t)
	(test (> ?p1 ?p2))
	(test (< ?y2 ?y1))	
=>
	(assert (mueve (num ?nabaj) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::acercamiento_der
	(declare (salience 64))
	(ficha (equipo "A") (num ?nacerder) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(tiempo ?t)
	(test (> ?p1 ?p2))
	(test (> ?x2 ?x1))
	(test (not(= ?p1 1)))  
=>
	(assert (mueve (num ?nacerder) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;Intento ataque;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::intento_ataque_izq
	(declare (salience 50))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(test (= ?x1 (+ ?x2 1)))
	(test (not(= ?p1 1)))    
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::intento_ataque_der
	(declare (salience 50))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(tiempo ?t)
	(test (= ?x1 (- ?x2 1)))
	(test (not(= ?p1 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::intento_ataque_arriba
	(declare (salience 51))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (= ?y1 (- ?y2 1)))
	(test (not(= ?p1 1)))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::intento_ataque_
	(declare (salience 49))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (= ?y1 (+ ?y2 1)))
	(test (not(= ?p1 1)))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Buscar_victimas;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::victimas_izq
	(declare (salience 44))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(tiempo ?t)
	(test(and (not(= ?p1 1)) (< ?p1 4) (> ?p1 1) ))
	
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::victimas_der
	(declare (salience 44))
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y))
	(tiempo ?t)
	(test (not(= ?p1 1)))
	(test (< ?p1 4))
	(test (> ?p1 1))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::victimas_arriba
	(declare (salience 45))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (not(= ?p1 1)))
	(test (< ?p1 4))
	(test (> ?p1 1))
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::victimas_abajo
	(declare (salience 43))
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (pos-x ?x) (pos-y ?y2))
	(tiempo ?t)
	(test (not(= ?p1 1)))
	(test (< ?p1 4))
	(test (> ?p1 1))
=>
	(assert (mueve (num ?n) (mov 4) (tiempo ?t))))


;;;;;;;;;;;;;;;;Huir_si_ficha_sola;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::huir_izq
	(declare (salience 39))
	(ficha (equipo "A") (num ?nhizq) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(test (> ?x1 ?x2))
=>
	(assert (mueve (num ?nhizq) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::huir_dercha
	(declare (salience 39))
	(ficha (equipo "A") (num ?nhder) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(tiempo ?t)
	(test (> ?x2 ?x1))
=>
	(assert (mueve (num ?nhder) (mov 1) (tiempo ?t))))




