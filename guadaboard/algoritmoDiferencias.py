#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re

class ParseadorPartida(object):
    def __init__(self, ficheroOrigen):
        # Abrimos el fichero a procesar
        f = open(ficheroOrigen)

        # Leemos todas las líneas
        lineasFichero = f.readlines()

        # Cerramos el fichero
        f.close()

        # Contador de turnos totales
        self.turnosTotales = 0

        # Indicador del turno actual
        self.turnoActual = 0

        # Esta lista guardará las fichas de cada turno
        self.infoTurnos = []

        # Contenedor temporal para las fichas de este turno
        fichasTurnoActual = {}

        self.turnoMax = -1

        # Procesamos el fichero
        for i in range(len(lineasFichero)):

            # Cogemos la línea actual. No se ha usado un for-in para poder
            # llevar el índice
            line = lineasFichero[i]

            # Si se trata de alguna línea divisoria
            if ("tiempo" in line or "fin" in line) and i > 0:

                # Metemos la información de las fichas en el contenedor general
                self.infoTurnos.append(fichasTurnoActual)

                # Reiniciamos el contenedor temporal
                fichasTurnoActual = {}

                # Aumentamos el número de puntos
                self.turnosTotales += 1

            elif re.match("^[0-9]+$", line) and self.turnoMax == -1:
                self.turnoMax = int(line) + 1

            # Para las líneas de ficha
            elif "e:" in line:

                # Posiciones de los campos
                pos_e = line.find("e")
                pos_id = line.find("n")
                pos_val = line.find("p")
                pos_x = line.find("x")
                pos_y = line.find("y")
                pos_d = line.find("d")

                # Valores de los campos
                t_e = line[pos_e + 2 : pos_id - 1]
                t_id = line[pos_id + 2 : pos_val - 1]
                t_val = line[pos_val + 2 : pos_x - 1]
                t_x = line[pos_x + 2 : pos_y - 1]
                t_y = line[pos_y + 2 : pos_d - 1]
                t_d = line[pos_d + 2 : ]

                # Escribimos en el contenedor temporal de fichas
                fichasTurnoActual[t_e + t_id] = (t_e, t_id, int(t_val),
                                                 int(t_x), int(t_y), int(t_d))

    def esteTurno(self):
        return self.infoTurnos[self.turnoActual]

    def getNumTurnoActual(self):
        return self.turnoActual + 1

    def getNumTurnoTotal(self):
        return self.turnosTotales

    def getNumTurnosRestantes(self):
        return self.turnosTotales - self.turnoActual - 1

    def getNumTurnoMax(self):
        return self.turnoMax

    def retrocederTurno(self):
        if self.turnoActual > 0:
            self.turnoActual -= 1

        return self.infoTurnos[self.turnoActual]

    def avanzarTurno(self):
        if self.turnoActual < self.turnosTotales - 1:
            self.turnoActual += 1

        return self.infoTurnos[self.turnoActual]

    def avanzarFinal(self):
        self.turnoActual = self.turnosTotales - 1
        return self.infoTurnos[self.turnoActual]

    def retrocederInicio(self):
        self.turnoActual = 0
        return self.infoTurnos[self.turnoActual]

    def calcularFichasMuertas(self):
        fichasPermitidas = [{
            1:1,
            2:8,
            3:2,
            4:2,
            5:2,
            6:1   
            },{
            1:1,
            2:8,
            3:2,
            4:2,
            5:2,
            6:1   
            }]

        for f in self.infoTurnos[self.turnoActual].keys():
            ficha = self.infoTurnos[self.turnoActual][f]

            if ficha[0] == "A":
                fichasPermitidas[0][ficha[2]] = fichasPermitidas[0][ficha[2]] - 1
            else:
                fichasPermitidas[1][ficha[2]] = fichasPermitidas[1][ficha[2]] - 1

        return fichasPermitidas
        
