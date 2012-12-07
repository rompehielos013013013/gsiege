;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Adrián Cepillo Macías 2010
;
;
; Disponible bajo los términos de la GNU 
; General Public License (GPL) version 3 o superior
;

(defrule EQUIPO-A::palante6
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::MataDrcha6
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::MataIzqda6
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::MataDelante6
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::MataDetras6
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::buscaIzq6
  (declare (salience 58))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1)
	 (pos-y ?y1) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2)
	 (pos-y ?y2))
  (test (and (= ?y1 ?y2) (> ?x1 ?x2)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::buscaDer6
  (declare (salience 58))
  (ficha (equipo "A") (num ?n1) (pos-x ?x1)
	 (pos-y ?y1) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2)
	 (pos-y ?y2))
  (test (and (= ?y1 ?y2) (< ?x1 ?x2)))
  (tiempo ?t)
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

					;
; Otras fichas
; 5 puntos

(defrule EQUIPO-A::palante5
  (declare (salience 49))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (test (<> ?y 8))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::MataDrcha5
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::MataIzqda5
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::MataDelante5
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::MataDetras5
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;;;;
; HUIDA REY JAVIER S
;;;

(defrule EQUIPO-A::huida_rey_der
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; Si no estamos en el borde izquierdo ni el derecho.
   (test (<> ?xrey  1))
   (test (<> ?xrey  8))

   ;;; Detectamos un enemigo a la derecha del rey.
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (+ ?xrey  1)))
   )

   ;;; Si no está ocupada la casilla de la izquierda
   (not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey)) 
                         (pos-x ?xblock&:(= ?xblock (- ?xrey  1))))
   )

   ;;; Mover izquierda.
   =>
   (printout t "enemigo a la derecha, huir izquierda" crlf)
   (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_der2
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))
     
   ;; NO estamos en el borde derecho ni en la fila 8.
   (test (<> ?xrey  8))
   (test (<> ?yrey  8))

   ;;; Detectamos un enemigo a la derecha del rey.
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (+ ?xrey  1)))
   )

   ;;; Si la izquierda está ocupada pero la de delante no.
;   (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey)) 
;                         (pos-x ?xblock&:(= ?xblock (- ?xrey  1)))
;   )

   (not (ficha (num ?n4) (pos-y ?yblock2&:(= ?yblock2 (+ ?yrey  1))) 
                         (pos-x ?xblock2&:(= ?xblock2 ?xrey)))
   )

   ;;; Mover hacia delante.
   =>
   (printout t "enemigo a la derecha, huir delante" crlf)
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_izq
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; Si no estamos en el límite de la derecha ni en el borde izquierdo
   (test (<> ?xrey  8))
   (test (<> ?xrey  1))

   ;;; Detectamos un enemigo a la izquierda del rey.
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (- ?xrey  1)))
   )

   ;;; Si no está ocupada la casilla de la derecha
   ;(not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey)) 
   ;                      (pos-x ?xblock&:(= ?xblock (+ ?xrey  1))))
   ;)


   ;;; Mover derecha.
   =>
   (printout t "enemigo a la izquierda , huir derecha" crlf)
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_izq2
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;; Si no estamos en el borde izquierdo ni en la última fila
   (test (<> ?xrey  1))
   (test (<> ?yrey  8))

   ;;; Detectamos un enemigo a la izquierda del rey.
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (- ?xrey  1)))
   )

   ;;; Si la derecha está ocupada pero la de delante no.
;   (ficha (num ?n3)  (pos-y ?yblock&:(= ?yblock ?yrey)) 
;                     (pos-x ?xblock&:(= ?xblock (+ ?xrey  1)))
;   )

   (not (ficha (num ?n4) (pos-y ?yblock2&:(= ?yblock2 (+ ?yrey  1))) 
                         (pos-x ?xblock2&:(= ?xblock2 ?xrey)))
   )

   ;;; Mover hacia delante.
   =>
   (printout t "enemigo a la izquierda , huir delante" crlf)
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::huida_rey_delante
   (declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))

   ;;; Si no estamos en el límite derecho ni en la última fila.
   (test (<> ?xrey  8))
   (test (<> ?yrey  8))

   ;;; Detectamos un enemigo delante del rey
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy (+ 1 ?yrey))) 
                                 (pos-x ?xenemy&:(= ?xenemy ?xrey))
   )

   ;;; Si la derecha está libre. 
   (not (ficha (num ?n3) (pos-y ?yblock&:(= ?yblock ?yrey)) 
                         (pos-x ?xblock&:(= ?xblock (+ ?xrey  1)))
   ))

   ;;; Mover hacia der.
   =>
   (printout t "enemigo delante, huir derecha" crlf)
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
   (printout t "enemigo delante, huir izquierda" crlf)
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
   (printout t "enemigo delante, huir atrás" crlf)
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
   (printout t "enemigo detras, huir delante" crlf)
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
   (printout t "enemigo detras, huir izquierda" crlf)
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
   (printout t "enemigo detras, huir derecha" crlf)
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
   (printout t "mantener rey atrás" crlf)
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;; Mov generico

