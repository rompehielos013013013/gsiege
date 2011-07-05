;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo Esca                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Felipe Sanz Morales, 2009
; Basadas en las reglas de Pablo Perez Luna, 2008
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El rey huye de quien tenga al lado
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::huyerey11
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::huyerey12
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::huyerey13
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y1 ?y2))
  (test (= (- ?x2 ?x1) 1))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::huyerey21
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?x1 ?x2) 1))
  (test (= ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::huyerey22
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?x1 ?x2) 1))
  (test (= ?y1 ?y2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
(defrule EQUIPO-A::huyerey23
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?x1 ?x2) 1))
  (test (= ?y1 ?y2))
  
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))


(defrule EQUIPO-A::huyerey31
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::huyerey32
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::huyerey33
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y2 ?y1) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))


(defrule EQUIPO-A::huyerey41
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::huyerey42
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 1) (tiempo ?t))))



(defrule EQUIPO-A::huyerey43
  (declare (salience 75))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= (- ?y1 ?y2) 1))
  (test (= ?x1 ?x2))
  =>
  (assert (mueve (num ?n1) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ficha 6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::mata-6-1-v-2d ;;; vertical
   (declare (salience 76))
   (tiempo ?t)
   (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
   (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
   (test(= ?x ?x2))
   (test(< ?y ?y2))
   (test(= (- ?y2 ?y) 2 ))
   =>
   (printout t "La ficha " ?n " quiere matar! (1v2d)" crlf)
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
   (printout t "La ficha " ?n " quiere matar! (2v2d)" crlf)
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
   (printout t "La ficha " ?n " quiere matar! (1v2d)" crlf)
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
   (printout t "La ficha " ?n " quiere matar! (2v2d)" crlf)
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
   (printout t "La ficha " ?n " quiere matar! (1h2d)" crlf)
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
   (printout t "La ficha " ?n " quiere matar! (2h2d)" crlf)
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
   (printout t "La ficha " ?n " quiere matar! (1h1d)" crlf)
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
   (printout t "La ficha " ?n " quiere matar! (2h1d)" crlf)
   (assert (mueve(num ?n) (mov 2) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; centro del tablero
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::muerde1
	(declare (salience 50))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) )
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (+ ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::muerde2
	(declare (salience 50))
	(ficha (equipo "A")(num ?n)(pos-x ?x1) (pos-y ?y) )
	(ficha (equipo "B") (pos-x ?x2) (pos-y ?y) )
	(tiempo ?t)
	(test (= ?x1 (- ?x2 1)))
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::adefender6
	(declare (salience 45))
	(ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
	(test (< ?y 7))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::adefender5
	(declare (salience 45))
	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
	(test (< ?y 8))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::centrar1
	(declare (salience 44))
	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x 1) (pos-y ?y))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::centrar2
	(declare (salience 44))
	(ficha (equipo "A") (num ?n) (puntos 5) (pos-x 8) (pos-y ?y))
	(tiempo ?t)
=>
	(assert (mueve (num ?n) (mov 2) (tiempo ?t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;To pa lante
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::basica-3
  (declare (salience 22))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-x ?x) (pos-y ?y2&:(= ?y2 (+ ?y 1)))))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))


(defrule EQUIPO-A::basica-1
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (+ ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))


(defrule EQUIPO-A::basica-2
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (not (ficha (equipo "A") (pos-y ?y) (pos-x ?x2&:(= ?x2 (- ?x 1)))))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

