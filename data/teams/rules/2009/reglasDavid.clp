;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; David Mariscal Martínez
;
;


; inicio

(defrule EQUIPO-A::FuerteAlante1Rey
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
  (test (and (= ?y 2) (= ?y1 1)))
  =>
  (printout t "El más fuerte saca ")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))
)



(defrule EQUIPO-A::ReyAtrasDeFuerte
  (declare (salience 78))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y 3) (= ?y1 1)))
  =>
 (printout t "rey cubriendose saque ")
  (assert (mueve (num ?n1) (mov 3) (tiempo ?t))))
)


(defrule EQUIPO-A::cincoalante
  (declare (salience 76))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "A") (num ?n1) (puntos 1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y 2) (= ?y1 2)))
  =>
 (printout t "rey cubriendose saque ")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))
)


;;defensa 5

(defrule EQUIPO-A::DefensacincoIzquierda
  (declare (salience 77))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x (+ 1 ?x1))))
  =>
 (printout t "defens 5 ataque izquierdo")
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensacincoderecha
  (declare (salience 77))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x1 (+ 1 ?x))))
  =>
 (printout t "defens 5 ataque derecha")
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

)

(defrule EQUIPO-A::Defensacincoabajo
  (declare (salience 77))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y1 (+ 1 ?y))))
  =>
 (printout t "defens 5 ataque abajo")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensacincoarriba
  (declare (salience 77))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y (+ 1 ?y1))))
  =>
 (printout t "defens 5 ataque arriba")
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

)

;;defensa 4


(defrule EQUIPO-A::DefensacuatroIzquierda
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x (+ 1 ?x1))))
  =>
 (printout t "defens 4 ataque izquierdo")
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensacuatroderecha
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x1 (+ 1 ?x))))
  =>
 (printout t "defens 4 ataque derecha")
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

)

(defrule EQUIPO-A::Defensacuatroabajo
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y1 (+ 1 ?y))))
  =>
 (printout t "defens 4 ataque abajo")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensacuatroarriba
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 4) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y (+ 1 ?y1))))
  =>
 (printout t "defens 4 ataque arriba")
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

)


;; ataca 6

(defrule EQUIPO-A::AtacaFuerteAlante
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (< ?y ?y1) (= ?x ?x1)))
  =>
 (printout t "atacaaa fuertee arriba")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

)

(defrule EQUIPO-A::AtacaFuerteDerecha
  (declare (salience 29))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (< ?x ?x1) (= ?y ?y1)))
  =>
 (printout t "atacaaa fuertee derecha ")
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

)

(defrule EQUIPO-A::AtacaFuerteizquierda
  (declare (salience 28))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (> ?x ?x1) (= ?y ?y1)))
  =>
 (printout t "atacaaa fuertee  izquierda ")
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

)

(defrule EQUIPO-A::AtacaFuerteabajo
  (declare (salience 28))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (> ?y ?y1)))
  =>
 (printout t "atacaaa fuertee  abajo ")
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

)


;; ataque 3

(defrule EQUIPO-A::Tresalabordaje
  (declare (salience 5))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  =>
  (printout t "tres al abordage")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)



;;; defensa 3



(defrule EQUIPO-A::DefensatresIzquierda
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x (+ 1 ?x1))))
  =>
 (printout t "defens 3 ataque izquierdo")
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensatresderecha
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x1 (+ 1 ?x))))
  =>
 (printout t "defens 3 ataque derecha")
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

)

(defrule EQUIPO-A::Defensatresabajo
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y1 (+ 1 ?y))))
  =>
 (printout t "defens 3 ataque abajo")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensatresarriba
  (declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y (+ 1 ?y1))))
  =>
 (printout t "defens 3 ataque arriba")
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

)

;;defensa 1

(defrule EQUIPO-A::Defensaunoabajo
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y1 (+ 1 ?y))))
  =>
 (printout t "defens 1 arriba rey")
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

)

(defrule EQUIPO-A::Defensaunoarriba
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y (+ 1 ?y1))))
  =>
 (printout t "defens 1 abajo rey")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensaunoderecha
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x1 (+ 1 ?x))))
  =>
 (printout t "defens 1 izquierda rey")
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensaunoizquierda
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 1) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x (+ 1 ?x1))))
  =>
 (printout t "defens 1 izquierda rey")
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

)

;;; peones abordage



(defrule EQUIPO-A::Peonesalabordaje
  (declare (salience 3))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  =>
  (printout t "Peon al abordage")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;;; defensa 6



(defrule EQUIPO-A::DefensaseisIzquierda
  (declare (salience 31))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x (+ 1 ?x1))))
  =>
 (printout t "defens 6 ataque izquierdo")
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensaseisderecha
  (declare (salience 31))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x1 (+ 1 ?x))))
  =>
 (printout t "defens 6 ataque derecha")
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

)

(defrule EQUIPO-A::Defensaseisabajo
  (declare (salience 31))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y1 (+ 1 ?y))))
  =>
 (printout t "defens 6 ataque abajo")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensaseisarriba
  (declare (salience 31))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y (+ 1 ?y1))))
  =>
 (printout t "defens 6 ataque arriba")
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

)


;;; defensa peon



(defrule EQUIPO-A::DefensapeonIzquierda
  (declare (salience 4))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x (+ 1 ?x1))))
  =>
 (printout t "defens 2 ataque izquierdo")
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensapeonderecha
  (declare (salience 4))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?y ?y1) (= ?x1 (+ 1 ?x))))
  =>
 (printout t "defens 2 ataque derecha")
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

)

(defrule EQUIPO-A::Defensapeonabajo
  (declare (salience 4))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y1 (+ 1 ?y))))
  =>
 (printout t "defens 2 ataque abajo")
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

)


(defrule EQUIPO-A::Defensapeonarriba
  (declare (salience 4))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n1) (puntos ?p1) (pos-x ?x1) (pos-y ?y1))
   (test (and (= ?x ?x1) (= ?y (+ 1 ?y1))))
  =>
 (printout t "defens 2 ataque arriba")
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

)




