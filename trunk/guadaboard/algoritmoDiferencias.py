#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import pprint

class ParseadorPartida(object):
    def __init__(self, ficheroOrigen):
        f = open(ficheroOrigen)
        self.lineasFichero = f.readlines()
        f.close()
        
        self.lineaActual = 0
        self.turno = 0
        
    def l(self):
        return self.lineasFichero[self.lineaActual].rstrip()

    def retrocederTurno(self):
        print "Retroceder turno (II) ", self.turno
        if self.turno == 1:
            return None

        while "tiempo" not in self.l() and self.lineaActual > 0:
            self.lineaActual -= 1

        return self.avanzarTurno()

    def avanzarTurno(self):
        print "ParseadorPartida::avanzarTurno"
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
                    
        self.turno += 1
        return infoFichas
                
