#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pygame
from pygame.locals import *

from resistencia.xdg import get_data_path as xdg_data_path

class Ficha(pygame.sprite.Sprite):
    """
    Representa una ficha
    """
    def __init__(self, equipo, identificador, valor, x, y, descubierta, ocultarInicialmente = False):

        pygame.sprite.Sprite.__init__(self)

        self.x = x
        self.y = y
        self.valor = valor
        self.identificador = identificador
        self.descubierta = descubierta
        self.equipo = equipo
        self.ocultarInicialmente = ocultarInicialmente
        self.visible = True

        self.actualizarSuperficie()        

    def actualizarSuperficie(self, modificarCoordenadas = True):
        # Dependiendo del equipo elegiremos la pieza de un color u otro
        if self.equipo == 'A':
            imagenFicha = pygame.image.load(xdg_data_path("images/piece-orange.png"))
        else:
            imagenFicha = pygame.image.load(xdg_data_path("images/piece-violete.png"))

        # Cargamos la fuente para el rótulo con el valor de la ficha
        fuente = pygame.font.Font(xdg_data_path("fonts/LiberationMono-Bold.ttf"), 32)

        # Pintamos el rótulo en una superficie nueva
        if self.descubierta:
            imagenTexto = fuente.render("%d" % self.valor, 1, (255, 255, 255))
        else:
            imagenTexto = fuente.render("[%d]" % self.valor, 1, (255, 255, 255))

        # Bliteamos la superficie del texto en la superficie de la ficha original
        if self.descubierta:            
            imagenFicha.blit(imagenTexto, (19,11))
        elif not self.ocultarInicialmente:
            imagenFicha.blit(imagenTexto, (0,11))

        # Asignamos a la imagen de la ficha la superficie compuesta convertida
        self.image = imagenFicha.convert()

        if modificarCoordenadas:            
            # El rectángulo inicialmente será el de la imagen...
            self.rect = self.image.get_rect()

            # ... pero con las coordenadas acordes a la posición de la ficha en el tablero
            self.posicionDestino = self.toGlobal()

            self.posicionActual = self.posicionDestino

            self.rect.x, self.rect.y = self.posicionActual

        self.opacidad = 255
        

    def pintar (self, destino):
        if self.visible:
            # Para cuando está reviviendo
            if self.opacidad < 254:
                self.opacidad += 10

            # Si la posición HORIZONTAL actual no es la posición final
            if round(self.posicionActual[0]) != round(self.posicionDestino[0]):

                # Calculamos la variación de la posición
                variacion = (self.posicionDestino[0] - self.posicionActual[0]) / 15.0
                self.posicionActual[0] += variacion

            else:
                # Asignación para quitarnos los decimales
                self.posicionActual[0] = self.posicionDestino[0]
            
            # Lo mismo que antes pero para VERTICAL
            if 1 or round(self.posicionActual[1]) != round(self.posicionDestino[1]):
                variacion = (self.posicionDestino[1] - self.posicionActual[1]) / 15.0
                self.posicionActual[1] += variacion
            else:
                self.posicionActual[1] = self.posicionDestino[1]

        # Si no está visible y la opacidad es mayor, desvanecerlo
        elif self.opacidad > 1:
            self.opacidad -= 10

            
        # Actualizamos el rectángulo con la posición actual
        self.rect.x, self.rect.y = self.posicionActual

        # Le asignamos el alfa a la iamgen
        self.image.set_alpha(self.opacidad)

        # Bliteamos la imagen
        destino.blit(self.image, self.rect)

    def muerete(self):
        self.visible = False

    def revivete(self):
        self.visible = True

    def actualizate(self, datos):
        # Se llamará a esta función cuando se actualice la ficha con nuevos
        # atributos (posición y si está descubierta o no)
        self.posicionPrevia = self.posicionDestino
        self.x = datos[3]
        self.y = datos[4]

        # Si ha pasado de estar descubierta a no estarlo (o al revés)
        if self.descubierta != datos[5]:
            self.descubierta = datos[5]

            # Actualizamos la imagen
            self.actualizarSuperficie(False)
            
        self.posicionDestino = self.toGlobal()
    
    def toGlobal(self):
        # Pasa de coordenadas locales a globales
        return [float(10 + (self.x - 1) * 60),
                float(10 + (self.y - 1) * 60)]
