#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Copyright (C) 2011 José Tomás Tocino García <theom3ga@gmail.com>

# Autor: José Tomás Tocino García

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.

import gtk
import cairo
import pprint

class DibujoClasificacion(gtk.Window):

    def __init__(self, game):
        super(DibujoClasificacion, self).__init__()
        
        self.set_title("Resultados")

        self.set_size_request(680, 480)
        self.set_resizable(False)
        self.set_position(gtk.WIN_POS_CENTER)


        self.connect("destroy", gtk.main_quit)

        barritas = gtk.ScrolledWindow()
        barritas.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)

        viewport = gtk.Viewport()

        darea = gtk.DrawingArea()
        darea.connect("expose-event", self.expose)

        barritas.add(viewport)
        viewport.add(darea)

        self.add(barritas)

        self.numeroRondas = game.get_number_of_rounds()
        self.resultados = []

        for q in range(self.numeroRondas):
            self.resultados.append(game.get_round(q).get_round_results())

        pprint.pprint(self.resultados)

        self.anchoBloque = 140
        self.altoBloque = 24
        self.separacionHorizontal = 20
        self.separacionVertical = 48

        self.show_all()
    
    def pintar_bloque_equipo(self, destino, x, y, equipo1, ganador = False):

        textPaddingHorizontal = 5
        textPaddingVertical = 16

        if ganador:
            destino.set_source_rgb(105./255., 196./255., 20./255.)
        else:
            destino.set_source_rgb(0.7, 0.7, 0.7)

        destino.move_to(x,y)
        destino.line_to(x + self.anchoBloque, y)
        destino.line_to(x + self.anchoBloque, y + self.altoBloque)
        destino.line_to(x, y + self.altoBloque)
        destino.line_to(x, y)
        destino.stroke()

        if ganador:
            destino.set_source_rgb(0.9, 1, 0.9)
        else:
            destino.set_source_rgb(0.9, 0.9, 0.9)

        destino.rectangle(x, y, self.anchoBloque, self.altoBloque)
        destino.fill()

        if ganador:            
            destino.select_font_face("Monospace", cairo.FONT_SLANT_NORMAL, cairo.FONT_WEIGHT_BOLD)
        else:
            destino.select_font_face("Monospace", cairo.FONT_SLANT_NORMAL)

        destino.set_font_size(13)
        destino.set_source_rgba(0,0,0,0.5)
        destino.move_to(x + textPaddingHorizontal, y + textPaddingVertical)
        destino.show_text(str(equipo1)[:16])

    def pintar_bloque_partido (self, destino, partido, x, y):
        self.pintar_bloque_equipo(destino, x, y, 
                                  partido[0][0], (partido[1] == 1))
        self.pintar_bloque_equipo(destino, x, y + self.altoBloque, 
                                  partido[0][1], (partido[1] != 1))        

    def pintar_ronda(self, destino, datos, numRonda, ultimaRonda = False):
        inicialX = 10 + numRonda * (self.anchoBloque + self.separacionHorizontal)
        inicialY = 10 + ((2 ** numRonda) - 1) * self.separacionVertical
        separacion = 2 ** (numRonda + 1) * self.separacionVertical
        
        for i in range(len(datos)):
            partido = datos[i]
            posY = inicialY + i * separacion

            self.pintar_bloque_partido(destino, partido, inicialX,
                                       posY)


        destino.set_source_rgb(0.1, 0.1, 0.1)

        # destino.move_to(x,y)
        # destino.line_to(x + self.anchoBloque, y)
        # destino.line_to(x + self.anchoBloque, y + self.altoBloque)
        # destino.line_to(x, y + self.altoBloque)
        # destino.line_to(x, y)
        # destino.stroke()

        if ultimaRonda:
            return

        for i in range(0, len(datos), 2):
            posY = inicialY + i * separacion + self.altoBloque

            destino.move_to(inicialX + self.anchoBloque,
                            posY)

            destino.line_to(inicialX + self.anchoBloque + self.separacionHorizontal,
                            posY + separacion / 2)

            destino.line_to(inicialX + self.anchoBloque,
                            posY + separacion)

        
        destino.stroke()
                            



    def expose(self, widget, event):
        cr = widget.window.cairo_create()

        # Ajustamos el tamaño del widget al dibujo de los resultados
        widget.set_size_request(len(self.resultados) * (self.anchoBloque + self.separacionHorizontal),
                                len(self.resultados[0]) * (self.altoBloque * 2 + self.separacionVertical))

        for q in range(len(self.resultados)):
            self.pintar_ronda(cr, self.resultados[q], q, q == len(self.resultados) - 1)

        # self.bloque_equipo(cr, 10, 10, 'pepep')
        # self.bloque_equipo(cr, 100, 10, '12345678901234567890', True)
