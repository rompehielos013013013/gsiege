;;Reglas Ezequiel Solís Aguilar

;;Leyenda
;;Mirando desde arriba
;;6 - Campeon
;;5d - Asesino
;;5i - Paladin
;;1 - Rey
;;4 - Caballeros
;;Resto - Masilla

;;;;;;;;;;;;;;;;;;;;;
;;MOVIMIENTOS INICIALES
;;Prioridades 10-19
;;;;;;;;;;;;;;;;;;;;;

;Hay que ponerle poca prioridad para que siempre haya cosas mejores que hacer despues de estos movimientos
(defrule EQUIPO-A::Avanza-Paladin
  (declare (salience 10))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 1))
  (test (= ?x 1)) ;se comprueba que este 5 es el paladin
  (test (<> ?y 8)) ;se comprueba que no este al final del tablero
  (test (= 1 (- ?y ?y2))) ;se comprueba que esta justo delante del Rey
=>
  (assert (mueve(num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Avanza-Campeon
  (declare (salience 11))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
  (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 1))
  (ficha (equipo "A") (num ?n3) (pos-x ?x3) (pos-y ?y3) (puntos 5))
  (test (= ?x3 1)); se comprueba que este 5 es el paladin
  (test (= 1 (- ?x ?x2))) ;se comprueba que esta al lado del 1
  (test (= 1 (- ?y3 ?y))) ;se comprueba que esta por debajo del Paladin
  (test (<> ?y 8)) ;se comprueba que no este al final del tablero
=>
  (assert (mueve(num ?n) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::Avanza-Rey
  (declare (salience 15))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
=>
  (assert (mueve(num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Avanza-Asesino
  (declare (salience 17))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 1))
  (test(=  1 (- ?y ?y2))) ;el asesino esta un paso por delante del rey, lo que significa que le toca atacar
  (test (= ?x 8)) ;se comprueba si ha llegado al final
 =>
  (assert (mueve(num ?n) (mov 3) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;MOVIMIENTOS DEL 6 EN LOS MOVIMIENTOS INICIALES
;;Prioridades 60-62 y 80 en el punto critico
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Ataque-Defendiendo-Campeon-Drc
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
  (test(= 1 (- ?x2 ?x))) ;esta a la derecha (suponiendo siempre que empezamos arriba)
  (test(= ?y ?y2)) ; estan a la misma altura
  (not (Modo_Miedo))
=>
  (assert (mueve(num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Regreso-Defendiendo-Campeon-Desde-Drc
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
  (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 1))
  (test(= 2 (- ?x ?x2))) ;esta a la derecha (suponiendo siempre que empezamos arriba)
  (test(or (= ?y ?y2) (= 1 (- ?y ?y2)))) ; estan a la misma altura o un paso adelante
  (not (Modo_Miedo))
=>
  (assert (mueve(num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Ataque-Defendiendo-Campeon-Delante
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
  (test(= ?x2 ?x)) ;estan en la misma columna
  (test(= 1 (- ?y2 ?y))) ; estan a un paso de altura
  (not (Modo_Miedo))
=>
  (assert (mueve(num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Regreso-Defendiendo-Campeon-Desde-Delante
  (declare (salience 61))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
  (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 1))
  (test(= 2 (- ?y ?y2))) ; estan a uno o dos pasos adelantes
  (not (Modo_Miedo))
=>
  (assert (mueve(num ?n) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::Campeon-salva-a-Rey-Drc
;Si se da esta jugada, es que estan amenazando al Rey
;Como siempre, se valora la situacion inicial de las piezas, de tal forma que no es
;necesario hacer esta jugada una vez por cada direccion
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
  (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 1))
  (ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3) (puntos ?p))
  (test (= 1 (- ?y ?y2)))
  (test (= 1 (- ?x ?x2)))
  (test (= 1 (- ?y3 ?y2)))
  (test (= ?x3 ?x2))
=>
  (assert (mueve(num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Campeon-salva-a-Rey-Arriba
;Si se da esta jugada, es que estan amenazando al Rey
;Como siempre, se valora la situacion inicial de las piezas, de tal forma que no es
;necesario hacer esta jugada una vez por cada direccion
  (declare (salience 80))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 6))
  (ficha (equipo "A") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos 1))
  (ficha (equipo "B") (num ?n3) (pos-x ?x3) (pos-y ?y3) (puntos ?p))
  (test (= 1 (- ?y ?y2)))
  (test (= 1 (- ?x ?x2)))
  (test (= 1 (- ?x3 ?x2)))
  (test (= ?y3 ?y2))
=>
  (assert (mueve(num ?n) (mov 4) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;
;;;REY EN MODO MIEDO
;;;Prioridades 67-79
;;;;;;;;;;;;;;;;;;;;;;;
;;MEJORAR LA HUIDA, HABRIA QUE HACER 16 CASOS DE HUIDA, 4 DIRECCIONES POR CADA LUGAR DE AMENAZA

(defrule EQUIPO-A::Activar-Modo-Miedo
  (declare (salience 79))
  (tiempo ?t)

  (or (not (ficha (equipo "A") (num ?n) (pos-x 1) (pos-y ?y) (puntos 5)))
      (not (ficha (equipo "A") (num ?n) (pos-x ?x2) (pos-y ?y2) (puntos 6)))
      (ficha (equipo "A") (num ?n) (pos-x 1) (pos-y 8) (puntos 5)))
  ;Si ha muerto el paladin, el campeón, o el paladin ha llegado al final del tablero...
=>
  (assert (Modo_Miedo))
)
(defrule EQUIPO-A::HuidaMejoradaArriba
  (declare (salience 74))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
  (test (or (and (= 1 (- ?y2 ?y)) (= ?x1 ?x2)) (and (= ?y ?y2) (= ?x1 (+ ?x2 1))) (and (= ?y ?y2) (= ?x1 (- ?x2 1)))))
  (test (> ?y 3)) ;se procura no acabar en las dos primeras columnas
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
) 
(defrule EQUIPO-A::HuidaMejoradaAbajo
  (declare (salience 73))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
  (test (or (and (= 1 (- ?y ?y2)) (= ?x1 ?x2)) (and (= ?y ?y2) (= ?x1 (+ ?x2 1))) (and (= ?y ?y2) (= ?x1 (- ?x2 1)))))
  (test (< ?y 6)) ;se procura no acabar en las dos ultimas columnas
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
) 

(defrule EQUIPO-A::HuidaArriba
  (declare (salience 70))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
  (test (or (and (= 1 (- ?y2 ?y)) (= ?x1 ?x2)) (and (= ?y ?y2) (= ?x1 (+ ?x2 1))) (and (= ?y ?y2) (= ?x1 (- ?x2 1)))))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
) 
(defrule EQUIPO-A::HuidaAbajo
  (declare (salience 69))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
  (test (or (and (= 1 (- ?y ?y2)) (= ?x1 ?x2)) (and (= ?y ?y2) (= ?x1 (+ ?x2 1))) (and (= ?y ?y2) (= ?x1 (- ?x2 1)))))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
) 

(defrule EQUIPO-A::HuidaIzquierda
  (declare (salience 68))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
  (test (or (and (= 1 (- ?y2 ?y)) (= ?x1 ?x2)) (and (= 1 (- ?y ?y2)) (= ?x1 ?x2)) (and (= ?y ?y2) (= ?x1 (+ ?x2 1)))))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
) 

(defrule EQUIPO-A::HuidaDerecha
  (declare (salience 67))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos 1))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p))
  (test (or (and (= 1 (- ?y2 ?y)) (= ?x1 ?x2)) (and (= 1 (- ?y ?y2)) (= ?x1 ?x2)) (and (= ?y ?y2) (= ?x2 (+ ?x1 1)))))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
) 
;;;;;;;;;;;;;;;;;;;
;;CAMPEON EN ACCION
;;30-35
;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Campeon-limpiando-derecha
  (declare (salience 35))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 6))
  (test (< ?x2 ?x)) ;hay alguien a la derecha...
  (test (= ?y ?y2)) ;...en la misma linea
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Campeon-limpiando-izquierda
  (declare (salience 34))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 6))
  (test (> ?x2 ?x)) ;hay alguien a la izquierda...
  (test (= ?y ?y2)) ;...en la misma linea
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Campeon-rastreando-hacia-abajo
;; El paladin rastrea hacia abajo si no hay nadie en su linea
  (declare (salience 32))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 6))
  (test (< ?y ?y2)) ;hay alguien mas abajo
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::Campeon-subiendo-tras-la-limpieza
;; Al tener menor prioridad, solo subira si no encuentra nadie abajo
  (declare (salience 18))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (test (= ?p 6))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;
;;Paladin y/o Asesino en movimiento
;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Paladin-o-Asesino-llego-al-final
  (declare (salience 65))
  (tiempo ?t)

  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (test (= ?y 8))
=>
  (assert (Final_Alcanzado))
)
(defrule EQUIPO-A::Asesino-Paladin-rastreando-hacia-abajo
;; Se intenta que uno de los dos toque el final
  (declare (salience 64))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 5))
  (not (Final_Alcanzado))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Asesino-limpiando-derecha
  (declare (salience 45))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 5))
  (test (< ?x2 ?x)) ;hay alguien a la derecha...
  (test (= ?y ?y2)) ;...en la misma linea
  (test (< ?p2 6)) ;ese alguien no es el 6 (al menos no solo el)
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Asesino-rastreando-hacia-abajo
;; El asesino rastrea hacia abajo si no hay nadie en su linea
  (declare (salience 43))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 5))
  (test (or (= ?x2 ?x) (< ?x2 ?x))) ;hay alguien a la derecha...
  (test (< ?y ?y2)) ;...mas abajo
  (test (< ?p2 6)) ; ese alguien no es el 6 (al menos no solo el)
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::Paladin-limpiando-derecha
  (declare (salience 44))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 5))
  (test (> ?x2 ?x)) ;hay alguien a la izquierda...
  (test (= ?y ?y2)) ;...en la misma linea
  (test (< ?p2 6)) ;ese alguien no es el 6 (al menos no solo el)
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Paladin-rastreando-hacia-abajo
;; El paladin rastrea hacia abajo si no hay nadie en su linea
  (declare (salience 42))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 5))
  (test (or (= ?x2 ?x) (> ?x2 ?x))) ;hay alguien a la izquierda...
  (test (< ?y ?y2)) ;...mas abajo
  (test (< ?p2 6)) ; ese alguien no es el 6 (al menos no solo el)
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::Paladin-o-Asesino-subiendo-tras-la-limpieza
;; Al tener menor prioridad, solo subira si no encuentra nadie abajo
  (declare (salience 19))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (test (= ?p 5))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;
;;Movimientos de los caballeros
;;25-29
;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Caballeros-limpiando-derecha
  (declare (salience 28))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 4))
  (test (< ?x2 ?x)) ;hay alguien a la derecha...
  (test (= ?y ?y2)) ;...en la misma linea
  (test (< ?p2 5))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::Caballeros-limpiando-izquierda
  (declare (salience 29))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 4))
  (test (> ?x2 ?x)) ;hay alguien a la izquierda...
  (test (= ?y ?y2)) ;...en la misma linea
  (test (< ?p2 5))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::Caballeros-rastreando-hacia-abajo
;; El paladin rastrea hacia abajo si no hay nadie en su linea
  (declare (salience 27))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2))
  (test (= ?p 4))
  (test (< ?y ?y2)) ;hay alguien abajo
  (test (< ?p2 5))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::Caballeros-subiendo-tras-la-limpieza
;; Al tener menor prioridad, solo subira si no encuentra nadie abajo
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (test (= ?p 4))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;;
;;Movimientos de la masilla
;;21
;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::Masilla-avanzando
  (declare (salience 22))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (test (or (= ?p 2) (= ?p 3)))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;;
;;Ataques Prioritarios
;;50-55
;;;;;;;;;;;;;;;;;;
;;Ataque cuando esta a huevo un enemigo

(defrule EQUIPO-A::Ataque-derecha
  (declare (salience 55))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta ?d))
  (test (= ?x2 (+ 1 ?x))) 
  (test (= ?y ?y2))
  (test (or (= ?d 0) (> ?p ?p2))) ;se ataca si mis puntos son mayores o si la ficha no esta descubierta
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
)
(defrule EQUIPO-A::Ataque-izquierda
  (declare (salience 54))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta ?d))
  (test (= ?x (+ 1 ?x2))) 
  (test (= ?y ?y2))
  (test (or (= ?d 0) (and (= ?d 1) (> ?p ?p2)))) ;se ataca si mis puntos son mayores o si la ficha no esta descubierta
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
)
(defrule EQUIPO-A::Ataque-abajo
  (declare (salience 53))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta ?d))
  (test (= ?y2 (+ 1 ?y))) 
  (test (= ?x ?x2))
  (test (or (= ?d 0) (and (= ?d 1) (> ?p ?p2)))) ;se ataca si mis puntos son mayores o si la ficha no esta descubierta
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::Ataque-arriba
  (declare (salience 52))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta ?d))
  (test (= ?y (+ 1 ?y2))) 
  (test (= ?x ?x2))
  (test (or (= ?d 0) (and (= ?d 1) (> ?p ?p2)))) ;se ataca si mis puntos son mayores o si la ficha no esta descubierta
  (test (not (and (= 5 ?p) (= ?y 8)))) ;Este ataque no lo puede hacer el 5 que esta limpiando abajo
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
)
;;;;;;;;;;;;;;;;;
;;Movmimiento al azar
;;Prioridad 20
;;;;;;;;;;;;;;;;;
;;En el mejor de los casos nunca se usará este movimiento, pero es necesario definirlo para que no use los movimientos
;;inciales cuando ya no corresponde


(defrule EQUIPO-A::MovmimientoAleatorioAtras
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p))
  (test (< 1 ?p))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t)))
) 
(defrule EQUIPO-A::MovmimientoAleatorioIzq
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p))
  (test (< 1 ?p))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t)))
) 
(defrule EQUIPO-A::MovmimientoAleatorioDrc
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p))
  (test (< 1 ?p))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t)))
) 
(defrule EQUIPO-A::MovmimientoAleatorioDelante
  (declare (salience 20))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x1) (pos-y ?y) (puntos ?p))
  (test (< 1 ?p))
  (Modo_Miedo)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t)))
) 


