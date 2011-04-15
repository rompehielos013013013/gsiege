#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import pprint

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

        # Procesamos el fichero
        for i in range(len(lineasFichero)):
            line = lineasFichero[i]

            if ("tiempo" in line or "fin" in line) and i > 0:
                self.infoTurnos.append(fichasTurnoActual)
                fichasTurnoActual = {}
                self.turnosTotales += 1

            elif "e:" in line:
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

                fichasTurnoActual[t_e + t_id] = (t_e, t_id, int(t_val),
                                                 int(t_x), int(t_y), int(t_d))

    def esteTurno(self):
        return self.infoTurnos[self.turnoActual]

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
