;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Francisco Javier Dávila Delgado 2012
;
;
; Disponible bajo los términos de la GNU 
; General Public License (GPL) version 3 o superior
;

(defrule EQUIPO-A::adelante6
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::mata_drc6
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::mata_izq6
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::mata_delante6
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::mata_detras6
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::busqueda_drc6
  (declare (salience 58))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1)
	 (pos-y ?y1) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2)
	 (pos-y ?y2))
  (test (and (= ?y1 ?y2) (< ?x1 ?x2)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::busqueda_izq6
  (declare (salience 58))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1)
	 (pos-y ?y1) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2)
	 (pos-y ?y2))
  (test (and (= ?y1 ?y2) (> ?x1 ?x2)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

;
; Fichas de 5 puntos
;

(defrule EQUIPO-A::adelante5
  (declare (salience 49))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::mata_drc5
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::mata_izq5
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::mata_delante5
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::mata_detras5
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;
; REY HUYE
;

(defrule EQUIPO-A::huida_rey_der
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; No estamos en ninguno de los bordes (derecho ni izquierdo)
   (test (<> ?xrey  1))
   (test (<> ?xrey  8))

   ;;; Enemigo es detectado a la derecha
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (+ ?xrey  1)))
   )

   ;;; Casilla de la izquierda libre
   (not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey)) 
                         (pos-x ?xblock&:(= ?xblock (- ?xrey  1))))
   )

   ;;; Movimiento a la izquierda
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_der2
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))
     
   ;; No estamos ni en el borde derecho, ni en la fila 8
   (test (<> ?xrey  8))
   (test (<> ?yrey  8))

   ;;; Hay un enemigo a la derecha del rey
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (+ ?xrey  1)))
   )

   ;;; Izquierda ocupada, delante libre
;   (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey)) 
;                         (pos-x ?xblock&:(= ?xblock (- ?xrey  1)))
;   )

   (not (ficha (num ?n4) (pos-y ?yblock2&:(= ?yblock2 (+ ?yrey  1))) 
                         (pos-x ?xblock2&:(= ?xblock2 ?xrey)))
   )

   ;;; Movimiento hacia delante
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_izq
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; No estamos al límite a la derecha ni en el borde de la izquierda
   (test (<> ?xrey  8))
   (test (<> ?xrey  1))

   ;;; Un enemigo es detectado a la izquierda
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (- ?xrey  1)))
   )

   ;;; Casilla de la derecha libre
   ;(not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey)) 
   ;                      (pos-x ?xblock&:(= ?xblock (+ ?xrey  1))))
   ;)


   ;;; Movimiento hacia la derecha
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_izq2
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;; Ni en el borde izquierdo ni en la última fila
   (test (<> ?xrey  1))
   (test (<> ?yrey  8))

   ;;; Un enemigo es detectado a la izquierda
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (- ?xrey  1)))
   )

   ;;; Derecha ocupada, delante libre
;   (ficha (num ?n3)  (pos-y ?yblock&:(= ?yblock ?yrey)) 
;                     (pos-x ?xblock&:(= ?xblock (+ ?xrey  1)))
;   )

   (not (ficha (num ?n4) (pos-y ?yblock2&:(= ?yblock2 (+ ?yrey  1))) 
                         (pos-x ?xblock2&:(= ?xblock2 ?xrey)))
   )

   ;;; Movimiento hacia delante
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_delante
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; No estamos en el límite a la derecha ni en la última fila
   (test (<> ?xrey  8))
   (test (<> ?yrey  8))

   ;;; Enemigo delante del rey detectado
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy (+ 1 ?yrey))) 
                                 (pos-x ?xenemy&:(= ?xenemy ?xrey))
   )

   ;;; Hueco a la derecha
   (not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey)) 
                         (pos-x ?xblock&:(= ?xblock (+ ?xrey  1)))
   ))

   ;;; Movimiento a la derecha
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_delante2
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; Si no estamos en el límite izquierdo ni en la última fila.
   (test (<> ?xrey  1))
   (test (<> ?yrey  8))

   ;;; Detectamos un enemigo delante del rey
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy (+ ?yrey  1))) 
                                 (pos-x ?xenemy&:(= ?xenemy ?xrey))
   )

   ;;; Si la izquierda está libre. 
   (not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey)) 
                         (pos-x ?xblock&:(= ?xblock (- ?xrey  1)))
   ))


   ;;; Mover hacia izq.
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_delante3
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; Si no estamos en la fila 1 ni en la última
   (test (<> ?yrey  1))
   (test (<> ?yrey  8))

   ;;; Detectamos un enemigo delante del rey
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy (+ ?yrey  1))) 
                                 (pos-x ?xenemy&:(= ?xenemy ?xrey))
   )

   ;;; Si atrás está libre. 
   (not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock (- ?yrey  1))) 
                         (pos-x ?xblock&:(= ?xblock ?xrey ))
   ))

   ;;; Mover hacia atrás.
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_detras
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; Si no estamos en la fila 1 ni en la última fila
   (test (<> ?yrey  1))
   (test (<> ?yrey  8))

   ;;; Detectamos un enemigo detrás del rey
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy (- ?yrey  1))) 
                                 (pos-x ?xenemy&:(= ?xenemy ?xrey))
   )

   ;;; Si delante está libre. 
   (not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock (+ ?yrey  1))) 
                         (pos-x ?xblock&:(= ?xblock ?xrey ))
   ))
   
   ;;; Mover hacia delante.
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_detras2
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; Si no estamos en la fila 1
   (test (<> ?yrey  1))
   ;;; Ni estamos pegados a la izquierda.
   (test (<> ?xrey  1))

   ;;; Detectamos un enemigo detrás del rey
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy (- ?yrey  1))) 
                                 (pos-x ?xenemy&:(= ?xenemy ?xrey))
   )

   ;;; Si izquierda está libre. 
   (not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey )) 
                         (pos-x ?xblock&:(= ?xblock (- ?xrey  1)))
   ))
   
   ;;; Mover hacia izquierda.
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_detras2
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; Si no estamos en la fila 1
   (test (<> ?yrey  1))
   ;;; Ni estamos pegados a la derecha.
   (test (<> ?xrey  8))

   ;;; Detectamos un enemigo detrás del rey
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy (- ?yrey  1))) 
                                 (pos-x ?xenemy&:(= ?xenemy ?xrey))
   )

   ;;; Si la derecha está libre. 
   (not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey )) 
                         (pos-x ?xblock&:(= ?xblock (+ ?xrey  1)))
   ))
   
   ;;; Mover hacia izquierda.
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

;;;; Mantener el rey todo lo atrás posible.
(defrule EQUIPO-A::huida_rey_atras
   (declare (salience 78))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;; Si no está en la linea 1
   (test (<> ?yrey  1)) 

   ;;; Libre atrás
   (not (ficha (num ?n2)  (pos-y ?yenemy&:(= ?yenemy (- ?yrey  1)))
                          (pos-x ?xenemy&:(= ?xenemy ?xrey ))
   ))


   ;;; Libre a la izquierda atrás de enemigos
   (not (ficha (equipo "B") (num ?n3) 
                                 (pos-y ?yenemy1&:(= ?yenemy1 (- ?yrey  1)))
                                 (pos-x ?xenemy1&:(= ?xenemy1 (- ?xrey  1)))
   ))

   ;;; Libre a la derecha atrás de enemigos
   (not (ficha (equipo "B") (num ?n4) 
                                 (pos-y ?yenemy2&:(= ?yenemy2 (- ?yrey  1)))
                                 (pos-x ?xenemy2&:(= ?xenemy2 (+ ?xrey  1)))
   ))

  ;;; Libre atrás-atrás de enemigos.
   (not (ficha (equipo "B") (num ?n4) 
                                 (pos-y ?yenemy2&:(= ?yenemy2 (- ?yrey  2)))
                                 (pos-x ?xenemy2&:(= ?xenemy2 ?xrey))
   ))
   
   ;;; Mover hacia atrás.
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;; Mov generico
