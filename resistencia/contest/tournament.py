# -*- coding: utf-8 -*-
###############################################################################
# This file is part of Resistencia en Cadiz: 1812.                            #
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

import math
import random

import gtk

from resistencia import configure, filenames

import pprint
import contest
import round


def is_power2(num):
        return num != 0 and ((num & (num - 1)) == 0)

def closest_power2(num):
        return math.pow(2, math.ceil(math.log(num, 2)))


def _auto_pairings(elements):
        
        # Barajamos los equipos
        random.shuffle(elements)
        
        pairing = []

        # Guardamos el número de equipos
    numEquiposTotales = len(elements)
    
    # Si el número de equipos es una potencia de dos, la agrupación es trivial
    if is_power2(numEquiposTotales):            
            
        for i in range(numEquiposTotales / 2):
            pairing.append((elements[i], elements[i + 1]))        
    else:
        # Si no es una potencia de dos, hay que conseguir un número potencia de
        # dos de partidos en la primera eliminatoria para evitar que aparezcan
        # equipos fantasma en etapas posteriores

        # El número de partidos será la potencia de dos más cercana (por arriba)
        # a la mitad del número de equipos            
        numPartidos = int(closest_power2(numEquiposTotales / 2))

        # Calculamos el número de equipos necesarios, que son dos por partido
        numEquiposNecesarios = numPartidos * 2

        # El número de equipos fantasma a añadir será la diferencia con el
        # número de equipos reales
        numEquiposFantasma = numEquiposNecesarios - numEquiposTotales        
        equiposFantasma = ['aux_ghost_team'] * numEquiposFantasma

        # Contenedor total de equipos. Los fantasma se agrupan juntos al final
        equiposTotales = elements + equiposFantasma

        # Dividimos los equipos en dos, y mezclamos. Así, es imposible que haya
        # un partido entre dos equipos fantasma
        primeraMitad = equiposTotales[:len(equiposTotales)/2]
        segundaMitad = equiposTotales[-len(equiposTotales)/2:]
        pairing = zip(primeraMitad, segundaMitad)
        
    return pairing

def _extract_teams_from_pairing(elements):
    teams = []
    for i in elements:
        teams.append(i[0])
        teams.append(i[1])

import pprint

class Tournament(contest.Contest):
    def __init__(self, teams, num_turns, pairings_done=False):
        self.matchs = []
        self.teams = []
        self.round_winners = []
        self.num_turns = num_turns

        
        if pairings_done:
            self.matchs.append(teams)
            self.teams = _extract_teams_from_pairing(self.matchs)
        else:
            self.teams = teams

        self.translator = contest.generate_key_names(self.teams)
        self.keys = []

        for t in self.translator:
            self.keys.append(t)

        if not pairings_done:
            self.matchs.append(_auto_pairings(self.keys))

        pprint.pprint(self.matchs)
        raw_input()

        self.round_number = 0
        self.rounds = []
        
        self.rounds.append(round.Round(self.matchs[self.round_number],
                                       self.translator,
                                       self.num_turns))

        self.number_of_rounds = int(math.ceil(math.log(len(self.teams),2)))
        self.tournament_completed = False
    
    def get_round_number(self):
        return self.round_number

    def get_prev_round_number(self):
        return self.round_number - 1
    
    def get_number_of_rounds(self):
        return self.number_of_rounds

    def get_round(self, round_number):
        return self.rounds[round_number]

    def get_tournament_ended(self):
        return (self.round_number == self.number_of_rounds)

    def play_round(self, progress_bar, fast=False):
        if not self.tournament_completed:
            r = self.rounds[self.round_number]
            n = r.get_number_of_games()
            
            for i in range(n):
                if fast and progress_bar != None:
                    progress_bar.pulse()
                    while gtk.events_pending():
                        gtk.main_iteration(False)
                r.play_match(fast, True)

            winners = r.get_winners()
            self.round_winners.append(winners)
            
            self.round_number = self.round_number + 1
            self.league_completed = (self.round_number == self.number_of_rounds)

            if not self.league_completed:
                self.matchs.append(_auto_pairings(winners))
                self.rounds.append(round.Round(self.matchs[self.round_number],
                                               self.translator))

    def get_results_by_now(self):
        return self.round_winners
        
        
        
