;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                 Reglas de Inteligencia Artificial                       ;
;                     básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                         ;
; Copyright (C) 2010 Manuel Jesús de la Calle Brihuega                                  ;
;                                                                         ;
; This program is free software: you can redistribute it and/or modify    ;
; it under the terms of the GNU General Public License as published by    ;
; the Free Software Foundation, either version 3 of the License, or       ;
; (at your option) any later version.                                     ;
;                                                                         ;
; This program is distributed in the hope that it will be useful,         ;
; but WITHOUT ANY WARRANTY; without even the implied warranty of          ;
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           ;
; GNU General Public License for more details.                            ;
;                                                                         ;
; You should have received a copy of the GNU General Public License       ;
; along with this program.  If not, see <http://www.gnu.org/licenses/>.   ;
;                                                                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     Inicio de las reglas de comportamiento de la IA                     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El 6 avanza y destruye
(defrule EQUIPO-A::movimientoPrincipal
(declare (salience 90))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6)) 
  
  (test (< ?ya 8))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Bandera de muerte: Se activa si ha sido eliminado el 6

(defrule EQUIPO-A::eliminados
(declare (salience 80))
  (not (ficha (equipo "A") (puntos 6) ))
  =>
  (assert(movimiento5))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El 6 gira a la izquierda
(defrule EQUIPO-A::movimientoPrincipal2
(declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6)) 
  
  (test (= ?ya 8))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El 5 comienza a avanzar 
(defrule EQUIPO-A::movimiento5
(declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 5)) 
  
  (test (< ?ya 8))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El 5 gira a la derecha
(defrule EQUIPO-A::movimiento5_3
(declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 5)) 
  
  (test (= ?ya 8))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El 1 huye hacia arriba
(defrule EQUIPO-A::movimiento_defensa
(declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))  
   
  (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (+ ?xrey  1)))
   )
  =>
   (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
  
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;El 4 avanza y destruye
(defrule EQUIPO-A::movimiento4
(declare (salience 50))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 4)) 
  
  (test (< ?ya 8))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El 4 gira a la derecha
(defrule EQUIPO-A::movimiento4_2
(declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 4)) 
  
  (test (= ?ya 8))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;
(defrule EQUIPO-A::movimiento5_4
(declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 5)) 
  
  (test (= ?xa 8))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
(defrule EQUIPO-A::movimientoPrincipal3
(declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6)) 
  
  (test (= ?xa 1))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; El 1 huye hacia la derecha
(defrule EQUIPO-A::movimiento_defensa_2
(declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))  
   
   (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy (- ?yrey  1))) 
                                 (pos-x ?xenemy&:(= ?xenemy ?xrey))
   )
  =>
   (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
  
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;El 1 huye hacia abajo
(defrule EQUIPO-A::movimiento_defensa_3
(declare (salience 80))
   (tiempo ?t) 
   (ficha (equipo "A") (num ?n) (pos-y ?yrey) (pos-x ?xrey) (puntos 1))  
   
  (ficha (equipo "B") (num ?n2) (pos-y ?yenemy&:(= ?yenemy ?yrey)) 
                                 (pos-x ?xenemy&:(= ?xenemy (+ ?xrey  1)))
   )
  (not (ficha (num ?n2)  (pos-y ?yenemy&:(= ?yenemy (- ?yrey  1)))
                          (pos-x ?xenemy&:(= ?xenemy ?xrey ))
   ))  
  =>
   (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
  
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  

