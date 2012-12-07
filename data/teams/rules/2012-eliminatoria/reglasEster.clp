;;Reglas de Gades siege
;;
;;Ester Roy Castillo


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;         Movimientos del rey          ;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;        Huir si enemigo al lado          ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::rey1
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (= ?x2 (+ ?x1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::rey2
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (= ?x2 (+ ?x1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::rey3
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (= ?x2 (+ ?x1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::rey4
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (= ?x2 (- ?x1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::rey5
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (= ?x2 (- ?x1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::rey6
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (= ?x2 (- ?x1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::rey7
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2))
	(test (= ?y2 (- ?y1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::rey8
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2))
	(test (= ?y2 (- ?y1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::rey9
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2))
	(test (= ?y2 (- ?y1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::rey10
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2))
	(test (= ?y2 (+ ?y1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::rey11
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2))
	(test (= ?y2 (+ ?y1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::rey12
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2))
	(test (= ?y2 (+ ?y1 1) ))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;         Movimientos básicos          ;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;        Movimientos iniciales         ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::basico1
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1))
	(test ( and (= ?y1 2) (or(= 2 ?x1)(= 4 ?x1) (= 6 ?x1) (= 8 ?x1) (< ?t 20))))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;        Mover primero los ''4''          ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::basico2
	(declare (salience 25))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
        (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (> ?x1 ?x2)  )
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::basico3
	(declare (salience 26))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
        (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (< ?x1 ?x2))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::basico4
	(declare (salience 24))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(test (> ?y3 ?y1) )
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::basico5
	(declare (salience 23))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 4))
	(not(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1)))
	(ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3))
	(test (< ?y3 ?y1) )
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;       Si matan los dos 4, saco 6        ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::basico6
	(declare (salience 28))
	(tiempo ?t)
	(not(ficha (equipo "A") (num ?n0) (pos-x ?x0) (pos-y ?y0) (puntos 4)))
        (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (> ?x1 ?x2)  )
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::basico7
	(declare (salience 27))
	(tiempo ?t)
	(not(ficha (equipo "A") (num ?n0) (pos-x ?x0) (pos-y ?y0) (puntos 4)))
        (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (< ?x1 ?x2)  )
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::basico8
	(declare (salience 26))
	(tiempo ?t)
	(not(ficha (equipo "A") (num ?n0) (pos-x ?x0) (pos-y ?y0) (puntos 4)))
        (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (< ?y1 ?y2)  )
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::basico9
	(declare (salience 25))
	(tiempo ?t)
	(not(ficha (equipo "A") (num ?n0) (pos-x ?x0) (pos-y ?y0) (puntos 4)))
        (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (> ?y1 ?y2)  )
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::basico10
	(declare (salience 25))
	(tiempo ?t)
	(not(ficha (equipo "A") (num ?n0) (pos-x ?x0) (pos-y ?y0) (puntos 4)))
        (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (< 1 2)  )
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;        Atacar las descubiertas          ;;;;;;
;;;;;;;            cercanas menores             ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque1
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p2 ?p1) (= ?y2 (+ ?y1 1) ) (= ?x1 ?x2) ) )
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::ataque2
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p2 ?p1) (= ?y2 (- ?y1 1) ) (= ?x1 ?x2) ) )
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataque3
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p2 ?p1) (= ?x2 (- ?x1 1) ) (= ?y1 ?y2) ) )
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque4
	(declare (salience 60))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p2 ?p1) (= ?x2 (- ?x1 1) ) (= ?y1 ?y2) ) )
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;        NO atacar las descubiertas       ;;;;;;
;;;;;;;            que sean mayores             ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::huir00
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?y2 (+ ?y1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::huir01
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?y2 (+ ?y1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::huir02
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?y2 (+ ?y1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::huir03
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?y2 (- ?y1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::huir04
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?y2 (- ?y1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::huir05
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x1) (pos-y ?y2) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?y2 (- ?y1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::huir06
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?x2 (+ ?x1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))) 

(defrule EQUIPO-A::huir07
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?x2 (+ ?x1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::huir08
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?x2 (+ ?x1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 

(defrule EQUIPO-A::huir09
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?x2 (- ?x1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t)))) 

(defrule EQUIPO-A::huir010
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?x2 (- ?x1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))) 

(defrule EQUIPO-A::huir011
	(declare (salience 20))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1) (puntos ?p2))
	(test ( and (< ?p1 ?p2) (= ?x2 (- ?x1 1) ) ) )
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;        Si no hay nada que hacer         ;;;;;;
;;;;;;;       ataco lo primero que pille        ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque5
	(declare (salience 10))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (< ?x2 ?x1 ))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque6
	(declare (salience 9))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y1))
	(test (> ?x2 ?x1 ))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque7
	(declare (salience 8))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (< ?y2 ?y1 ))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataque7
	(declare (salience 7))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
	(test (> ?y2 ?y1 ))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;       Evitamos estados en los que       ;;;;;;
;;;;;;;        no se mueve ninguna pieza        ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::nadaquehacer1
	(declare (salience 1))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1))
	(test (< 1 2 ))
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::nadaquehacer2
	(declare (salience 1))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1))
	(test (< 1 2 ))
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::nadaquehacer3
	(declare (salience 1))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1))
	(test (< 1 2 ))
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::nadaquehacer4
	(declare (salience 1))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1))
	(test (< 1 2 ))
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t))))