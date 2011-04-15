#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import pprint

def compararTableros(tableroA, tableroB):
    cambios = []
    for i in range(8):
        for j in range(8):
            if tableroA[i][j] != tableroB[i][j]:
                cambios.append((i,j))

    diferencias = []

    # Si solo hay una diferencia entre los dos tableros, se trata de una ficha
    # que ha movido y ha desaparecido
    if len(cambios) == 1:
        i,j = cambios[0]
        diferencias.append(("muerte", tableroA[i][j], (i,j), ()))

    # Si hay dos cambios, es que una ficha se ha movido a otra posición, con
    # varias posibles consecuencias
    elif len(cambios) == 2:
        x1, y1 = cambios[0]
        x2, y2 = cambios[1]

        # Si la posición a la que se movió estaba vacía, se trata de un
        # movimiento simple (caso 1, de un lado al otro)

        # [X| ] => [ |X]
        if (tableroA[x1][y1] != 0 and tableroA[x2][y2] == 0 and
            tableroB[x1][y1] == 0 and tableroB[x2][y2] != 0):
            diferencias.append(("movimiento", tableroA[x1][y1], (x1,y1), (x2, y2)))

        # Lo mismo para el movimiento inverso
        # [ |X] => [X| ]
        elif (tableroA[x1][y1] == 0 and tableroA[x2][y2] != 0 and
              tableroB[x1][y1] != 0 and tableroB[x2][y2] == 0):
            diferencias.append(("movimiento", tableroB[x1][y1], (x2, y2), (x1,y1)))

        # Una ficha se mueve y se come a otra
        # [X|Y] => [ |X]
        elif (tableroA[x1][y1] != 0 and tableroA[x2][y2] != 0 and
              tableroB[x1][y1] == 0 and tableroB[x2][y2] != 0):
            diferencias.append(("movimiento", tableroA[x1][y1], (x1,y1), (x2, y2)))
            diferencias.append(("muerte", tableroA[x2][y2], (x2, y2), ()))

        # Una ficha se mueve y se come a otra (movimiento inverso)
        #[Y|X] => [X| ]
        elif (tableroA[x1][y1] != 0 and tableroA[x2][y2] != 0 and
              tableroB[x1][y1] != 0 and tableroB[x2][y2] == 0):
            diferencias.append(("movimiento", tableroA[x2][y2], (x2,y2), (x1, y1)))
            diferencias.append(("muerte", tableroA[x1][y1], (x1, y1), ()))       

        # Una ficha se mueve contra otra de su mismo valor y ambas mueren
        #[X|Y] => [ | ]
        elif (tableroA[x1][y1] != 0 and tableroA[x2][y2] != 0 and
              tableroB[x1][y1] == 0 and tableroB[x2][y2] == 0):
            diferencias.append(("muerte", tableroA[x1][y1], (x1, y1), ()))       
            diferencias.append(("muerte", tableroA[x2][y2], (x2, y2), ()))       

    return diferencias


def compararJuegoCompleto(juego):
    movimientosTotales = []
    for i in range(len(juego) - 1):
        movimientos = compararTableros(juego[i], juego[i+1])
        movimientosTotales.append(movimientos)

    return movimientosTotales


class ParseadorPartida(object):
    def __init__(self, ficheroOrigen):
        f = open(ficheroOrigen)
        self.lineasFichero = f.readlines()
        f.close()
        
        self.lineaActual = 0
        
    def l(self):
        return self.lineasFichero[self.lineaActual].rstrip()

    def avanzarTurno(self):
        infoFichas = {}
        line = self.lineasFichero[self.lineaActual]

        # En teoría, obligatoriamente deberíamos estar en esta línea
        if ("tiempo" in line):
            # Saltamos la línea con el número del turno
            self.lineaActual += 2
            line = self.l()

            while ("tiempo" not in line and 
                   "fin" not in line and
                   self.lineaActual < len(self.lineasFichero)):

                pos_e = line.find("e")
                pos_id = line.find("n")
                pos_val = line.find("p")
                pos_x = line.find("x")
                pos_y = line.find("y")
                pos_d = line.find("d")
                    
                t_e = line[pos_e + 2 : pos_id - 1]
                t_id = line[pos_id + 2 : pos_val - 1]
                t_val = line[pos_val + 2 : pos_x - 1]
                t_x = line[pos_x + 2 : pos_y - 1]
                t_y = line[pos_y + 2 : pos_d - 1]
                t_d = line[pos_d + 2 : ]

                infoFichas[t_e + t_id] = (t_e, t_id, int(t_val),
                                          int(t_x), int(t_y), int(t_d))
                
                self.lineaActual = self.lineaActual + 1
                line = self.l()
                    
        return infoFichas
                
