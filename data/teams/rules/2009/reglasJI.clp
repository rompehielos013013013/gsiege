;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Jose Ignacio Mateo Cruzado
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;¿Borde?;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::activar_borde 
(declare (salience 76))
	(ficha (equipo "A") (pos-x ?x) (pos-y 8) (puntos 6) (num ?n))
	(not(bs))
=>
	(printout t "Ha llegado al borde superior" crlf)
	(assert (bs))
)


(defrule EQUIPO-A::desactivar_borde
(declare (salience 76))
	
	(ficha (equipo "A") (pos-x ?x) (pos-y 1) (puntos 6) (num ?n))
	?a<-(bs)
=>
	(printout t "Quitar borde superior" crlf)
	(retract ?a)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Borde;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;¿Mano Derecha fallece?;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::manoderecha
(declare (salience 77))
(tiempo ?t)
(not (ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n)))
=>
(printout t "La mano derecha ha muerto" crlf)
(assert (manoderecha))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Mano Dercha;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;¿Guardia Real fallece?;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::guardiareal
(declare (salience 71))
(tiempo ?t)
(not (ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 5) (num ?n)))
=>
(printout t "La guardia ha muerto" crlf)
(assert (guardiareal))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Guardia Real;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;¿Batallon fallece?;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::batallon
(declare (salience 66))
(tiempo ?t)
(not (ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 4) (num ?n)))
=>
(printout t "Batallon aniquilado" crlf)
(assert (batallon))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Batallon;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;¿Escuadron fallece?;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::equipo3
(declare (salience 61))
(tiempo ?t)
(not (ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 3) (num ?n)))
=>
(printout t "Escuadron aniquilado" crlf)
(assert (escuadron))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Escuadron;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;¿Conejillos muertos?;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::conejillosmuertos ;;; Los conejillos de india murieron por nada
	(declare (salience 50))
	(tiempo ?t)
  (not (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 2)))

=>
 	(printout t "Ya no quedan conejillos de india" crlf)
	(assert (conejillosmuertos))
)


(defrule EQUIPO-A::conejillosextraviados 
	(declare (salience 61))
	(not(conejillosmuertos))
	(tiempo ?t)
        (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 2))
=>
 	(printout t "conejillos extraviados" crlf)
	(assert (conejillosmuertos))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Conejillos;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;Zona Critica;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::zona_critica
(declare (salience 80))
(tiempo ?t)
(ficha (equipo "A") (pos-x 8) (pos-y 1) (puntos 1) (num ?n1))
(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
(test(< ?y2 3))
(not(fuga))
=>
(printout t "el rey se da a la fuga::EQUIPO-A" crlf)
(assert (fuga))
)

(defrule EQUIPO-A::fuga
(declare (salience 79))
(tiempo ?t)
(ficha (equipo "A") (pos-x 8) (pos-y ?y) (puntos 1) (num ?n1))
(test(< ?y 3))
(fuga)
=>
(printout t "el rey se da a la fuga::EQUIPO-A" crlf)
(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::fuera_5
(declare (salience 78))
(tiempo ?t)
(ficha (equipo "A") (pos-x 8) (pos-y ?y) (puntos 5) (num ?n1))
(test(< ?y 5))
(fuga)
=>
(printout t "quitar el 5::EQUIPO-A" crlf)
(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::desactivar_fuga
(declare (salience 80))
(tiempo ?t)
(ficha (equipo "B") (pos-x ?x) (pos-y y) (num ?n))
(test(> ?y 3))
?a<-(fuga)
=>
(printout t "A salvo" crlf)
(retract ?a)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Zona Critica;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;Prioridad;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::prioridad_6
(declare (salience 74))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
(ficha (equipo "B") (pos-x ?x3) (pos-y ?y3) (num ?n3))
(test(> ?x2 ?x))
(test(< ?x3 ?x))
(and((test(= ?y2 ?y)) (test(= ?y3 ?y))))
(test(< ?x2-?x ?x-?x3))
=>
(printout t "priorida_derecha::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::prioridad_7
(declare (salience 74))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
(ficha (equipo "B") (pos-x ?x3) (pos-y ?y3) (num ?n3))
(test(> ?x2 ?x))
(test(< ?x3 ?x))
(and((test(= ?y2 ?y)) (test(= ?y3 ?y))))
(test(> ?x2-?x ?x-?x3))
=>
(printout t "priorida_izquierda::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 2) (tiempo ?t))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Prioridad;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;Ataque Mano derecha;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::amuerte_adelante_6
(declare (salience 72))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
(test(> ?y2 ?y))
(not(bs))
(not(fuga))
=>
(printout t "a_muerte_adelante_6::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::amuerte_derecha_6
(declare (salience 73))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) )
(and (test(< ?x ?x2)) (test(= ?y2 ?y)))
(not(fuga))
=>
(printout t "a_muerte_derecha_6::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::amuerte_izquierda_6
(declare (salience 73))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x1) (pos-y ?y1) )
(and (test(> ?x ?x1)) (test(= ?y1 ?y)))
(not(fuga))
=>
(printout t "a_muerte_izquierda_6::EQUIPO-A")
(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::amuerte_atras_6
(declare (salience 75))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) )
(not(fuga))
(test(< ?y2 ?y))
=>
(printout t "a_muerte_abajo_6::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Ataque Mano derecha;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;Aniquilacion Mano derecha;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::captura_adelante_6
(declare (salience 73))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
(test(> ?y2 ?y))
(not(bs))
(fuga)
=>
(printout t "captura_adelante_6::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::captura_derecha_6
(declare (salience 75))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) )
(and (test(< ?x ?x2)) (test(= ?y2 ?y)))
(fuga)
=>
(printout t "captura_derecha_6::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::captura_izquierda_6
(declare (salience 74))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x1) (pos-y ?y1) )
(and (test(> ?x ?x1)) (test(= ?y1 ?y)))
(fuga)
=>
(printout t "captura_izquierda_6::EQUIPO-A")
(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::captura_atras_6
(declare (salience 72))
(tiempo ?t)
(ficha (equipo "A") (pos-x ?x) (pos-y ?y) (puntos 6) (num ?n))
(ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) )
(test(< ?y2 ?y))
(fuga)
=>
(printout t "captura_abajo_6::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Aniquilacion Mano derecha;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Ataque Guardia Real;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque_arriba_5 
  (declare (salience 68))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(> ?y2 ?y))
  (test(< ?y 8))
  (manoderecha)
(not(fuga))
=>
(printout t "a_muerte_arriba_5::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_izquierda_5 
  (declare (salience 69))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(< ?x2 ?x)) (test(= ?y2 ?y)))
  (manoderecha)
(not(fuga))
=>
(printout t "a_muerte_izquierda_5::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_derecha_5 
  (declare (salience 69))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(> ?x2 ?x)) (test(= ?y2 ?y)))
  (manoderecha)
(not(fuga))
=>
(printout t "a_muerte__derecha_5::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_abajo_5 
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(< ?y2 ?y)) 
  (manoderecha)
  (not(fuga))
=>
(printout t "a_muerte_abajo_5::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Ataque Guardia Real;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Aniquilacion Guardia Real;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::captura_arriba_5 
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(> ?y2 ?y))
  (test(< ?y 8))
  (manoderecha)
  (fuga)
=>
(printout t "captura_arriba_5::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::captura_izquierda_5 
  (declare (salience 69))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(< ?x2 ?x)) (test(= ?y2 ?y)))
  (manoderecha)
  (fuga)
=>
(printout t "captura_izquierda_5::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::captura_derecha_5 
  (declare (salience 68))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(> ?x2 ?x)) (test(= ?y2 ?y)))
  (manoderecha)
  (fuga)
=>
(printout t "captura__derecha_5::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::captura_abajo_5 
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(< ?y2 ?y)) 
  (manoderecha)
  (fuga)
=>
(printout t "captura_abajo_5::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Aniquilacion Guardia Real;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Ataque Batallon;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque_arriba_4 
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(> ?y2 ?y))
  (test(< ?y 8))
  (guardiareal)
=>
(printout t "a_muerte_arriba_4::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_izquierda_4 
  (declare (salience 64))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(< ?x2 ?x)) (test(= ?y2 ?y)))
  (guardiareal)
=>
(printout t "a_muerte_izquierda_4::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_derecha_4
  (declare (salience 64))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(> ?x2 ?x)) (test(= ?y2 ?y)))
  (guardiareal)
=>
(printout t "a_muerte_derecha_4::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_abajo_4 
  (declare (salience 65))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(< ?y2 ?y)) 
  (guardiareal)
=>
(printout t "a_muerte_abajo_4::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Ataque Batallon;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Aniquilacion Batallon;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::captura_arriba_4 
  (declare (salience 65))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(> ?y2 ?y))
  (test(< ?y 8))
  (guardiareal)
  (fuga)
=>
(printout t "captura_arriba_4::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::captura_izquierda_4 
  (declare (salience 64))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(< ?x2 ?x)) (test(= ?y2 ?y)))
  (guardiareal)
  (fuga)
=>
(printout t "captura_izquierda_4::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::captura_derecha_4
  (declare (salience 63))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(> ?x2 ?x)) (test(= ?y2 ?y)))
  (guardiareal)
  (fuga)
=>
(printout t "captura_derecha_4::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::captura_abajo_4 
  (declare (salience 62))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(< ?y2 ?y)) 
  (guardiareal)
  (fuga)
=>
(printout t "captura_abajo_4::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Aniquilacion Batallon;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Ataque Escuadron;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque_arriba_3 
  (declare (salience 58))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(> ?y2 ?y))
  (test(< ?y 8))
  (batallon)
=>
(printout t "a_muerte_arriba_3::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_izquierda_3 
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(< ?x2 ?x)) (test(= ?y2 ?y)))
  (batallon)
=>
(printout t "a_muerte_izquierda_3::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_derecha_3
  (declare (salience 59))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (and (test(> ?x2 ?x)) (test(= ?y2 ?y)))
  (batallon)
=>
(printout t "a_muerte_derecha_3::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_abajo_3 
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (ficha (equipo "B") (pos-x ?x2) (pos-y ?y2) (num ?n2))
  (test(< ?y2 ?y)) 
  (batallon)
=>
(printout t "a_muerte_abajo_3::EQUIPO-A" crlf)
(assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Ataque Escuadron;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Ataque Conejillos;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::ataque_2 ;;; A lo que Dios quiera
  (declare (salience 49))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 2))
  (escuadron)
  =>
 (printout t "ganate la vida" ?n crlf)
 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fin Ataque conejillos;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
