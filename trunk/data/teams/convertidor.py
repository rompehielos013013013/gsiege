#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re

def main():
    """
    """

    for fichero in os.listdir("."):        
        if os.path.isfile(fichero):
            if len(os.path.splitext(fichero)) > 1 and os.path.splitext(fichero)[1] == ".clp":
                ficheroActual = open(fichero, "r")
                nuevoFichero = open(os.path.splitext(fichero)[0] + ".form", "w")
                
                posiciones = [[0 for x in range(8)] for y in range(2)]

                for linea in ficheroActual.readlines():
                    if linea[0] == ";" or linea.find("ficha-r") == -1:
                        continue

                    linea = linea.strip()
                    linea = re.sub('\s+',' ', linea)

                    valor = linea[linea.find("puntos ") + 7:][:1]
                    posx = int(linea[linea.find("pos-x ") + 6][:1]) - 1
                    posy = 2 - int(linea[linea.find("pos-y ") + 6][:1])
                    try:
                        posiciones[posy][posx] = valor                    
                    except IndexError:
                        print "Fichero %s, error en (%i,%i) valor = %i" % (ficheroActual.name, posx, posy, valor)
                    
                nuevoFichero.write("\n".join([":".join(x) for x in posiciones]))
                nuevoFichero.write("\n")
                ficheroActual.close()
                nuevoFichero.close()

                print "Convertido", ficheroActual.name, "al nuevo formato", nuevoFichero.name

if __name__ == '__main__':
    main()
