#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pygame
from pygame.locals import *

import sys
import pprint
import algoritmoDiferencias

# _Incluímos en el path de módulos el directorio raíz
sys.path.insert(0, "..")

from libguadalete import libguadalete, file_parser

class Ficha(pygame.sprite.Sprite):
    def __init__(self, equipo, identificador, valor, x, y, descubierta, visible = True):

        pygame.sprite.Sprite.__init__(self)

        self.x = x
        self.y = y
        self.valor = valor
        self.identificador = identificador
        self.descubierta = descubierta
        self.equipo = equipo
        self.visible = visible

        self.actualizarSuperficie()        

    def actualizarSuperficie(self):
        # Dependiendo del equipo elegiremos la pieza de un color u otro
        if self.equipo == 'A':
            imagenFicha = pygame.image.load("../data/images/piece-orange.png")
        else:
            imagenFicha = pygame.image.load("../data/images/piece-violete.png")

        # Cargamos la fuente para el rótulo con el valor de la ficha
        fuente = pygame.font.Font("../data/fonts/LiberationMono-Bold.ttf", 32)

        # Pintamos el rótulo en una superficie nueva
        imagenTexto = fuente.render("%d" % self.valor, 1, (255, 255, 255))

        # Bliteamos la superficie del texto en la superficie de la ficha original
        imagenFicha.blit(imagenTexto, (0,0))

        # Asignamos a la imagen de la ficha la superficie compuesta convertida
        self.image = imagenFicha.convert()

        # El rectángulo inicialmente será el de la imagen...
        self.rect = self.image.get_rect()

        # ... pero con las coordenadas acordes a la posición de la ficha en el tablero
        self.rect.x = 10 + (self.x - 1) * 60
        self.rect.y = 10 + (self.y - 1) * 60
        

class PintarPartida(object):
    
    def __init__(self, ficheroOrigen, team_a, team_b, path_piece_def, xml_file,
                 hidden=False, cant_draw=False):
        
        self.team_a = team_a
        self.team_b = team_b
        self.path_piece_def = path_piece_def
        self.xml_file = xml_file
        self.hidden = hidden
        self.cant_draw = cant_draw

        self.fps = 60.0
        self.intervalo = 1.0 / 60.0 * 1000.0
        self.ticksAnterior = pygame.time.get_ticks()

        print "Parseando el fichero de juego..."
        entire_game, winner = file_parser.parse_file(ficheroOrigen)

        # Guardamos el tablero inicial
        self.tableroInicial = entire_game[0]

        # Calculamos las jugadas realizadas
        #self.conjuntoJugadas = algoritmoDiferencias.compararJuegoCompleto(entire_game)

        self.fichas = {}

        self.parseador = algoritmoDiferencias.ParseadorPartida(ficheroOrigen)

        print "Init terminado!!"

    def run(self):
        print "Run..."

        print "Inicializando pygame..."
        pygame.init()

        print "Estableciendo el modo de pantalla..."
        self.pantalla = pygame.display.set_mode((760, 560))

        print "Estableciendo el título de la ventana..."
        pygame.display.set_caption("Reproducir partida")

        print "Cargando imagen de fondo..."
        self.imagenFondo = pygame.image.load("../data/images/fondo.png")

        print "Convirtiendo la imagen de fondo al formato adecuado..."
        self.imagenFondo = self.imagenFondo.convert_alpha()

        print "Parseando el estado inicial..."
        organizacionInicial = self.parseador.avanzarTurno()

        for keyFicha in organizacionInicial.keys():
            ficha = organizacionInicial[keyFicha];
            self.fichas[ficha] = Ficha(ficha[0], ficha[1], ficha[2], 
                                       ficha[3], ficha[4], ficha[5])

        while True:
            for eventos in pygame.event.get():
                if eventos.type == QUIT:
                    sys.exit(0)
                elif eventos.type == KEYDOWN and eventos.key == 275:
                    nuevasFichas = self.parseador.avanzarTurno()
 
            # Pintamos el fondo
            self.pantalla.blit(self.imagenFondo, (0, 0))

            for keyFicha in self.fichas:
                self.pantalla.blit(self.fichas[keyFicha].image, self.fichas[keyFicha].rect)

            # Volcamos la pantalla a la gráfica
            pygame.display.flip()

            ##############################
            # GESTIÓN DE LOS FPS

            # Cogemos los ticks actuales
            ticksActual = pygame.time.get_ticks()

            # Esperamos el tiempo necesario para mantener los FPS
            pygame.time.delay(int(self.intervalo - (ticksActual - self.ticksAnterior)))

            # Actualizamos los ticks anteriores
            self.ticksAnterior = ticksActual

        return 0


def main():
    """
    """

    P = PintarPartida('../data/games/game_2011-04-08_17:23:03_AA-vs-PalomoPalomo.txt',1,2,3,4)
    P.run()
    

if __name__ == '__main__':
    main()
