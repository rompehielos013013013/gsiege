; Reglas del equipo Ultramar
; Francisco Madueño Chulián
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;
;	      	    HUIDA                     ;
;              PRIORIDAD 80-70                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::flanco_superior_huida_atras
  (declare(salience 70))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla arriba
    (test (and( = ?x_rey ?x_ene ) (= (- ?y_rey 1) ?y_ene)))
    
    ;Comprobamos que no estamos en la primera fila
    (test(<> ?y_rey 1))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::flanco_superior_huida_derecha
  (declare(salience 80))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla arriba
    (test (and( = ?x_rey ?x_ene ) (= (- ?y_rey 1) ?y_ene)))
    
    ;Comprobamos que no estamos en la ultima columna
    (test(<> ?x_rey 8))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::flanco_superior_huida_izquierda
  (declare(salience 80))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla arriba
    (test (and( = ?x_rey ?x_ene ) (= (- ?y_rey 1) ?y_ene)))
    
    ;Comprobamos que no estamos en la primera columna
    (test(<> ?x_rey 1))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 2) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::flanco_derecho_huida_atras
  (declare(salience 80))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla a la derecha
    (test (and( = ?y_rey ?y_ene ) (= (+ ?x_rey 1) ?x_ene)))
    
    ;Comprobamos que no estamos en la primera fila
    (test(<> ?y_rey 1))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::flanco_derecho_huida_arriba
  (declare(salience 75))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla a la derecha
    (test (and( = ?y_rey ?y_ene ) (= (+ ?x_rey 1) ?x_ene)))
    
    ;Comprobamos que no estamos en la ultima fila
    (test(<> ?y_rey 8))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::flanco_derecho_huida_izquierda
  (declare(salience 80))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla a la derecha
    (test (and( = ?y_rey ?y_ene ) (= (+ ?x_rey 1) ?x_ene)))
    
    ;Comprobamos que no estamos en la primera columna
    (test(<> ?x_rey 1))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 2) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::flanco_izquierdo_huida_atras
  (declare(salience 75))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla a la izquierda
    (test (and (= ?y_rey ?y_ene ) (= (- ?x_rey 1) ?x_ene)))
    
    ;Comprobamos que no estamos en la primera fila
    (test(<> ?y_rey 1))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 4) (tiempo ?t)))
)


(defrule EQUIPO-A::flanco_izquierdo_huida_arriba
  (declare(salience 80))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla a la izquierda
    (test (and (= ?y_rey ?y_ene ) (= (- ?x_rey 1) ?x_ene)))
    
    ;Comprobamos que no estamos en la ultima fila
    (test(<> ?y_rey 8))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::flanco_izquierdo_huida_derecha
  (declare(salience 80))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla a la izquierda
    (test (and (= ?y_rey ?y_ene ) (= (- ?x_rey 1) ?x_ene)))
    
    ;Comprobamos que no estamos en la ultima columna
    (test(<> ?x_rey 8))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 1) (tiempo ?t)))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::flanco_trasero_huida_arriba
  (declare(salience 75))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla atras
    (test (and( = ?x_rey ?x_ene ) (= (+ ?y_rey 1) ?y_ene)))
    
    ;Comprobamos que no estamos en la ultima fila
    (test(<> ?y_rey 8))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::flanco_trasero_huida_izquierda
  (declare(salience 80))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla atras
    (test (and( = ?x_rey ?x_ene ) (= (+ ?y_rey 1) ?y_ene)))
    
    ;Comprobamos que no estamos en la primera columna
    (test(<> ?y_rey 1))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::flanco_izquierdo_huida_derecha
  (declare(salience 80))
    
    ;Condiciones
    (tiempo ?t)
    
    ;Seleccionamos al rey
    (ficha (equipo "A") (num ?n_rey) (pos-x ?x_rey) (pos-y ?y_rey) (puntos 1))

    ;Seleccionamos al enemigo
    (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene))
    
    ;Comprobamos que el enemigo una casilla atras
    (test (and( = ?x_rey ?x_ene ) (= (+ ?y_rey 1) ?y_ene)))
    
    ;Comprobamos que no estamos en la ultima columna
    (test(<> ?x_rey 8))

    ;Actuamos
    => 
    (assert (mueve(num ?n_rey) (mov 1) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;
;	           ATAQUE                     ;
;              PRIORIDAD 50-40                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule EQUIPO-A::ataque_6_arriba
  (declare(salience 40))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 6
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 6))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La reina tiene al enemigo arriba
  (test (and (= ?x_sol ?x_ene) (= (+ ?y_sol 1) ?y_ene)))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_6_derecha
  (declare(salience 40))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 6
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 6))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La reina tiene al enemigo a la derecha
  (test (and (= ?x_sol (- ?x_ene 1)) (= ?y_sol ?y_ene))) 

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_6_izquierda
  (declare(salience 40))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 6
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 6))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La reina tiene al enemigo a la derecha
  (test (and (= ?x_sol (+ ?x_ene 1)) (= ?y_sol ?y_ene)))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_6_abajo
  (declare(salience 40))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 6
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 6))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La reina tiene al enemigo abajo
  (test (and (= ?x_sol ?x_ene) (= (- ?y_sol 1) ?y_ene)))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_seguro_arriba
  (declare(salience 30))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 4
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 4))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (descubierta ?desc_ene) (puntos ?pun_ene))

  ;La ficha tiene al enemigo arriba
  (test (and (= ?x_sol ?x_ene) (= (+ ?y_sol 1) ?y_ene)))

  ;Comprueba si esta descubierto y es menor que nuestra ficha
  (test(and(= ?desc_ene 1) (>= 4 ?pun_ene))) 

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_seguro_derecha
  (declare(salience 30))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 4
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 4))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (descubierta ?desc_ene) (puntos ?pun_ene))

  ;La ficha tiene al enemigo a la derecha
  (test (and (= ?x_sol (- ?x_ene 1)) (= ?y_sol ?y_ene)))

  ;Comprueba si esta descubierto y es menor que nuestra ficha
  (test(and(= ?desc_ene 1) (>= 4 ?pun_ene))) 

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_seguro_izquierda
  (declare(salience 30))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 4
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 4))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (descubierta ?desc_ene) (puntos ?pun_ene))

  ;La ficha tiene al enemigo a la izquierda
  (test (and (= ?x_sol (+ ?x_ene 1)) (= ?y_sol ?y_ene)))

  ;Comprueba si esta descubierto y es menor que nuestra ficha
  (test(and(= ?desc_ene 1) (>= 4 ?pun_ene)))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_seguro_abajo
  (declare(salience 30))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 4
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 4))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (descubierta ?desc_ene) (puntos ?pun_ene))

  ;La ficha tiene al enemigo abajo
  (test (and (= ?x_sol ?x_ene) (= (- ?y_sol 1) ?y_ene)))

  ;Comprueba si esta descubierto y es menor que nuestra ficha
  (test(and(= ?desc_ene 1) (>= 4 ?pun_ene)))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_5_arriba
  (declare(salience 40))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 5))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La ficha tiene al enemigo arriba
  (test (and (= ?x_sol ?x_ene) (= (- ?y_sol 1) ?y_ene)))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_5_derecha
  (declare(salience 40))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 5))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La ficha tiene al enemigo a la derecha
  (test (and (= ?x_sol (- ?x_ene 1)) (= ?y_sol ?y_ene))) 

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_5_izquierda
  (declare(salience 40))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 5))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La ficha tiene al enemigo a la derecha
  (test (and (= ?x_sol (+ ?x_ene 1)) (= ?y_sol ?y_ene)))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::ataque_5_abajo
  (declare(salience 40))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos 5))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La ficha tiene al enemigo abajo
  (test (and (= ?x_sol ?x_ene) (= (- ?y_sol 1) ?y_ene)))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;
;	         NOS MOVEMOS                  ;
;              PRIORIDAD 20-30                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::carga_del_6_arriba
  (declare(salience 30))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 6
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos 6))
  
  ;Comprobamos que no estamos arriba del todo
  (test (<> ?y_soldado 8))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::carga_del_6_derecha
  (declare(salience 25))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 6
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos 6))
  
  ;Comprobamos que no estamos a la derecha del todo
  (test (<> ?x_soldado 8))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::carga_del_6_izquierda
  (declare(salience 25))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 6
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos 6))
  
  ;Comprobamos que no estamos a la izquierda del todo
  (test (<> ?x_soldado 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::carga_del_6_abajo
  (declare(salience 20))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos 6))
  
  ;Comprobamos que no estamos abajo del todo
  (test (= ?y_soldado 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::carga_del_5_arriba
  (declare(salience 30))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos 5))
  
  ;Comprobamos que no estamos arriba del todo
  (test (<> ?y_soldado 7))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::carga_del_5_derecha
  (declare(salience 25))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos 5))
  
  ;Comprobamos que no estamos a la derecha del todo
  (test (<> ?x_soldado 8))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::carga_del_5_izquierda
  (declare(salience 25))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos 5))
  
  ;Comprobamos que no estamos a la izquierda del todo
  (test (<> ?x_soldado 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::carga_del_5_abajo
  (declare(salience 20))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos 5))
  
  ;Comprobamos que no estamos abajo del todo
  (test (= ?y_soldado 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 4) (tiempo ?t)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;
;	           3:14                       ;
;              PRIORIDAD 10                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule EQUIPO-A::3_14_arriba
  (declare(salience 14))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos cualquier ficha
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos ?p))
  
  ;Comprobamos que no estamos arriba del todo
  (test (<> ?y_soldado 8))
  (test (<> ?p 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 3) (tiempo ?t)))
)

(defrule EQUIPO-A::3_14_derecha
  (declare(salience 12))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos cualquier ficha
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos ?p))
  
  ;Comprobamos que no estamos a la derecha del todo
  (test (<> ?x_soldado 8))
  (test (<> ?p 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::3_14_izquierda
  (declare(salience 12))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos cualquier ficha
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos ?p))
  
  ;Comprobamos que no estamos a la izquierda del todo
  (test (<> ?x_soldado 1))
  (test (<> ?p 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::3_14_abajo
  (declare(salience 10))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos cualquier ficha
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos ?p))
  
  ;Comprobamos que no estamos abajo del todo
  (test (<> ?x_soldado 1))
  (test (<> ?p 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::3_14_ataque_arriba
  (declare(salience 15))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos al 5
  (ficha (equipo "A") (num ?n_soldado) (pos-x ?x_soldado) (pos-y ?y_soldado) (puntos 5))
  
  ;Comprobamos que no estamos abajo del todo
  (test (= ?y_soldado 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_soldado) (mov 4) (tiempo ?t)))
)

(defrule EQUIPO-A::3_14_ataque_arriba
  (declare(salience 15))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos a cualquier ficha
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos ?p))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La reina tiene al enemigo arriba
  (test (and (= ?x_sol ?x_ene) (= (+ ?y_sol 1) ?y_ene)))
  (test(<> ?p 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 3) (tiempo ?t)))
)
(defrule EQUIPO-A::3_14_ataque_derecha
  (declare(salience 15))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos a cualquier ficha
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos ?p))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La reina tiene al enemigo a la derecha
  (test (and (= ?x_sol (- ?x_ene 1)) (= ?y_sol ?y_ene)))
  (test(<> ?p 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 1) (tiempo ?t)))
)

(defrule EQUIPO-A::3_14_ataque_izquierda
  (declare(salience 15))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos a cualquier ficha
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos ?p))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La reina tiene al enemigo a la derecha
  (test (and (= ?x_sol (+ ?x_ene 1)) (= ?y_sol ?y_ene)))
  (test(<> ?p 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 2) (tiempo ?t)))
)

(defrule EQUIPO-A::3_14_ataque_abajo
  (declare(salience 15))
  
  ;Condiciones
  (tiempo ?t)
  
  ;Seleccionamos a cualquier ficha
  (ficha (equipo "A") (num ?n_sol) (pos-x ?x_sol) (pos-y ?y_sol) (puntos ?p))
  
  ;Seleccionamos un enemigo
  (ficha (equipo "B") (num ?n_ene) (pos-x ?x_ene) (pos-y ?y_ene) (puntos ?pun_ene))

  ;La reina tiene al enemigo abajo
  (test (and (= ?x_sol ?x_ene) (= (- ?y_sol 1) ?y_ene)))
  (test(<> ?p 1))

  =>
  ;Actuamos
  (assert (mueve(num ?n_sol) (mov 4) (tiempo ?t)))
)
