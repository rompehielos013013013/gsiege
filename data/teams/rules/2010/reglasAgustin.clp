;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;            Equipo Vigilantes del vacio               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Agustin Llamas Ruiz
;
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

; Fichero para annadir reglas

;;;;;;;;;;;;;;;;;;;;;; Muerte de 4 y 5;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::eliminados
(declare (salience 80))
  (not (ficha (equipo "A") (puntos 4) ))
  (not (ficha (equipo "A") (puntos 5) ))
  =>
  (assert(muerto))
)

;;;;;;;;;;;;;;;;;;;;;;; Movimiento inicial;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::AvanceTanque
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
  (test (< ?y 3))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))
  
(defrule EQUIPO-A::AvanceRey
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
  (test (< ?y 2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;; Ataque Principal;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; Fichas 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule EQUIPO-A::AtaqueDPSder
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num A128) (pos-x ?x) (pos-y ?y))
  (test (< ?y 8))
  =>
  (assert (mueve (num A128) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::AtaqueDPSizq
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num A121) (pos-x ?x) (pos-y ?y))
  (test (< ?y 7))
  =>
  (assert (mueve (num A121) (mov 3) (tiempo ?t))))
  
(defrule EQUIPO-A::AtaqueDPSder2
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num A128) (pos-x ?x) (pos-y ?y))
  (test (= ?y 8))
  =>
  (assert (mueve (num A128) (mov 2) (tiempo ?t))))
  
(defrule EQUIPO-A::AtaqueDPSizq2
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num A121) (pos-x ?x) (pos-y ?y))
  (test (= ?y 7))
  =>
  (assert (mueve (num A121) (mov 1) (tiempo ?t))))
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;Fichas 4;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::AvanceoffDPS
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 4))
  (test (< ?y 4))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))
  
(defrule EQUIPO-A::AtaqueoffDPSizq
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num A125) (pos-x ?x) (pos-y ?y))
  (test (< ?y 7))
  =>
  (assert (mueve (num A125) (mov 3) (tiempo ?t))))
  
(defrule EQUIPO-A::AtaqueoffDPSizq
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num A123) (pos-x ?x) (pos-y ?y))
  (test (< ?y 8))
  =>
  (assert (mueve (num A123) (mov 3) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;Huida del rey;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::HuidaReyizq
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-y ?yb&:(= ?yb ?ya)) (pos-x ?xb&:(= ?xb (+ ?xa 1))))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t)) (movido)))
  
(defrule EQUIPO-A::HuidaReyder
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-y ?yb&:(= ?yb ?ya)) (pos-x ?xb&:(= ?xb (- ?xa 1))))
  (test (= ?xb (- ?xa 1)))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t)) (movido)))
    
(defrule EQUIPO-A::HuidaReyabj
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?xb&:(= ?xb ?xa)) (pos-y ?yb&:(= ?yb (+ ?ya 1))))
  (test (= ?yb (+ ?ya 1)))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t)) (movido)))
  
(defrule EQUIPO-A::HuidaReyarb
  (declare (salience 79))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?xb&:(= ?xb ?xa)) (pos-y ?yb&:(= ?yb (- ?ya 1))))
  (test (= ?yb (- ?ya 1)))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)) (movido)))
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Defensa de la ficha 6;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::AtaqueTanqueizq
  (declare (salience 80))
  (movido)
  (not (muerto))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-y ?yb&:(= ?yb ?ya)) (pos-x ?xb&:(= ?xb (+ ?xa 1))))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::AtaqueTanqueder
  (declare (salience 80))
  (movido)
  (not (muerto))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-y ?yb&:(= ?yb ?ya)) (pos-x ?xb&:(= ?xb (- ?xa 1))))
  (test (= ?xb (- ?xa 1)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t))))
  
(defrule EQUIPO-A::AtaqueTanqueabj
  (declare (salience 80))
  (movido)
  (not (muerto))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?xb&:(= ?xb ?xa)) (pos-y ?yb&:(= ?yb (+ ?ya 1))))
  (test (= ?yb (+ ?ya 1)))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t))))
  
(defrule EQUIPO-A::AtaqueTanquearb
  (declare (salience 80))
  (movido)
  (not (muerto))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?xb&:(= ?xb ?xa)) (pos-y ?yb&:(= ?yb (- ?ya 1))))
  (test (= ?yb (- ?ya 1)))
  =>
  (assert (mueve (num ?na) (mov 4) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Ataque ficha 6;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::AtaqueTanqueCarga
  (declare (salience 50))
  (muerto)
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (test (< ?ya 7))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t))))
  
(defrule EQUIPO-A::AtaqueTanqueizqCarga
  (declare (salience 40))
  (muerto)
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-y ?yb&:(= ?yb ?ya)) (pos-x ?xb&:(= ?xb ?xa)))
  =>
  (assert (mueve (num ?na) (mov 1) (tiempo ?t))))
  
(defrule EQUIPO-A::AtaqueTanquederCarga
  (declare (salience 40))
  (muerto)
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-y ?yb&:(= ?yb ?ya)) (pos-x ?xb&:(= ?xb ?xa)))
  (test (= ?xb (- ?xa 1)))
  =>
  (assert (mueve (num ?na) (mov 2) (tiempo ?t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;Movimiento suicida;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::movimientoElemental
(declare (salience 10))
  (tiempo ?t)
  (ficha (equipo "A") (num ?na) (pos-x ?xa) (pos-y ?ya) (puntos ?pa))
  (test (<> ?pa 1))
  =>
  (assert (mueve (num ?na) (mov 3) (tiempo ?t)))
)

