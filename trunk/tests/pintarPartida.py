#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pygame

class PintarPartida(object):
    """
    """
    
    def __init__(self, ficheroOrigen, team_a, team_b, path_piece_def, xml_file,
                 hidden=False, cant_draw=False):
        
        self._ficheroOrigen = ficheroOrigen
        self._team_a = team_a
        self._team_b = team_b
        self._path_piece_def = path_piece_def
        self._xml_file = xml_file
        self._hidden = hidden
        self._cant_draw = cant_draw

        
        

