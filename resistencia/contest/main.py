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

import os
import types

import sys
import gtk

from resistencia import configure, filenames, xdg
from resistencia.gui import round_results
from resistencia.gui import progress_bar_dialog as pbs

from resistencia.nls import gettext as _

import league
import contest
import tournament
import controlPartida
import round
import pprint
import dibujo_clasificacion

def init_contest(contest_format, teams, fast=False, back_round=False,
                 num_turns=120):

    print "#### INIT CONTEST"
    
    controlPartida.restaurarCampeonato()

    if contest_format == 'playoff':
        _init_playoff(_clean_dictionary(teams), fast, num_turns, back_round)
    else:
        _init_game(contest_format, _clean_dictionary(teams), fast, num_turns, back_round)

    print "#### END CONTEST"

def update_log_round(log_file, results, round_number):
    tournament_file = open(log_file, 'a')

    tournament_file.write('* Ronda ' + str(round_number + 1) + ":\n")

    for match in results:
        teamA = match[0][0]
        teamB = match[0][1]

        s = '  ' + teamA + ' vs ' + teamB + "\n"
        tournament_file.write(s)

        res = ''
        if match[1] == 0:
            res = '    Empate'
        elif match[1] == 1:
            res = '    Gana ' + teamA
        else: #match[2] == -1:
            res = '    Gana ' + teamB
            
        tournament_file.write(res + "\n")

        tournament_file.write("\n")

    tournament_file.close()

def update_log_end(log_file_name, results):
    log_file = open(log_file_name, 'a')
    log_file.write('** CLASIFICACIÓN FINAL\n')

    for clasificado in results:
        log_file.write('{0:2d} - {1}\n'.format(clasificado[1], clasificado[0]))

    log_file.close()

def generate_log_file_name(prefix='pachanga'):
    base_path = configure.load_configuration()['games_path'] + '/'
    return base_path + filenames.generate_filename(prefix)

def show_round_matches(game):
    # Cogemos los partidos de la ronda actual
    thisRoundMatches = game.matchs[game.get_round_number()];

    # Formateamos el mensaje a mostrar
    messageToShow = ""
    for m in thisRoundMatches:
        if m[0] == "aux_ghost_team":
            messageToShow += m[1] + " descansa"
        elif m[1] == "aux_ghost_team":
            messageToShow += m[0] + " descansa"
        else:
            messageToShow += m[0] + " vs " + m[1]

        messageToShow += "\n\n"
        
    # Mostramos el mensaje
    myDialog = gtk.MessageDialog(None,
                                 gtk.DIALOG_MODAL, gtk.MESSAGE_INFO, gtk.BUTTONS_CLOSE,
                                 "Emparejamientos")
    myDialog.format_secondary_text(messageToShow)
    myDialog.run()
    myDialog.destroy()

def _init_game(game_type, teams, fast, num_turns, back_round = False):

    print ">>>> INIT GAME"

    # Lanzamos el tipo de juego apropiado
    if game_type == 'cup':
        game = tournament.Tournament(teams, num_turns)
    else:
        game = league.League(teams, num_turns, back_round)

    band = False

    # Generamos el nombre del fichero de log según el tipo de juego
    log_file_name = generate_log_file_name(game_type)

    # Contenedor para clasificaciones
    classifications = {}

    results = None

    # Mientras no se haya completado el juego
    while not game.completed() and not band and not controlPartida.flagCancelarCampeonato:

        print "---- START OF THE ROUND"

        if results != None:

            # Cargamos el diálogo de resultados
            R = round_results.roundResults(classifications, results,
                                           game.get_prev_round_number() + 1,
                                           game.get_number_of_rounds(),
                                           show_classifications = (game_type != 'cup'))

        # Mostramos el diálogo de resultados
            button_pressed = R.result_dialog.run()
        
            while gtk.events_pending():
                gtk.main_iteration(False)
            
            if button_pressed == -4 or button_pressed == 0:
                band = True
                continue


        # Guardamos el número de la ronda
        roundNumber = game.get_round_number()

        # Mostramos los emparejamientos iniciales
        show_round_matches(game)

        # Por defecto que la barra de progreso no exista
        progress_bar = None

        # Si no mostramos el progreso del juego, que salga la barra
        if fast:
            progress_bar = pbs.ProgressBarDialog(None, _('Running the contest'))
            progress_bar_dialog = progress_bar.progress_bar_dialog
            progress_bar.set_num_elements(game.get_round(roundNumber).number_games)
            progress_bar_dialog.show()

            while gtk.events_pending():
                gtk.main_iteration(False)
    
        # Jugamos esta ronda
        game.play_round(progress_bar, fast)

        if controlPartida.flagCancelarCampeonato:
            return
        
        # Guardamos en r la ronda actual, con sus resultados y tal
        r = game.get_round(roundNumber)
        
        # Resultados de la ronda
        results = r.get_round_results()

        # Actualizamos el fichero del log
        update_log_round(log_file_name, results, roundNumber)

        if game_type == 'cup':
            winners_of_this_round = set()
            for m in results:
                if m[1] == 1:
                    winners_of_this_round.add(m[0][0])
                elif m[1] == -1:
                    winners_of_this_round.add(m[0][1])

            classifications[roundNumber] = winners_of_this_round
        else:
            # "Puntuations" es una palabra que no existe
            classifications = game.get_actual_puntuations()

        # Ocultamos la barra de progreso (que ya habrá acabado)
        if fast:
            progress_bar_dialog.hide()

        print "---- END OF THE ROUND"

    # Mostramos los resultados FINALES
    R = round_results.roundResults(classifications, results,
                                   game.get_prev_round_number() + 1,
                                   game.get_number_of_rounds(),
                                   show_classifications = (game_type != 'cup'))

    # Mostramos el diálogo de resultados
    button_pressed = R.result_dialog.run()
        
    while gtk.events_pending():
        gtk.main_iteration(False)
            
    if not band and not controlPartida.flagCancelarCampeonato:
        if game_type == 'cup':
            log_file = open(log_file_name, 'a')
            log_file.write("** CLASIFICACIÓN FINAL\n")
            processed_players = set()

            print classifications

            for i in reversed(classifications.keys()):
                currentSet = classifications[i].difference(processed_players)
                for elm in currentSet:
                    log_file.write(str(game.get_number_of_rounds() - i) + ' - ' + elm + "\n")

                processed_players.update(currentSet)

            log_file.close()

            dibujoClasificacion = dibujo_clasificacion.DibujoClasificacion(game)

        else:        
            update_log_end(log_file_name, classifications)
        
    print ">>>> END INIT GAME"

def _init_playoff(teams, fast, num_turns, back_round):
    l = league.League(teams, num_turns, back_round)

    band = False
    
    log_file_name = generate_log_file_name('playoff')
    while not l.league_completed and not band and not controlPartida.flagCancelarCampeonato:
        i = l.get_round_number()
        show_round_matches(l)
        progress_bar = None
        if fast:
            progress_bar = pbs.ProgressBarDialog(None,
                                                 _('Running the contest'))
            progress_bar_dialog = progress_bar.progress_bar_dialog
            progress_bar.set_num_elements(l.get_round(i).number_games)
            progress_bar_dialog.show()
            while gtk.events_pending():
                gtk.main_iteration(False)
        l.play_round(progress_bar, fast)

        if controlPartida.flagCancelarCampeonato:
            return

        r = l.get_round(i)
        
        classifications = l.get_actual_puntuations()
        results = r.get_round_results()
        update_log_round(log_file_name, results, i)

        R = round_results.roundResults(classifications, results,
                                       l.get_prev_round_number() + 1,
                                       l.get_number_of_rounds(),
                                       show_top_teams=True)
        if fast:
            progress_bar_dialog.hide()
        button_pressed = R.result_dialog.run()
        
        while gtk.events_pending():
            gtk.main_iteration(False)
            
        if button_pressed == -4 or button_pressed == 0:
            band = True

    if not band and not controlPartida.flagCancelarCampeonato:
        band = False
        teams = _get_teams_next_round(teams, _extract_classifications(classifications))
        _init_game('cup', teams, fast, num_turns)

    update_log_end(log_file_name, classifications)
    print "##### END PLAYOFF"

        


def _clean_dictionary(d):
    if type(d) == types.ListType:
        return d
    else:
        l = []
        for k in d:
            l.append(d[k])
            
        return l

def _get_teams_next_round(teams, classifications):
    translator = contest.generate_key_names(teams)

    teams_next_round = []
    n = len(teams) / 2

    for i in range(n):
        teams_next_round.append(translator[classifications[i]])

    return teams_next_round

def _extract_classifications(classifications):
    new_classifications = []
    for i in classifications:
        new_classifications.append(i[0])

    return new_classifications

    
        
