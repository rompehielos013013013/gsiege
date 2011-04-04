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
import round
import pprint

def init_contest(contest_format, teams, fast=False, back_round=False,
                 num_turns=120):

    print "### INIT_CONTEST"

    if contest_format == 'league':
        _init_league(_clean_dictionary(teams), fast, num_turns, back_round)
    elif contest_format == 'cup':
        _init_tournament(_clean_dictionary(teams), num_turns, fast)
    elif contest_format == 'playoff':
        _init_playoff(_clean_dictionary(teams), fast, num_turns, back_round)
     

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

def _init_league(teams, fast, num_turns, back_round):
    l = league.League(teams, num_turns, back_round)

    print "##### INIT LEAGUE..."
    band = False
    
    tournament_file_name = generate_log_file_name('league')

    while not l.league_completed and not band:
        i = l.get_round_number()
        progress_bar = None

        print "Playing round number " + str(i)

        if fast:
            progress_bar = pbs.ProgressBarDialog(None,
                                                 _('Running the contest'))
            progress_bar_dialog = progress_bar.progress_bar_dialog
            progress_bar.set_num_elements(l.get_round(i).number_games)
            progress_bar_dialog.show()
            while gtk.events_pending():
                gtk.main_iteration(False)

        l.play_round(progress_bar, fast)
        r = l.get_round(i)
        
        classifications = l.get_actual_puntuations()
        results = r.get_round_results()

        update_log_round(tournament_file_name, results, i)

        R = round_results.roundResults(classifications, results,
                                       l.get_prev_round_number() + 1,
                                       l.get_number_of_rounds())

        if fast:
            progress_bar_dialog.hide()
        button_pressed = R.result_dialog.run()
        
        while gtk.events_pending():
            gtk.main_iteration(False)
            
        if button_pressed == -4 or button_pressed == 0:
            band = True

    update_log_end(tournament_file_name, classifications)
    print "##### END LEAGUE..."

def _init_tournament(teams, num_turns, fast):
    print "##### INIT TOURNAMENT"
    t = tournament.Tournament(teams, num_turns)
    band = False
    
    log_file_name = generate_log_file_name('tournament')

    while not t.tournament_completed and not band:
        i = t.get_round_number()
        progress_bar = None
        if fast:
            progress_bar = pbs.ProgressBarDialog(None,
                                                 _('Running the contest'))
            progress_bar_dialog = progress_bar.progress_bar_dialog
            progress_bar.set_num_elements(t.get_round(i).number_games)
            progress_bar_dialog.show()
            while gtk.events_pending():
                gtk.main_iteration(False)
        t.play_round(progress_bar, fast)
        r = t.get_round(i)

        classifications = []
        results = r.get_round_results()
        update_log_round(log_file_name, results, i)

        R = round_results.roundResults(classifications, results,
                                       t.get_prev_round_number() + 1,
                                       t.get_number_of_rounds(),
                                       show_classifications=False)
        if fast:
            progress_bar_dialog.hide()
        button_pressed = R.result_dialog.run()
        
        while gtk.events_pending():
            gtk.main_iteration(False)
            
        if button_pressed == -4 or button_pressed == 0:
            band = True

    print "##### END TOURNAMENT"


def _init_playoff(teams, fast, num_turns, back_round):
    l = league.League(teams, num_turns, back_round)

    band = False
    
    while not l.league_completed and not band:
        i = l.get_round_number()
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
        r = l.get_round(i)
        
        classifications = l.get_actual_puntuations()
        results = r.get_round_results()
        
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
    if not band:
        band = False
        teams = _get_teams_next_round(teams, _extract_classifications(classifications))
        _init_tournament(teams, num_turns, fast)
        


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

    
        
