La batalla del Guadalete
========================

Puede encontrar más información sobre el sistema en su web:
http://softwarelibre.uca.es:8080/Forja/proyectos/guadalete

Los ficheros que componen el paquete "La Batalla del Guadalete" son:
====================================================================

* instrucc.bat: carga todos los ficheros necesarios para la ejecución. En Linux se invoca con clips -f instrucc.bat

* funciones.clp: tiene funciones de uso general que se exportan a todos los módulos

* f1.clp: define plantillas, hechos generales y control de llamada a módulos desde MAIN

* mover.clp: hace un movimiento indicado por unidad de tiempo si es posible. El movimiento puede ser un desplazamiento o un atque con victoria, derrota o empate

* texto.clp: informa por pantalla (con el módulo INFORMAR) y si se ha muerto un rey quita el hecho tiempo para acabar la partida

* fA.clp: define el módulo EQUIPO-A (sólo eso, para que no se modifique)

* equipoA.clp: define las posiciones iniciales de la fichas. Tiene cuatro reglas de prioridad cero (mínima) y una regla para que en cuanto haya un movimiento seleccionado se quite el foco. A este fichero se le añadirán todas las reglas que desee el usuario

* fB.clp: define el módulo EQUIPO-B (sólo eso, para que no se modifique)

* equipoB.clp: define las posiciones iniciales de la fichas. Tiene cuatro reglas de prioridad cero (mínima) y una regla para que en cuanto haya un movimiento seleccionado se quite el foco. A este fichero se le añadirán todas las reglas que desee el usuario

* interfaz: es una interfaz gráfica para ver los resultados de la simulación
  en modo texto.


Requisitos:
===========

Para usar el sistema es necesario tener instalado CLIPS (y que su ejecutable
esté en el PATH).

Para la interfaz es necesaria la biblioteca SDL.


Cómo ejecutar el programa:
==========================

En el fichero "instrucc.bat" se puede indicar la semilla aleatoria cambiando
el número entero de la línea "(seed 1234)"

El fichero "instrucc.bat" es un script para CLIPS que carga todos los ficheros
necesarios y lanza la simulación. 

En Linux se invoca con clips -f instrucc.bat

Con INTRO se avanza un paso de simulación

Una vez termina se sale del entorno con "(exit)"

Si no se desea tener que estar pulsando INTRO se puede comentar la línea
"(readline)" del ficharo texto.clp (poniendo dos puntos al principio).

Para usar la interfaz se debe de hacer la simulación y después entrar en el
directorio "interfaz" y seguir las instrucciones del fichero "leeme.txt"
