
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;               Antonio 'ToNinja' Ruso                ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;                       REGLAS                        ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;                 Movimientos triviales               ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::derecha
   (declare (salience 4))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 1) (< ?x 8)))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))
   
(defrule EQUIPO-A::izquierda
   (declare (salience 3))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 1) (> ?x 1)))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))
   
(defrule EQUIPO-A::arriba
   (declare (salience 5))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 1) (< ?y 8)))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))
   
(defrule EQUIPO-A::abajo
   (declare (salience 2))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 1) (> ?y 1)))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t))))
   
   
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;                  Movimientos del 3                  ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::derecha_3
   (declare (salience 12))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 2) (< ?x 8)))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))   
   
(defrule EQUIPO-A::izquierda_3
   (declare (salience 11))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 2) (> ?x 1)))
   =>
   (printout t "REGLA: izquierda_med  :  " "  t = " ?t "  n = " ?n "  x = " ?x "  y = " ?y "  p = " ?p crlf)
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))
   
(defrule EQUIPO-A::arriba_3
   (declare (salience 13))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 2) (< ?y 8)))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))
   
(defrule EQUIPO-A::abajo_3
   (declare (salience 6))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 2) (> ?y 1)))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t))))
   
   
   
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;                 Movimientos del 6                   ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   
   
(defrule EQUIPO-A::derecha_6
   (declare (salience 42))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 5) (< ?x 8)))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))
   
   
(defrule EQUIPO-A::izquierda_6
   (declare (salience 41))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 5) (> ?x 1)))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))
   
(defrule EQUIPO-A::arriba_6
   (declare (salience 44))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (tiempo ?t)
   (test (and (> ?p1 5) (< ?y1 8)))
   (test (> ?y2 6))
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
   
(defrule EQUIPO-A::abajo_6
   (declare (salience 9))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (> ?p 5) (> ?y 1)))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t))))
   

   
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;                 Movimientos del 5                   ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   
   
(defrule EQUIPO-A::derecha_5
   (declare (salience 38))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (= ?p 5) (< ?x 8)))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))
   
(defrule EQUIPO-A::izquierda_5
   (declare (salience 37))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (= ?p 5) (> ?x 1)))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))
   
(defrule EQUIPO-A::arriba_5
   (declare (salience 39))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (= ?p 5) (< ?y 8)))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))
   
(defrule EQUIPO-A::abajo_5
   (declare (salience 8))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (= ?p 5) (> ?y 1)))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t))))
   

   
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;                 Movimientos del 4                   ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   
   
(defrule EQUIPO-A::derecha_4
   (declare (salience 34))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (= ?p 4) (< ?x 8)))
   =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t))))
   
   
(defrule EQUIPO-A::izquierda_4
   (declare (salience 33))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (= ?p 4) (> ?x 1)))
   =>
   (assert (mueve (num ?n) (mov 2) (tiempo ?t))))
   
(defrule EQUIPO-A::arriba_4
   (declare (salience 35))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (= ?p 4) (< ?y 8)))
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))
   
(defrule EQUIPO-A::abajo_4
   (declare (salience 7))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (and (= ?p 4) (> ?y 1)))
   =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t))))
   

   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;                 Preparar defensa                    ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   
(defrule EQUIPO-A::prepara_5
   (declare (salience 80))
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 2) (puntos 5))
   (tiempo ?t)
   =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t))))
   


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;            Artillería pesada (a ciegas)             ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::arriesga_der
   (declare (salience 53))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 0))
   (tiempo ?t)
   (test (and (= ?y1 ?y2) (= (+ ?x1 1) ?x2)))
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
   
   
(defrule EQUIPO-A::arriesga_izq
   (declare (salience 52))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 0))
   (tiempo ?t)
   (test (and (= ?y1 ?y2) (= (- ?x1 1) ?x2)))
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
      
      
(defrule EQUIPO-A::arriesga_arriba
   (declare (salience 51))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 0))
   (tiempo ?t)
   (test (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2)))
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
   
   
(defrule EQUIPO-A::arriesga_abajo
   (declare (salience 50))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 0))
   (tiempo ?t)
   (test (and (= ?x1 ?x2) (= (- ?y1 1) ?y2)))
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;            Artillería pesada (a matar)              ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::revienta_der
   (declare (salience 58))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (tiempo ?t)
   (test (and (and (= ?y1 ?y2) (= (+ ?x1 1) ?x2)) (> ?p1 ?p2)))
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
   
   
(defrule EQUIPO-A::revienta_izq
   (declare (salience 57))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (tiempo ?t)
   (test (and (and (= ?y1 ?y2) (= (- ?x1 1) ?x2)) (> ?p1 ?p2)))
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
      
      
(defrule EQUIPO-A::revienta_arriba
   (declare (salience 56))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (tiempo ?t)
   (test (and (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2)) (> ?p1 ?p2)))
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
   
   
(defrule EQUIPO-A::revienta_abajo
   (declare (salience 55))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (tiempo ?t)
   (test (and (and (= ?x1 ?x2) (= (- ?y1 1) ?y2)) (> ?p1 ?p2)))
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;             No dejes que te sobrepasen              ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::buscar_der
   (declare (salience 46))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1) (descubierta ?d1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta ?d2))
   (tiempo ?t)
   (test (and (= ?y1 ?y2) (< ?x1 ?x2)))
   (test (or (and (= ?d2 1) (> ?p1 ?p2)) (= ?d2 0)))
   (test (> ?p1 2))
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
   
   
(defrule EQUIPO-A::buscar_izq
   (declare (salience 45))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1) (descubierta ?d1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta ?d2))
   (tiempo ?t)
   (test (and (= ?y1 ?y2) (> ?x1 ?x2)))
   (test (or (and (= ?d2 1) (> ?p1 ?p2)) (= ?d2 0)))
   (test (> ?p1 2))
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
      
   
   
(defrule EQUIPO-A::buscar_abajo
   (declare (salience 43))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1) (descubierta ?d1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta ?d2))
   (tiempo ?t)
   (test (> ?y1 ?y2))
   (test (or (and (= ?d2 1) (> ?p1 ?p2)) (= ?d2 0)))
   (test (> ?y1 6))
   (test (> ?p1 2))
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;                Cuida de tus mayores                 ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;               Huye a sitio amenazado                ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::porpatas_der
   (declare (salience 70))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (or (and (= (- ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2)) (and (= ?x1 ?x2) (= (- ?y1 1) ?y2)))))
   (test (not (and (= (+ ?x1 1) ?x) (= ?y1 ?y))))
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
   
(defrule EQUIPO-A::porpatas_izq
   (declare (salience 70))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (or (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2)) (and (= ?x1 ?x2) (= (- ?y1 1) ?y2)))))
   (test (not (and (= (- ?x1 1) ?x) (= ?y1 ?y))))
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
   
(defrule EQUIPO-A::porpatas_arriba
   (declare (salience 70))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (or (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= (- ?x1 1) ?x2) (= ?y1 ?y2)) (and (= ?x1 ?x2) (= (- ?y1 1) ?y2)))))
   (test (not (and (= ?x1 ?x) (= (+ ?y1 1) ?y))))
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
   
(defrule EQUIPO-A::porpatas_abajo
   (declare (salience 70))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (or (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= (- ?x1 1) ?x2) (= ?y1 ?y2)) (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2)))))
   (test (not (and (= ?x1 ?x) (= (- ?y1 1) ?y))))
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))
   
   
   
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;              Huye a sitio sin amenanza              ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defrule EQUIPO-A::porpatas_der2
   (declare (salience 76))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (or (and (= (- ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2)) (and (= ?x1 ?x2) (= (- ?y1 1) ?y2)))))
   (test (not (and (= (+ ?x1 1) ?x) (= ?y1 ?y))))
   (test
      (not
         (or
            (and
               (= (- ?x1 1) ?x)
               (= ?y1 ?y)
            )
            (or
               (and
                  (= ?x1 ?x)
                  (= (+ ?y1 1) ?y)
               )
               (and
                  (= ?x1 ?x)
                  (= (- ?y1 1) ?y)
               )
            )
         )
      )
   )
   =>
   (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
   
(defrule EQUIPO-A::porpatas_izq2
   (declare (salience 77))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (or (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2)) (and (= ?x1 ?x2) (= (- ?y1 1) ?y2)))))
   (test (not (and (= (- ?x1 1) ?x) (= ?y1 ?y))))
   (test (not (or (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2)) (and (= ?x1 ?x2) (= (- ?y1 1) ?y2))))))
   =>
   (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))
   
(defrule EQUIPO-A::porpatas_arriba2
   (declare (salience 78))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (or (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= (- ?x1 1) ?x2) (= ?y1 ?y2)) (and (= ?x1 ?x2) (= (- ?y1 1) ?y2)))))
   (test (not (and (= ?x1 ?x) (= (+ ?y1 1) ?y))))
   (test (not (or (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= (- ?x1 1) ?x2) (= ?y1 ?y2)) (and (= ?x1 ?x2) (= (- ?y1 1) ?y2))))))
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
   
(defrule EQUIPO-A::porpatas_abajo2
   (declare (salience 79))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (ficha (equipo "B") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
   (tiempo ?t)
   (test (or (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= (- ?x1 1) ?x2) (= ?y1 ?y2)) (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2)))))
   (test (not (and (= ?x1 ?x) (= (- ?y1 1) ?y))))
   (test (not (or (and (= (+ ?x1 1) ?x2) (= ?y1 ?y2)) (or (and (= (- ?x1 1) ?x2) (= ?y1 ?y2)) (and (= ?x1 ?x2) (= (+ ?y1 1) ?y2))))))
   =>
   (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))
   
   


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                                     ;;;
;;;                Controla a su killer                 ;;;
;;;                                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::killer_localizado
   (declare (salience 79))
   (ficha (equipo "A") (num ?nrey) (pos-x ?xrey) (pos-y ?yrey) (puntos 1))
   (ficha (equipo "A") (num ?n1) (pos-x ?x1) (pos-y ?y1) (puntos ?p1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
   (tiempo ?t)
   (test (and (= (+ ?yrey 1) ?y1) (= ?xrey ?x1)))
   (test (> ?p2 3))
   (test (or (and (= ?y2 ?yrey) (or (= (+ ?xrey 2) ?x2) (= (- ?xrey 2) ?x2))) (and (= (+ ?yrey 1) ?y2) (or (= (+ ?xrey 1) ?x2) (= (- ?xrey 1) ?x2)))))
   =>
   (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
   
   


