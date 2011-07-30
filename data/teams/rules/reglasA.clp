;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Manuel Palomo Duarte, 2007
;
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

; Fichero para annadir reglas


(defrule EQUIPO-A::imprimir_obstaculos
  (declare (salience 70))
  (tiempo ?t)
  (obstaculo (pos-x ?x) (pos-y ?y))
  =>
  (printout t "* OBSTÁCULO == " ?x "," ?y crlf))

(defrule EQUIPO-A::imprimir_fichas_muertas
  (declare (salience 69))
  (tiempo ?t)
  (fichamuerta (equipo ?e) (num ?n) (puntos ?p) (pos-x ?x) (pos-y ?y))
  =>
  (printout t "FICHA MUERTA == equipo " ?e ", num " ?n ", puntos " ?p ", " ?x
            "," ?y crlf))

(defrule EQUIPO-A::imprimir_movimientos
  (declare (salience 68))
  (tiempo ?t)
  (movio (equipo ?e) (num ?n) (puntos ?p) (turno ?t2) (mov ?m) (pos-x-ini ?x)
         (pos-y-ini ?y))
  =>
  (printout t "MOVIMIENTO PREVIO == e " ?e ", n "?n ", p " ?p ", x " ?x ", y "
            ?y ", t " ?t2 crlf))
