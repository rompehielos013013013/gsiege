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

from resistencia import configure, filenames, xdg, colores
from resistencia.gui import round_results, notify_result
from resistencia.gui import progress_bar_dialog as pbs
from resistencia.nls import gettext as _

from libguadalete.parsear_fichero_reglas import probar_equipo

import logging

import league
import contest
import tournament
import controlPartida
import round
import dibujo_clasificacion

def init_contest(contest_format, teams, fast=False, back_round=False,
                 num_turns=120):

    logging.info("#### INIT CONTEST")

    teams = _clean_dictionary(teams)

    progress_bar = pbs.ProgressBarDialog(None, _('Checking teams...'))
    progress_bar_dialog = progress_bar.progress_bar_dialog
    progress_bar.set_num_elements(len(teams))
    progress_bar_dialog.show()

    while gtk.events_pending():
        gtk.main_iteration(False)    

    bannedTeams = []
    for equipo in teams:
        logging.info("Probando equipo: %s", equipo)
        try:
            probar_equipo(equipo)
        except:
            progress_bar_dialog.hide()
            notificacion = notify_result.SimpleNotify(_("The rules file <b>\"%s\"</b> has errors. This team will be out of the competition.\n\nCheck \"<i>log_gsiege</i>\" log file for details.") % equipo[0])
            notificacion.dlg_result.run()
            progress_bar_dialog.show()
            bannedTeams.append(equipo)
            
        progress_bar.pulse()
        
        while gtk.events_pending():
            gtk.main_iteration(False)    

    progress_bar_dialog.hide()

    for t in bannedTeams:
        teams.remove(t)

    controlPartida.restaurarCampeonato()

    if contest_format == 'playoff':
        _init_playoff(teams, fast, num_turns, back_round)
    else:
        _init_game(contest_format, teams, fast, num_turns, back_round)

    logging.info("#### END CONTEST")

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

def update_log_ending_league(log_file_name, results):
    log_file = open(log_file_name, 'a')
    log_file.write('** CLASIFICACIÓN FINAL\n')

    for clasificado in results:
        log_file.write('{0:2d} - {1}\n'.format(clasificado[1], clasificado[0]))

    log_file.close()
    
def update_log_ending_tournament(log_file_name, estadisticas):
    cadena_clasificacion = "** CLASIFICACIÓN FINAL\n"

    numVictorias = sorted([(x,estadisticas[x]["ganadas"]) for x in estadisticas if x != "aux_ghost_team"], key=lambda x:x[1], reverse = True)
    
    posicionPodio = 0
    lastNumVictorias = 0

    for i, e in enumerate(numVictorias):
        if e[1] != lastNumVictorias:
            if posicionPodio == 0:
                posicionPodio = 1
            else:   
                posicionPodio *= 2
                
            lastNumVictorias = e[1]

        cadena_clasificacion += "%i - %s \n" % (posicionPodio, e[0])

    log_file = open(log_file_name, 'a')
    log_file.write(cadena_clasificacion)
    log_file.close()    

def generate_log_file_name(prefix='pachanga', base_path = None):
    if base_path == None:
        base_path = configure.load_configuration()['games_path'] + '/'

    return base_path + filenames.generate_filename(prefix)

def generate_log_folder_name(prefix='pachanga', base_path = None):
    if base_path == None:
        base_path = configure.load_configuration()['games_path'] + '/'

    return base_path + filenames.generate_filename(prefix, noExtension = True)

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

def _init_game(game_type, teams, fast, num_turns, back_round = False, log_base_folder = None):

    logging.info(">>>> INIT GAME")

    if log_base_folder == None:
        log_base_folder = configure.load_configuration()['games_path'] + '/'


    # Generamos el nombre del fichero de log según el tipo de juego
    log_base_name = filenames.generate_filename(game_type, noExtension = True)
    log_folder_name = log_base_folder + log_base_name
    log_file_name = log_folder_name + "/" + game_type + ".txt"

    logging.info("Fichero de log: %s", log_file_name)
    logging.info("Carpeta de log: %s", log_folder_name)

    os.mkdir(log_folder_name)
    
    # Lanzamos el tipo de juego apropiado
    if game_type == 'cup':
        game = tournament.Tournament(teams, num_turns, log_folder = log_folder_name)
    else:
        game = league.League(teams, num_turns, back_round, log_folder = log_folder_name)

    band = False

    # Contenedor para clasificaciones
    classifications = {}

    results = None

    # Cada elemento tendrá una tupla de 3: ganadas, empatadas y perdidas
    estadisticas = {"aux_ghost_team": {"ganadas":0, "empatadas":0, "perdidas":0}}

    for equipo in contest.generate_key_names(teams).keys():
        estadisticas[equipo] = {"ganadas":0, "empatadas":0, "perdidas":0};

    # Mientras no se haya completado el juego
    while not game.completed() and not band and not controlPartida.flagCancelarCampeonato:

        logging.info("---- START OF THE ROUND")

        if results != None:

            # Cargamos el diálogo de resultados
            R = round_results.roundResults(classifications, results,
                                           game.get_prev_round_number() + 1,
                                           game.get_number_of_rounds(),
                                           show_classifications = (game_type != 'cup'),
                                           stats = estadisticas,
                                           show_top_teams = True,
                                           next_matches = game.matchs[game.get_round_number()])

        # Mostramos el diálogo de resultados
            button_pressed = R.result_dialog.run()
        
            while gtk.events_pending():
                gtk.main_iteration(False)
            
            if button_pressed == -4 or button_pressed == 0:
                band = True
                continue


        # Guardamos el número de la ronda
        roundNumber = game.get_round_number()

        if roundNumber == 0:
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

        for partido in results:
            if partido[1] == 1:
                estadisticas[partido[0][0]]["ganadas"] += 1
                estadisticas[partido[0][1]]["perdidas"] += 1
            elif partido[1] == -1:
                estadisticas[partido[0][1]]["ganadas"] += 1
                estadisticas[partido[0][0]]["perdidas"] += 1                    
            else:
                estadisticas[partido[0][0]]["empatadas"] += 1
                estadisticas[partido[0][1]]["empatadas"] += 1

        if game_type == 'cup':
            pass
        else:
            # "Puntuations" es una palabra que no existe
            classifications = game.get_actual_puntuations()

        # Ocultamos la barra de progreso (que ya habrá acabado)
        if fast:
            progress_bar_dialog.hide()

        logging.info("---- END OF THE ROUND")

    if not band:
        # Mostramos los resultados FINALES
        R = round_results.roundResults(classifications, results,
                                       game.get_prev_round_number() + 1,
                                       game.get_number_of_rounds(),
                                       show_classifications = (game_type != 'cup'),
                                       show_top_teams = True,
                                       stats = estadisticas)

        # Mostramos el diálogo de resultados
        button_pressed = R.result_dialog.run()
        
        while gtk.events_pending():
            gtk.main_iteration(False)
            
    if not band and not controlPartida.flagCancelarCampeonato:
        if game_type == 'cup':
            update_log_ending_tournament(log_file_name, estadisticas)
            dibujoClasificacion = dibujo_clasificacion.DibujoClasificacion(game)
        else:        
            update_log_ending_league(log_file_name, classifications)
        
    logging.info(">>>> END INIT GAME")
    return (band, classifications)




def _init_playoff(teams, fast, num_turns, back_round):
    logging.info("##### INIT PLAYOFF")

    log_base_folder = configure.load_configuration()['games_path'] + '/'
    log_base_folder += "Mixto-" + filenames.generate_isodate() + "/"

    os.mkdir(log_base_folder)

    band, classifications = _init_game('league', teams, fast, num_turns, back_round, log_base_folder = log_base_folder)

    if not band and not controlPartida.flagCancelarCampeonato:
        band = False
        teams = _get_teams_next_round(teams, _extract_classifications(classifications))
        _init_game('cup', teams, fast, num_turns, log_base_folder = log_base_folder)

    logging.info("##### END PLAYOFF")
     
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

    
        
