;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Reglas de Inteligencia Artificial                     ;
;  básicas para el equipo A                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Francisco García Martín-Bejarano, 2009
;
;
; Disponible bajo los términos de la GNU General Public License (GPL) version 2 o superior
;

; Fichero para añadir reglas

; -------------------- ATAQUE SEGURO --------------------

; Ataques en los que sabemos que vamos a ganar

(defrule EQUIPO-A::ataqueseguroarri
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (> ?p ?p2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve(num ?n1)(mov 3)(tiempo ?t))))

(defrule EQUIPO-A::ataqueseguroizq
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (> ?p ?p2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve(num ?n1)(mov 2)(tiempo ?t))))

(defrule EQUIPO-A::ataqueseguroder
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (> ?p ?p2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve(num ?n1)(mov 1)(tiempo ?t))))

(defrule EQUIPO-A::ataqueseguroaba
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (> ?p ?p2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve(num ?n1)(mov 4)(tiempo ?t))))

; -------------------- DEFENSA -------------------- 

; Si tiene más rango que el nuestro huimos

(defrule EQUIPO-A::defensaarri
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (< ?p ?p2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve(num ?n1)(mov 4)(tiempo ?t))))

(defrule EQUIPO-A::defensaizq
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (< ?p ?p2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve(num ?n1)(mov 1)(tiempo ?t))))

(defrule EQUIPO-A::defensader
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (< ?p ?p2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve(num ?n1)(mov 2)(tiempo ?t))))

(defrule EQUIPO-A::defensaaba
  (declare (salience 40))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos ?p))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2) (puntos ?p2) (descubierta 1))
  (test (< ?p ?p2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve(num ?n1)(mov 3)(tiempo ?t))))

; -------------------- REGLAS PARA LA FICHA 6 (HEROE) -------------------- 

; Barremos las dos filas superiores

(defrule EQUIPO-A::busqueda6arri1
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 6)(pos-x 1) (pos-y ?y))
  (test (< ?y 8))
  (tiempo ?t)
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::busqueda6der1
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y 8))
  (test (< ?x 8))
  (tiempo ?t)
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::busqueda6aba1
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 6)(pos-x 8) (pos-y 8))
  (tiempo ?t)
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::busqueda6izq1
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y 7))
  (test (> ?x 1))
  (tiempo ?t)
=>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

;---

; Si se cumple el tiempo bajamos y barremos la zona central

(defrule EQUIPO-A::busqueda6aba2
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y ?y))
  (test (> ?y 5))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::busqueda6der2
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y 5))
  (test (< ?x 8))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::busqueda6aba3
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 6)(pos-x 8) (pos-y 5))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::busqueda6izq2
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 6)(pos-x ?x) (pos-y 4))
  (test (> ?x 1))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::busqueda6arri2
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 6)(pos-x 1) (pos-y 4))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;---

; Ataques suicidas 

(defrule EQUIPO-A::ataque6arri
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::ataque6izq
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque6der
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque6aba
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 6) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

; -------------------- REGLAS PARA LA FICHA 5 (CAB. ARMADURA) -------------------- 

; ---------- Ficha 5 con num 911 ----------

; Esperamos un tiempo (o a que 6 muera) para barrer las 2 filas superiores

(defrule EQUIPO-A::busqueda51arri1
  (declare (salience 55))
  (ficha (equipo "A")(num 911)(puntos 5)(pos-x 1) (pos-y ?y))
  (test (< ?y 8))
  (tiempo ?t)
  (test (< ?t 189))
=>
  (assert (mueve (num 911) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::busqueda51arri2
  (declare (salience 55))
  (ficha (equipo "A")(num 911)(puntos 5)(pos-x 1) (pos-y ?y))
  (not(ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2)))
  (test (< ?y 8))
  (tiempo ?t)
=>
  (assert (mueve (num 911) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::busqueda51der1
  (declare (salience 55))
  (ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x) (pos-y 8))
  (test (< ?x 8))
  (tiempo ?t)
=>
  (assert (mueve (num 911) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::busqueda51aba1
  (declare (salience 55))
  (ficha (equipo "A")(num 911)(puntos 5)(pos-x 8) (pos-y 8))
  (tiempo ?t)
=>
  (assert (mueve (num 911) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::busqueda51izq1
  (declare (salience 55))
  (ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x) (pos-y 7))
  (test (> ?x 1))
  (tiempo ?t)
=>
  (assert (mueve (num 911) (mov 2) (tiempo ?t))))

; ---------- Ficha 5 con num 982 ----------

; Si mueren las fichas 6 y la otra 5 hacemos su función

(defrule EQUIPO-A::busqueda52arri1
  (declare (salience 55))
  (ficha (equipo "A")(num 982)(puntos 5)(pos-x 8) (pos-y ?y))
  (not(ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2)))
  (not(ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x3) (pos-y ?y3)))
  (test (< ?y 8))
  (tiempo ?t)
=>
  (assert (mueve (num 982) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::busqueda52izq1
  (declare (salience 55))
  (ficha (equipo "A")(num 982)(puntos 5)(pos-x ?x) (pos-y 8))
  (not(ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2)))
  (not(ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x3) (pos-y ?y3)))
  (tiempo ?t)
=>
  (assert (mueve (num 982) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::busqueda52aba1
  (declare (salience 55))
  (ficha (equipo "A")(num 982)(puntos 5)(pos-x 1) (pos-y 8))
  (not(ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2)))
  (not(ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x3) (pos-y ?y3)))
  (tiempo ?t)
=>
  (assert (mueve (num 982) (mov 4) (tiempo ?t))))

(defrule EQUIPO-A::busqueda52der1
  (declare (salience 55))
  (ficha (equipo "A")(num 982)(puntos 5)(pos-x ?x) (pos-y 7))
  (not(ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2)))
  (not(ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x3) (pos-y ?y3)))
  (test (< ?x 8))
  (tiempo ?t)
=>
  (assert (mueve (num 982) (mov 1) (tiempo ?t))))

;---

; Pasado un tiempo, barremos la zona central

(defrule EQUIPO-A::busqueda52arri2
  (declare (salience 55))
  (ficha (equipo "A")(num 982)(puntos 5)(pos-x ?x) (pos-y ?y))
;  (ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2))
;  (ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x3) (pos-y ?y3))
  (test (< ?y 4))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num 982) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::busqueda52izq2
  (declare (salience 55))
  (ficha (equipo "A")(num 982)(puntos 5)(pos-x ?x) (pos-y 4))
;  (ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2))
;  (ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x3) (pos-y ?y3))
  (test (> ?x 1))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num 982) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::busqueda52arri3
  (declare (salience 55))
  (ficha (equipo "A")(num 982)(puntos 5)(pos-x 1) (pos-y 4))
;  (ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2))
;  (ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x3) (pos-y ?y3))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num 982) (mov 3) (tiempo ?t))))

(defrule EQUIPO-A::busqueda52der2
  (declare (salience 55))
  (ficha (equipo "A")(num 982)(puntos 5)(pos-x ?x) (pos-y 5))
;  (ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2))
;  (ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x3) (pos-y ?y3))
  (test (< ?x 8))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num 982) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::busqueda52aba2
  (declare (salience 55))
  (ficha (equipo "A")(num 982)(puntos 5)(pos-x 8) (pos-y 5))
;  (ficha (equipo "A")(num ?n2)(puntos 6)(pos-x ?x2) (pos-y ?y2))
;  (ficha (equipo "A")(num 911)(puntos 5)(pos-x ?x3) (pos-y ?y3))
  (tiempo ?t)
  (test (< ?t 140))
=>
  (assert (mueve (num 982) (mov 4) (tiempo ?t))))

; ---------- Ambas Fichas 5 ----------

; Ataques suicidas con las Fichas 5

(defrule EQUIPO-A::ataque5arri
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

defrule EQUIPO-A::ataque5izq
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque5der
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque5aba
  (declare (salience 30))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 5) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

; -------------------- REGLAS PARA LA FICHA 4 (CABALLERO) --------------------

; Si el 5 ha dejado descubierto al Rey lo protegemos

(defrule EQUIPO-A::protege4rey
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 4)(pos-x ?x) (pos-y 2))
  (not(ficha (equipo "A")(num ?n2)(puntos 5)(pos-x 8) (pos-y 2)))
  (test (< ?x 8))
  (tiempo ?t)
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

; -------------------- REGLAS PARA LA FICHA 3 (LANCERO) --------------------

; Si el 4 no protege al Rey lo protegemos

(defrule EQUIPO-A::protege3rey
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 3)(pos-x ?x) (pos-y 2))
  (not(ficha (equipo "A")(num ?n2)(puntos 4)(pos-x 8) (pos-y 2)))
  (test (< ?x 8))
  (tiempo ?t)
=>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

; Si la partida se acaba movemos los 3 hacia arriba

(defrule EQUIPO-A::busqueda3arri
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 3)(pos-x ?x) (pos-y ?y))
  (test (< ?y 5))
  (tiempo ?t)
  (test (< ?t 80))
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;---

; Ataques suicidas con las Fichas 3

(defrule EQUIPO-A::ataque3arri
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  (test (< ?t 80))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

defrule EQUIPO-A::ataque3izq
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  (test (< ?t 80))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque3der
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  (test (< ?t 80))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque3aba
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 3) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  (test (< ?t 80))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;---

; Si hay más fichas las Fichas 3 permanecen en las 2 primeras filas

(defrule EQUIPO-A::retaguardia3
  (declare (salience 35))
  (tiempo ?t)
  (ficha (equipo"A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 3))
  (ficha (equipo"A") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (<> ?n ?n2))
  (test (> ?y 2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

; -------------------- REGLAS PARA LA FICHA 2 (SOLDADO) --------------------

; Si la partida se acaba movemos los 2 hacia arriba

(defrule EQUIPO-A::busqueda2arri
  (declare (salience 55))
  (ficha (equipo "A")(num ?n)(puntos 2)(pos-x ?x) (pos-y ?y))
  (test (< ?y 5))
  (tiempo ?t)
  (test (< ?t 50))
=>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

;---

; Ataques suicidas con las Fichas 2

(defrule EQUIPO-A::ataque2arri
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (- ?y2 1)))
  (test (= ?x ?x2))
  (test (< ?t 50))
  =>
  (assert (mueve (num ?n) (mov 3) (tiempo ?t))))

defrule EQUIPO-A::ataque2izq
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (+ ?x2 1)))
  (test (= ?y ?y2))
  (test (< ?t 50))
  =>
  (assert (mueve (num ?n) (mov 2) (tiempo ?t))))

(defrule EQUIPO-A::ataque2der
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?x (- ?x2 1)))
  (test (= ?y ?y2))
  (test (< ?t 50))
  =>
  (assert (mueve (num ?n) (mov 1) (tiempo ?t))))

(defrule EQUIPO-A::ataque2aba
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo "A") (num ?n) (puntos 2) (pos-x ?x) (pos-y ?y))
  (ficha (equipo "B") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (= ?y (+ ?y2 1)))
  (test (= ?x ?x2))
  (test (< ?t 50))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

;---

; Si hay más fichas las Fichas 2 permanecen en las 2 primeras filas

(defrule EQUIPO-A::retaguardia2
  (declare (salience 35))
  (tiempo ?t)
  (ficha (equipo"A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 2))
  (ficha (equipo"A") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (<> ?n ?n2))
  (test (> ?y 2))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))

; -------------------- REGLAS PARA LA FICHA 1 (REY) --------------------

; Si hay más fichas el Rey no se mueve de la primera fila

(defrule EQUIPO-A::retaguardia1
  (declare (salience 60))
  (tiempo ?t)
  (ficha (equipo"A") (num ?n) (pos-x ?x) (pos-y ?y) (puntos 1))
  (ficha (equipo"A") (num ?n2) (pos-x ?x2) (pos-y ?y2))
  (test (<> ?n ?n2))
  (test (> ?y 1))
  =>
  (assert (mueve (num ?n) (mov 4) (tiempo ?t))))