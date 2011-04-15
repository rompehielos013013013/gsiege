# -*- coding: utf-8 -*-
###############################################################################
# This file is part of Resistencia Cadiz 1812.                                #
#                                                                             #
# This program is free software: you can redistribute it and/or modify        #
# it under the terms of the GNU General Public License as published by        #
# the Free Software Foundation, either version 3 of the License, or           #
# any later version.                                                          #
#                                                                             #
# This program is distributed in the hope that it will be useful,             #
# but WITHOUT ANY WARRANTY; without even the implied warranty of              #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
# GNU General Public License for more details.                                #
#                                                                             #
# You should have received a copy of the GNU General Public License           #
# along with this program.  If not, see <http://www.gnu.org/licenses/>.       #
#                                                                             #
# Copyright (C) 2010, Pablo Recio Quijano, <pablo.recioquijano@alum.uca.es>   #
###############################################################################
"""
Main module that handle the representation of a entire game
"""

import os

import pygame
from pygame import mixer

import gtk

from guadaboard import pintarPartida

from libguadalete import libguadalete, file_parser, stats
from libguadalete.libguadalete import FileError as LibFileError

from resistencia import filenames, configure
from resistencia.xdg import get_data_path as xdg_data_path
from resistencia.gui import notify_result


class Error(Exception):
    """Base class for exceptions in this module."""
    pass


class GuadaFileError(Error):
    """
    Exception to handle the error parsing a file
    """
    def __init__(self, msg):
        self.msg = msg

def _handle_draw(entire_game, winner):
    """
    Handle the tie if the game cant draw
    """
    if not winner == 0:
        return winner
    else:  # if it's a draw
        num_a = 0
        num_b = 0
        _sum = 0
        final_board = entire_game[-1]
        _num = len(final_board)

        for i in range(_num):
            for j in range(_num):
                _value = final_board[i][j]
                _sum = _sum + _value
                if not _value == 0:
                    if _value > 0:
                        num_a = num_a + 1
                    else:
                        num_b = num_b + 1
        if not _sum == 0:  # a team has more _sum of values than the other
            if _sum > 0:
                return 1
            else:
                return -1
        else:  # both has the same _sum of values
            if not num_a == num_b:  # a team has more pieces than the other
                if num_a > num_b:
                    return 1
                else:
                    return -1
            else:  # both have the same number of pieces.

                return -1  # B team is in disvantage


def _load_game_from_file(src_file, team_a, team_b, path_piece_def, xml_file,
                         hidden=False, cant_draw=False):
                         

    entire_game, winner = file_parser.parse_file(src_file)
    if cant_draw:
        winner = _handle_draw(entire_game, winner)

    if winner == 0:
        print u'Empate'
    elif winner == 1:
        print u'Ganó %s' % team_a[0]
    else:
        print u'Ganó %s' % team_b[0]

    music = False
    if configure.load_configuration()['music_active'] == '1':
        music = True

    P = pintarPartida.PintarPartida(src_file, team_a, team_b, music, hidden, cant_draw)
    P.run()

    show_dialog_result((team_a[0], team_b[0]), winner)

def get_collision(point, rects):
    """
    Function that checks if it is a collision with the buttons
    """
    res = ''
    for index in rects:
        rect = rects[index]
        if rect.collidepoint(point):
            res = index
            break

    return res


def run(team_a, team_b, fast=False, dont_log=False, hidden=False,
        number_turns=100,
        path_piece_def=xdg_data_path('images/piece-default.png'),
        xml_file=xdg_data_path('layouts/main-layout.xml'),
        get_stats=False, cant_draw=False):
    """
    Runs a game using the system expert teams given. It calls to libguadalete,
    generating the game and parsing the file.
    """
    
    # Preparamos el motor con los equipos y el número de turnos
    lib = libguadalete.LibGuadalete(team_a[0], team_b[0], number_turns)
    
    try:
        # Procesamos el juego, obteniendo el fichero de log y el ganador
        out_file, winner = lib.run_game()
    except LibFileError as exc:
        raise GuadaFileError(exc.msg)
        
    # fast indica si queremos ver solo el resultado (fast = True) o la partida
    # completa
    if not fast:
        name_team_a = filenames.extract_name_expert_system(team_a[0])
        name_team_b = filenames.extract_name_expert_system(team_b[0])
        
        # Aquí es donde se llama a la función que gestiona el dibujado del juego
        _load_game_from_file(out_file, 
                             (name_team_a, team_a[1]),
                             (name_team_b, team_b[1]), 
                             path_piece_def,
                             xml_file, hidden, cant_draw=cant_draw)
        
    # Si no puede haber empate
    if cant_draw:
        # Solucionar el empate
        entire_game, winner = file_parser.parse_file(out_file)
        winner = _handle_draw(entire_game, winner)
        
    # Preparamos la variable de retorno
    res = winner
    
    if get_stats:
        res = (winner, stats.get_game_file_stats(out_file))
        
    if dont_log or get_stats:
        os.remove(out_file)
        
    return res


def run_from_file(src_file,
                  team_a=('equipoA', xdg_data_path('images/piece-orange.png')),
                  team_b=('equipoB', xdg_data_path('images/piece-violete.png')),
                  path_piece_def=xdg_data_path('images/piece-default.png'),
                  xml_file=xdg_data_path('layouts/alternative-layout.xml')):
    """
    Muestra un juego en pantalla directamente desde un fichero de un juego
    previamente simulado
    """
    name_a, name_b = filenames.extract_names_from_file(src_file)
    team_a = (name_a, team_a[1])
    team_b = (name_b, team_b[1])
    _load_game_from_file(src_file, 
                         team_a, team_b,
                         path_piece_def, xml_file)



def show_dialog_result((name_team_a, name_team_b), winner):
    """
    Simple function that show a dialog with the result of a game
    """
    _not_dig = notify_result.notifyResult((name_team_a, name_team_b), winner)
    _not_dig.dlg_result.run()

    while gtk.events_pending():
        gtk.main_iteration(False)
