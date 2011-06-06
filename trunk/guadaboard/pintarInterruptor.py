#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pygame
from pygame.locals import *

from resistencia.xdg import get_data_path as xdg_data_path

class Interruptor(pygame.sprite.Sprite):
    def __init__ (self, x, y, imagen, callback):
        self.callback = callback

        # Cargamos las imágenes
        self.imagenNormal = pygame.image.load(xdg_data_path(imagen + ".png")).convert_alpha()
        self.imagenToggled = pygame.image.load(xdg_data_path(imagen + "_toggled.png")).convert_alpha()
        
        self.rect = self.imagenNormal.get_rect()
        self.rect.x = x
        self.rect.y = y

        self.estado = "normal"

    def pintar (self, destino):
        if self.estado == "normal":
            destino.blit(self.imagenNormal, self.rect)
        else:
            destino.blit(self.imagenToggled, self.rect)

    def informarHover(self, pos):
        pass

    def informarClick(self, pos):
        if self.rect.collidepoint(pos):
            if self.estado == "normal":
                self.estado = "toggled"
            else:
                self.estado = "normal"

            self.callback()                  
