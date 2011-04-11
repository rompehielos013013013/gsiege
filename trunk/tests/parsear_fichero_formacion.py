#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import pprint

def parsear_fichero_formacion(rutaFichero):
    """Parsea el fichero de formación en formato texto y genera el clp 
    """
    try:
        fichero = open(rutaFichero, "r")    
    except IOError:
        return ""

    fichas = {}
    for q in range(1,7):
        fichas[q] = []
        
    posicionesOcupadas = [[0 for y in range(1,3)] for x in range(1, 9)]
        
    expReg = re.compile (r"^([1-6]):([1-8]),([1-2])$")
    for linea in fichero.readlines():
        linea = linea.rstrip().replace(" ", "")
        m = expReg.match(linea)
        if m:
            ficha = int(m.group(1))
            x = int(m.group(2))
            y = int(m.group(3))
            fichas[ficha].append((x,y))
            posicionesOcupadas[x-1][y-1] = 1
            
    return (fichas, posicionesOcupadas)    

def comprobar_fichas(datos):
    fichas = datos[0]
    posicionesOcupadas = datos[1]
    
    fichasPermitidas = {
        1:1,
        2:8,
        3:2,
        4:2,
        5:2,
        6:1    
    }

    # Comprobamos cuántas fichas de cada hay       
    conteoDeFichas = {}
    
    for ficha_actual in fichas.keys():
        if len(fichas[ficha_actual]) < fichasPermitidas[ficha_actual]:
            print "LESS"
        elif len(fichas[ficha_actual]) > fichasPermitidas[ficha_actual]:
            print "MORE"
        else:
            print "GUD"
    
                
def main():
    datos = parsear_fichero_formacion("formacionEquipo")
    comprobar_fichas(datos)
    
if __name__ == '__main__':
    main()
