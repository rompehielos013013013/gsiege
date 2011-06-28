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

from resistencia import filenames

def generate_key_names(teams):
    d = {}

    for team in teams:
        name = filenames.extract_name_expert_system(team)
        if name in d:
            print "CONFLICTO PREVIO CON ", name
        d[name] = team

    return d

def merge_puntuations(punt1, punt2):
    for index in punt1:
        punt1[index] = punt1[index] + punt2[index]

def puntuations_compare(p1, p2):
    if p1[1] > p2[1]:
        return 1
    elif p1[1] == p2[1]:
        return 0
    else:
        return -1

class Contest(object):

    def get_round_number(self):
        return self.current_round
    
    def get_prev_round_number(self):
        return self.current_round - 1

    def get_number_of_rounds(self):
        return self.number_of_rounds

    def get_round(self, round_number):
        return self.rounds[round_number]

    def play_round(self, fast=False):
        raise NotImplementedError('Base class. Method not implemented')

    def completed(self):
        return (self.get_round_number() == self.get_number_of_rounds())
