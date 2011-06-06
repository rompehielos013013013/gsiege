#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pygame
from pygame.locals import *

from resistencia.xdg import get_data_path as xdg_data_path

class Boton(pygame.sprite.Sprite):
    """
    Representa un botón de la interfaz
    """

    def __init__(self, x, y, imagen, callback, activarImagenHover = True):
        pygame.sprite.Sprite.__init__(self)

        self.activarImagenHover = activarImagenHover

        # Asignamos la acción a realizar al hacer click
        self.callback = callback
        
        # Cargamos las imágenes
        self.imagenNormal = pygame.image.load(xdg_data_path(imagen + ".png")).convert_alpha()
        
        if self.activarImagenHover:
            self.imagenHover = pygame.image.load(xdg_data_path(imagen + "_sobre.png")).convert_alpha()

        #self.imagenActive = pygame.image.load(xdg_data_path(imagen + "_pulsada.png")).convert_alpha()

        # Definimos el rectángulo de acción 
        self.rect = self.imagenNormal.get_rect()
        self.rect.x = x
        self.rect.y = y

        # El estado por defecto es el normal
        self.estado = "normal"

    def pintar (self, destino):

        # Según el estado, se pinta una imagen u otra
        if not self.activarImagenHover or self.estado == "normal":
            destino.blit(self.imagenNormal, self.rect)
        elif self.estado == "hover":
            destino.blit(self.imagenHover, self.rect)

    def informarClick(self, pos):
        # Si el click se ha producido sobre el botón
        if self.rect.collidepoint(pos):

            # Llamamos a la función e callback
            self.callback()

    def informarHover(self, pos):
        # Si el ratón está encima del botón, pasamos al estado hover
        if self.rect.collidepoint(pos) and self.activarImagenHover:
            self.estado = "hover"
        else:
            self.estado = "normal"
