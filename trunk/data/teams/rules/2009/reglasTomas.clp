; Reglas del equipo
; José Tomás Tocino García

; La estrategia es intentar subir el 6 y barrer las dos filas iniciales
; Si muere, repetir el proceso con el 5
; Alternativamente, matar a alguna ficha aislada del resto

(defrule EQUIPO-A::comprobar_fila8_vacia
	 (declare (salience 80))
	 (not (ficha (equipo "B") (num ?n1) (pos-x ?x1) (pos-y 8) (puntos ?p1)))
	 (tiempo ?t)
	 =>
	 (assert (fila8_vacia))
)


(defrule EQUIPO-A::comprobar_fila7_vacia
	 (declare (salience 80))
	 (not (ficha (equipo "B") (num ?n1) (pos-x ?x1) (pos-y 7) (puntos ?p1)))
	 (tiempo ?t)
	 =>
	 (assert (fila7_vacia))
)

(defrule EQUIPO-A::comprobar_fila8_no_vacia
	 (declare (salience 80))
	 (ficha (equipo "B") (num ?n1) (pos-x ?x1) (pos-y 8) (puntos ?p1))
	 (tiempo ?t)
	 ?h <- (fila8_vacia)
	 =>
	 (retract ?h)
)


(defrule EQUIPO-A::comprobar_fila7_no_vacia
	 (declare (salience 80))
	 (ficha (equipo "B") (num ?n1) (pos-x ?x1) (pos-y 7) (puntos ?p1))
	 (tiempo ?t)
	 ?h <- (fila7_vacia)
	 =>
	 (retract ?h)
)



;;; INICIO DE LOS MOVIMIENTOS DE LA FICHA SEIS

(defrule EQUIPO-A::SEIS_centrar_horizontal
	 (declare (salience 70))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	 (test (> ?x 5))
	 (fin_barrido_6)
	 =>
	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::SEIS_centrar_vertical
	 (declare (salience 70))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x 5x) (pos-y ?y) (puntos 6))
	 (test (> ?y 4))
	 (fin_barrido_6)
	 =>
	 (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)



(defrule EQUIPO-A::SEIS_subir_inicial
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
	 (test (< ?y 7))
	 =>
	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::SEIS_primer_giro_derecha
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 7) (puntos 6))
	 =>
	 (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::SEIS_paso_arriba
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x 8) (pos-y 7) (puntos 6))
	 (not (abortar_subir))
	 =>
	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::SEIS_barrer_y8
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 6))
	 (test (> ?x 1))
;	 (not (abortar_subir))
	 =>
	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::SEIS_bajar_y7
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x 1) (pos-y 8) (puntos 6))
;	 (not (abortar_subir))
	 =>
	 (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::SEIS_barrer_y7
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 7) (puntos 6))
	 (test (< ?x 8))
;	 (not (abortar_subir))
	 =>
	 (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
	 (assert (fin_barrido_6))
)





;;; COSAS CON EL J51 


;; La ficha 5 sube hasta y = 7
(defrule EQUIPO-A::J51_subir
	 (declare (salience 60))
	 (tiempo ?t)
	 (not (ficha (equipo "A") (num J61) (pos-x ?x) (pos-y ?y) (puntos 6)))
	 (ficha (equipo "A") (num J51) (pos-x ?x) (pos-y ?y) (puntos ?p))
	 (test (< ?y 7))
	 =>
	 (assert (mueve (num J51) (mov 3) (tiempo ?t)))
	 (printout t "enemigo detras, huir derecha" crlf)
)

;; En y = 7, se mueve al lado
(defrule EQUIPO-A::J51_paso_izquierda
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 7) (puntos 5))
	 =>
	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

;; En x=1, y = 7, se mueve arriba pa barrer
(defrule EQUIPO-A::J51_paso_arribarrr11
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x 1) (pos-y 7) (puntos 5))
	 =>
	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;; En  y = 8, se mueve pa la derecha para barrer
(defrule EQUIPO-A::J51_barrido_derecharrr
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 8) (puntos 5))
	 =>
	 (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

;; En x=8 tira pal centro
(defrule EQUIPO-A::J51_centrando_vertical
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x 8) (pos-y ?y) (puntos 5))
	 (test (< ?y 5))
	 (not (centrado5))
	 =>
	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

;; En x=8 y=5, tira pal centro
(defrule EQUIPO-A::J51_centrando_horizontal
	 (declare (salience 60))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y 5) (puntos 5))
	 (test (< ?x 5))
	 (not (centrado5))
	 =>
	 (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::J51_centradofinal
	 (declare (salience 80))
	 (tiempo ?t)
	 (ficha (equipo "A") (num ?n) (pos-x 5) (pos-y 5) (puntos 5))
	 =>
	 (assert (centrado5))
)


;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; FIN J51


(defrule EQUIPO-A::SEIS_ATK_DER
	 (declare (salience 10))
	 (ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	 (ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))

	(test (= ?y1 ?y2))
	(test (< ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
	  

(defrule EQUIPO-A::SEIS_ATK_IZQ
	(declare (salience 10))
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))

	(test (= ?y1 ?y2))
	(test (> ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::SEIS_ATK_ARRIB
	(declare (salience 10))
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))

	(test (< ?y1 ?y2))
	(test (= ?x1 ?x2))

	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::SEIS_ATK_ABAJ
	(declare (salience 10))
	(ficha (equipo "A") (num ?n1) (puntos 6) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))

	(test (> ?y1 ?y2)) 
	(test (= ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::CINCO_ATK_DER
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))

	; Solo ataca cuando no hay seis vivo
	(not (ficha (equipo "A") (num J61) (puntos ?px) (pos-x ?xx) (pos-y ?yx)))

	(test (= ?y1 ?y2))
	(test (= ?x1 (- ?x2 1)))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 1) (tiempo ?t))))
	  

(defrule EQUIPO-A::CINCO_ATK_IZQ
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))

	; Solo ataca cuando no hay seis vivo
	(not (ficha (equipo "A") (num J61) (puntos ?px) (pos-x ?xx) (pos-y ?yx)))

	(test (= ?y1 ?y2))
	(test (= ?x1 (+ ?x2 1)))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 2) (tiempo ?t)))
)


(defrule EQUIPO-A::CINCO_ATK_ARRIB
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))

	; Solo ataca cuando no hay seis vivo
	(not (ficha (equipo "A") (num J61) (puntos ?px) (pos-x ?xx) (pos-y ?yx)))

	(test (= ?y1 (- ?y2 1)))
	(test (= ?x1 ?x2))

	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 3) (tiempo ?t)))
)


(defrule EQUIPO-A::CINCO_ATK_ABAJ
	(declare (salience 80))
	(ficha (equipo "A") (num ?n1) (puntos 5) (pos-x ?x1) (pos-y ?y1))
	(ficha (equipo "B") (num ?n2) (puntos ?p2) (pos-x ?x2) (pos-y ?y2))

	; Solo ataca cuando no hay seis vivo
	(not (ficha (equipo "A") (num J61) (puntos ?px) (pos-x ?xx) (pos-y ?yx)))

	(test (= ?y1 (+ ?y2 1))) 
	(test (= ?x1 ?x2))
	(tiempo ?t)
	=>
	(assert (mueve (num ?n1) (mov 4) (tiempo ?t)))
)



;;;;;;;;;;;;;
;; Ataques suicidas

(defrule EQUIPO-A::sube_dos
	 (declare (salience 8))
	 (ficha (equipo "A") (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
	 (test (< ?y 8))
	 (tiempo ?t)
	 =>
	 (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)
