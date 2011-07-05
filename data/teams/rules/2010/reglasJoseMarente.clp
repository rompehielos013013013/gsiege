;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; José Jesús Marente Florín
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;
;; HUIDA DEL REY
;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defrule EQUIPO-A::HuirReyDerecha
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos 1) )
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) )
	(test (= ?x1 ?x2))
	(test (or (= ?y1 (+ ?y2 1) ) (= ?y1 (- ?y2 1) ) ))
	
	(ficha (equipo "B") (pos-x ?x3) (pos-y ?y3) )
	
	;;Que ninguna otra ficha coja al rey desprevenido
	(test (and (<> ?x3 (+ ?x1 1) ) (<> ?y3 (+ ?y1 1)) ) ) 
	(test (and (<> ?x3 (+ ?x1 1) ) (<> ?y3 (- ?y1 1)) ) ) 
	(test (<> ?x3 (+ ?x1 2) ) ) 
	
	=>
	
	(assert (mueve (num ?n) (mov 1) (tiempo ?t) ))
)

(defrule EQUIPO-A::HuirReyIzquierda
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))
	(test (= ?x1 ?x2))
	(test (or (= ?y1(+ ?y2 1)) (= ?y1(- ?y2 1)) ))
	
	(ficha (equipo "B") (pos-x ?x3) (pos-y ?y3) )
	
	;;Que ninguna otra ficha coja al rey desprevenido
	(test (and (<> ?x3 (- ?x1 1) ) (<> ?y3 (+ ?y1 1)) ) ) 
	(test (and (<> ?x3 (- ?x1 1) ) (<> ?y3 (- ?y1 1)) ) ) 
	(test (<> ?x3 (- ?x1 2) ) ) 
	
	=>
	
	(assert (mueve (num ?n) (mov 2) (tiempo ?t) ))
)

(defrule EQUIPO-A::HuirReyArriba
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos 1) )
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) )	
	(test (= ?y1 ?y2))
	(test (or (= ?x1 (+ ?x2 1) ) (= ?x1 (- ?x2 1) ) ))
	
	(ficha (equipo "B") (pos-x ?x3) (pos-y ?y3) )
	
	;;Que ninguna otra ficha coja al rey desprevenido
	(test (and (<> ?x3 (- ?x1 1) ) (<> ?y3 (+ ?y1 1)) ) ) 
	(test (and (<> ?x3 (+ ?x1 1) ) (<> ?y3 (+ ?y1 1)) ) ) 
	(test (<> ?y3 (+ ?y1 2) ) ) 
	
	=>
	
	(assert (mueve (num ?n) (mov 3) (tiempo ?t) ))
)

(defrule EQUIPO-A::HuirReyAbajo
	(declare (salience 79))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y1) (puntos 1))
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2))	
	(test (= ?y1 ?y2))
	(test (or (= ?x1 (+ ?x2 1)) (= ?x1 (- ?x2 1) )))
	;;(test (> ?y1 1))
	
	(ficha (equipo "B") (pos-x ?x3) (pos-y ?y3) )
	
	;;Que ninguna otra ficha coja al rey desprevenido
	(test (and (<> ?x3 (- ?x1 1) ) (<> ?y3 (- ?y1 1)) ) ) 
	(test (and (<> ?x3 (+ ?x1 1) ) (<> ?y3 (- ?y1 1)) ) ) 
	(test (<> ?y3 (- ?y1 2) ) ) 
		
	=>
	
	(assert (mueve (num ?n) (mov 4) (tiempo ?t) ))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FORMAMOS BARRERA 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Adelantamos al 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::AdelantarSeis1
	(declare (salience 70))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-y 2) (puntos 6))
		
	=>
	
	(assert (mueve (num ?n) (mov 3) (tiempo ?t) ))
)

(defrule EQUIPO-A::AdelantarSeis2
	(declare (salience 69))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-y 3) (puntos 6))
		
	=>
	
	(assert (mueve (num ?n) (mov 3) (tiempo ?t) ))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hacemos una barrera DE 5.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::AdelantarCinco1
  (declare (salience 68))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-y 2) (puntos 5))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::AdelantarCinco2
  (declare (salience 66))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-y 3) (puntos 5))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hacemos una barrera de 4.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::AdelantarCuatro1
	(declare (salience 67))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-y 2) (puntos 4))
		
	=>
	
	(assert (mueve (num ?n) (mov 3) (tiempo ?t) ))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COMENZAMOS ATAQUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATAQUES 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; No hay a que atacar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Si no vemos a nadie para atacar seguimos subimos
(defrule EQUIPO-A::MoverSeisArriba
	(declare (salience 29))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 6))
	(test(< ?y 8))
	
	=>
	
	(assert (mueve (num ?n) (mov 3) (tiempo ?t) ))
)

;;Si no vemos a nadie para atacar vamos a la izquierda
(defrule EQUIPO-A::MoverSeisIzquierda
	(declare (salience 29))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (puntos 6))
	(test(> ?x 1))
	
	=>
	
	(assert (mueve (num ?n) (mov 2) (tiempo ?t) ))
)

;;Si no vemos a nadie para atacar vamos uno abajo
(defrule EQUIPO-A::MoverSeisAbajo
	(declare (salience 30))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (puntos 6))
	(test(= ?x 1))
	
	=>
	
	(assert (mueve (num ?n) (mov 4) (tiempo ?t) ))
)


;;Si no vemos a nadie para atacar vamos a la derecha
(defrule EQUIPO-A::MoverSeisDerecha
	(declare (salience 31))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	(test (and (< ?x 8) (= ?y 7) ))
	
	=>
	
	(assert (mueve (num ?n) (mov 1) (tiempo ?t) ))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Atacar verticalmente
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::SeisAtacarVerticalArriba1
	(declare (salience 59))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (- ?y2 1)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarVerticalArriba2
	(declare (salience 58))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (- ?y2 2)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarVerticalArriba3
	(declare (salience 57))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (- ?y2 3)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarVerticalAbajo1
	(declare (salience 59))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (+ ?y2 1)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarVerticalAbajo2
	(declare (salience 58))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (+ ?y2 2)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarVerticalAbajo3
	(declare (salience 57))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (+ ?y2 3)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t) ))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Atacar horizontalmente
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::SeisAtacarHorizontalDerecha1
	(declare (salience 56))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (- ?x2 1)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarHorizontalDerecha2
	(declare (salience 55))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (- ?x2 2)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarHorizontalDerecha3
	(declare (salience 54))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (- ?x2 3)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarHorizontalIzquierda1
	(declare (salience 56))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (+ ?x2 1)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarHorizontalIzquierda2
	(declare (salience 55))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (+ ?x2 2)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t) ))
)

(defrule EQUIPO-A::SeisAtacarHorizontalIzquierda3
	(declare (salience 54))
	(tiempo ?t)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 6))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (+ ?x2 3)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t) ))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; El seis muere asi que el cinco se pone a repartir
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::MuereSeis
   (declare (salience 80))
   (not(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6)))
   => 
   (assert (MuereSeis))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATAQUES 5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; No hay a que atacar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Si no vemos a nadie para atacar seguimos subimos
(defrule EQUIPO-A::MoverCincoArriba
	(declare (salience 29))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n) (pos-y ?y) (puntos 5))
	(test(< ?y 8))
	
	=>
	
	(assert (mueve (num ?n) (mov 3) (tiempo ?t) ))
)

;;Si no vemos a nadie para atacar vamos a la izquierda
(defrule EQUIPO-A::MoverCincoIzquierda
	(declare (salience 29))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (puntos 5))
	(test(> ?x 1))
	
	=>
	
	(assert (mueve (num ?n) (mov 2) (tiempo ?t) ))
)

;;Si no vemos a nadie para atacar vamos uno abajo
(defrule EQUIPO-A::MoverCincoAbajo
	(declare (salience 30))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (puntos 5))
	(test(= ?x 1))
	
	=>
	
	(assert (mueve (num ?n) (mov 4) (tiempo ?t) ))
)


;;Si no vemos a nadie para atacar vamos a la derecha
(defrule EQUIPO-A::MoverCincoDerecha
	(declare (salience 31))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
	(test (and (< ?x 8) (= ?y 7) ))
	
	=>
	
	(assert (mueve (num ?n) (mov 1) (tiempo ?t) ))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Atacar verticalmente
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::CincoAtacarVerticalArriba1
	(declare (salience 50))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2) (pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (- ?y2 1)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarVerticalArriba2
	(declare (salience 49))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (- ?y2 2)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarVerticalArriba3
	(declare (salience 48))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (- ?y2 3)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarVerticalAbajo1
	(declare (salience 50))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (+ ?y2 1)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarVerticalAbajo2
	(declare (salience 49))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (+ ?y2 2)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarVerticalAbajo3
	(declare (salience 48))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x) (pos-y ?y1) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x) (pos-y ?y2))
	;;(test (= ?x1 ?x2))
	(test (= ?y1 (+ ?y2 3)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t) ))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Atacar horizontalmente
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::CincoAtacarHorizontalDerecha1
	(declare (salience 47))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (- ?x2 1)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarHorizontalDerecha2
	(declare (salience 46))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (- ?x2 2)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarHorizontalDerecha3
	(declare (salience 45))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (- ?x2 3)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarHorizontalIzquierda1
	(declare (salience 47))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (+ ?x2 1)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarHorizontalIzquierda2
	(declare (salience 46))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (+ ?x2 2)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t) ))
)

(defrule EQUIPO-A::CincoAtacarHorizontalIzquierda3
	(declare (salience 45))
	(tiempo ?t)
	(MuereSeis)
	(ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y) (puntos 5))
	(ficha (equipo "B") (num ?n2)(pos-x ?x2) (pos-y ?y))
	(test (= ?x1 (+ ?x2 3)))
	
	=>
	
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t) ))
)
