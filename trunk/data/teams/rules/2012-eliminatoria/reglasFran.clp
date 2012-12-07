(defrule EQUIPO-A::ficha-6-muerta
   (declare (salience 80))
   (not(ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6)))
   => 
   ;(printout t "La ficha " ?n " esta muerta" crlf)
   (assert (ficha_6_muerta))
)

(defrule EQUIPO-A::fichas-5-muertas
   (declare (salience 80))
   (not(ficha (equipo "A")  (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5)))
   =>
   (assert (fichas_5_muertas))
)



(defrule EQUIPO-A::adelanta-6-1
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 2) (puntos 6))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-6-2
  (declare (salience 49))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 3) (puntos 6))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-5-1
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 2) (puntos 5))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-5-2
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 3) (puntos 5))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::mata-6-1-v-2d ;;; vertical
   (declare (salience 76))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(< ?y ?y2))
   (test(= (- ?y2 ?y) 2 ))
   =>
   (assert (mueve(num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mata-6-2-v-2d ;;; vertical
   (declare (salience 76))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(> ?y ?y2))
   (test(= (- ?y ?y2) 2 ))
   =>
   (assert (mueve(num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::mata-6-1-v-1d ;;; vertical
   (declare (salience 77))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(< ?y ?y2))
   (test(= (- ?y2 ?y) 1 ))
   =>
   (assert (mueve(num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::mata-6-2-v-1d ;;; vertical
   (declare (salience 77))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(> ?y ?y2))
   (test(= (- ?y ?y2) 1 ))
   =>
   (assert (mueve(num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::mata-6-1-h-2d ;;; horizontal
   (declare (salience 70))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(< ?x ?x2))
   (test(= ?y ?y2))
   (test(<= (- ?x2 ?x) 2 ))
   =>
   (assert (mueve(num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::mata-6-2-h-2d ;;; horizontal
   (declare (salience 70))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(> ?x ?x2))
   (test(= ?y ?y2))
   (test(<= (- ?x ?x2) 2 ))
   =>
      (assert (mueve(num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::mata-6-1-h-1d ;;; horizontal
   (declare (salience 75))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(< ?x ?x2))
   (test(= ?y ?y2))
   (test(<= (- ?x2 ?x) 1 ))
   =>
      (assert (mueve(num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::mata-6-2-h-1d ;;; horizontal
   (declare (salience 75))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(> ?x ?x2))
   (test(= ?y ?y2))
   (test(<= (- ?x ?x2) 1 ))
   =>
      (assert (mueve(num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::mata-6-d-1 ;;;;;;;;;;;;;;;;;;;;;; ABAJO IZQUIERDA
   (declare (salience 65))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(> ?x ?x2))
   (test(> ?y ?y2))
   (test(and(=(- ?x ?x2) 1)(= (- ?y ?y2) 1)))
   => 
   (assert (mueve(num ?n) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::mata-6-d-2 ;;;;;;;;;;;;;;;;;;;;;;;;;; ABAJO DERECHA
   (declare (salience 70))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(< ?x ?x2))
   (test(> ?y ?y2)) ;;; Arriba izquierda
   (test(and(=(- ?x2 ?x) 1)(= (- ?y ?y2) 1)))
   => 
      (assert (mueve(num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::mata-6-d-3 ;;;;;;;;;;;;;;;;;;;;;;;;;;; ARRIBA IZQUIERDA
   (declare (salience 69))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(> ?x ?x2))
   (test(< ?y ?y2))
   (test(and(=(- ?x ?x2) 1)(= (- ?y2 ?y) 1)))
   => 
   (assert (mueve(num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::mata-6-d-4 ;;;;;;;;;;;;;;;;;;;;;;;;; ARRIBA DERECHA
   (declare (salience 69))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(< ?x ?x2))
   (test(< ?y ?y2))
   (test(and(=(- ?x2 ?x) 1)(= (- ?y2 ?y) 1)))
   => 
   (assert (mueve(num ?n) (mov 3) (tiempo ?t))))
   
   


(defrule EQUIPO-A::localizado-v1-3d ;;; vertical
   (declare (salience 50))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(< ?y ?y2))
   (test(= (- ?y2 ?y) 3 ))
   =>
     (assert (mueve(num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::localizado-v2-3d ;;; vertical
   (declare (salience 50))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(> ?y ?y2))
   (test(= (- ?y ?y2) 3 ))
   =>
      (assert (mueve(num ?n) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::ataque-lejano-6-h-1
   (declare (salience 30))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(< ?x ?x2))
   (test(= ?y ?y2))
   =>
   (assert (mueve(num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque-lejano-6-h-2
   (declare (salience 30))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(> ?x ?x2))
   (test(= ?y ?y2))
   =>
   (assert (mueve(num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque-lejano-6-v-1
   (declare (salience 30))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(> ?y ?y2))
   =>
   (assert (mueve(num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ataque-lejano-6-v-2
   (declare (salience 30))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(< ?y ?y2))
   =>
   (assert (mueve(num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::6-ciego-1
   (declare (salience 29))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
   (test (<> ?p 6))
   (test(< ?x ?x2))
   (test(<> ?y ?y2))
   =>
   (assert (mueve(num ?n) (mov 1) (tiempo ?t) ))
)
   
(defrule EQUIPO-A::6-ciego-2
   (declare (salience 29))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
   (test (<> ?p 6))
   (test(> ?x ?x2))
   (test(<> ?y ?y2))
   =>
   (assert (mueve(num ?n) (mov 2) (tiempo ?t) ))
)



(defrule EQUIPO-A::6-obstruido-izq-1 ;;; Con esta nos movemos si hay bloqueo
   (declare (salience 69))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(<> ?x 1))
   (test(= 1 (- ?y2 ?y)))
   (test(= ?x ?x2))
   =>
   (assert(mueve(num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::6-obstruido-dch-1
   (declare (salience 70))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= 1 (- ?y2 ?y)))
   (test(= ?x ?x2))
   (test(<> ?x 8))
   =>
   (assert(mueve(num ?n) (mov 1) (tiempo ?t) )))


(defrule EQUIPO-A::rastreando-izq ;;; Controla que no se acerque ninguna ficha enemiga
   (declare (salience 77))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(> ?x ?x2)) ; Se acerca por la izquierda
   (test(< ?y ?y2))
   (test(< (- ?y2 ?y) 2)) ;Esta a dos en vertical
   (test(< (- ?x ?x2) 2))
   =>
   (assert (mueve(num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataca-barrido-izq
   (declare (salience 78))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y)(puntos ?p))
   (test (= (- ?x ?x2) 1) )
   (test (>= ?p 5))
   =>
   (assert (mueve(num ?n) (mov 2) (tiempo ?t))))
   
(defrule EQUIPO-A::rastreando-dch ;;; Controla que no se acerque ninguna ficha enemiga
   (declare (salience 77))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(< ?x ?x2)) ; Se acerca por la derecha
   (test(< ?y ?y2))
   (test(< (- ?y2 ?y) 2)) ;Esta a dos en vertical
   (test(< (- ?x2 ?x) 2))
   =>
   (assert (mueve(num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataca-barrido-dcha
   (declare (salience 77))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y)(puntos ?p))
   (test (= (- ?x2 ?x) 1) )
   (test (>= ?p 5))
   =>
   (assert (mueve(num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::pos-original-izq-1
   (declare (salience 65))
   (tiempo ?t)
   (ficha (equipo "A") (num A123) (pos-x ?x) (pos-y ?y) (puntos 5))
   (test (= ?y 4))
   (test (< ?x 3))
   =>
   (assert (mueve(num A123) (mov 1) (tiempo ?t))))
   
(defrule EQUIPO-A::pos-original-izq-2
   (declare (salience 65))
   (tiempo ?t)
   (ficha (equipo "A") (num A123) (pos-x ?x) (pos-y ?y) (puntos 5))
   (test (= ?y 4))
   (test (> ?x 3))
   =>
   (assert (mueve(num A123) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::pos-original-dch-1
   (declare (salience 65))
   (tiempo ?t)
   (ficha (equipo "A") (num A127) (pos-x ?x) (pos-y ?y) (puntos 5))
   (test (= ?y 4))
   (test (> ?x 7))
   =>
   (assert (mueve(num A127) (mov 2) (tiempo ?t))))
   
(defrule EQUIPO-A::pos-original-dch-2
   (declare (salience 65))
   (tiempo ?t)
   (ficha (equipo "A") (num A127) (pos-x ?x) (pos-y ?y) (puntos 5))
   (test (= ?y 4))
   (test (> ?x 7))
   =>
   (assert (mueve(num A127) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::ficha-5-ataque-v-1-1d
   (declare (salience 67))
   (tiempo ?t)
   (ficha_6_muerta)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(< ?y ?y2))
   ;(test(= (- ?y2 ?y) 1 ))
   =>
   (assert (mueve(num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ficha-5-ataque-v-2-1d
   (declare (salience 67))
   (tiempo ?t)
   (ficha_6_muerta)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(> ?y ?y2))
   ;(test(= (- ?y ?y2) 1 ))
   =>
   (assert (mueve(num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::ficha-5-ataque-h-1-1d
   (declare (salience 65))
   (tiempo ?t)
   (ficha_6_muerta)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(< ?x ?x2))
   (test(= ?y ?y2))
   ;(test(<= (- ?x2 ?x) 1 ))
   =>
   (assert (mueve(num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ficha-5-ataque-h-2-1d
   (declare (salience 65))
   (tiempo ?t)
   (ficha_6_muerta)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(> ?x ?x2))
   (test(= ?y ?y2))
   ;(test(<= (- ?x ?x2) 1 ))
   =>
   (assert (mueve(num ?n) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::adelanta-4
  (declare (salience 68))
  (tiempo ?t)
  (ficha_6_muerta)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (test(<= ?y 5))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-3
  (declare (salience 68))
  (tiempo ?t)
  (ficha_6_muerta)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (test(<= ?y 5))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-4-2
  (declare (salience 40))
  (tiempo ?t)
  (ficha_6_muerta)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-3-2
  (declare (salience 40))
  (tiempo ?t)
  (ficha_6_muerta)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  =>
 
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-4-2-h-1
  (declare (salience 40))
  (tiempo ?t)
  (ficha_6_muerta)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (test (> ?x 5))
  =>
 
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-4-2-h-2
  (declare (salience 40))
  (tiempo ?t)
  (ficha_6_muerta)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (test (> ?x 5))
  =>
 
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-3-2-h-1
  (declare (salience 40))
  (tiempo ?t)
  (ficha_6_muerta)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (test (> ?x 5))
  =>
 
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::adelanta-3-2-h-2
  (declare (salience 40))
  (tiempo ?t)
  (ficha_6_muerta)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (test (> ?x 5))
  =>
 
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)
;;A correr!!!;;

(defrule EQUIPO-A::rey-escapa-r-1
   (declare (salience 79))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(< ?x ?x2))
   (test(= ?y ?y2))
   (test(<= (- ?x2 ?x) 2 ))
   =>
   (assert (mueve(num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::rey-escapa-r-2
   (declare (salience 79))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(< ?x ?x2))
   (test(= ?y ?y2))
   (test(<= (- ?x2 ?x) 2 ))
   =>
   (assert (mueve(num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::rey-escapa-l-1
   (declare (salience 79))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(> ?x ?x2))
   (test(= ?y ?y2))
   (test(<= (- ?x ?x2) 2 ))
   =>
   (assert (mueve(num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::rey-escapa-l-2
   (declare (salience 79))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(> ?x ?x2))
   (test(= ?y ?y2))
   (test(<= (- ?x ?x2) 2 ))
   =>
   (assert (mueve(num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::rey-escapa-u-1
   (declare (salience 79))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(< ?y ?y2))
   (test(<= (- ?x ?x2) 2 ))
   =>
   (assert (mueve(num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::rey-escapa-u-2
   (declare (salience 79))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(< ?y ?y2))
   (test(<= (- ?x ?x2) 2 ))
   =>
   (assert (mueve(num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::rey-escapa-d-1
   (declare (salience 79))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(> ?y ?y2))
   (test(<= (- ?x ?x2) 2 ))
   =>
   (assert (mueve(num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::rey-escapa-d-2
   (declare (salience 79))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(> ?y ?y2))
   (test(<= (- ?x ?x2) 2 ))
   =>
   (assert (mueve(num ?n) (mov 2) (tiempo ?t)))
)


