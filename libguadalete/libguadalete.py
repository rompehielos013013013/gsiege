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
# Copyright(C) 2009,2010 Pablo Recio Quijano <pablo.recioquijano@alum.uca.es> #
###############################################################################

import os
import random
import sys
import traceback
import logging
#sys.path.append("./libguadalete")

import clips

import funciones, f1, mover, texto, traducirF, traducirM, fA, fB, mirroring
import parsear_fichero_formacion

from resistencia import configure, filenames
from resistencia.nls import gettext as _

class Error(Exception):
    """Base class for exceptions in this module."""
    pass

class FileError(Error):
    """Exception raised for errors parsing files

    Attributes:
        msg  -- explanation of the error
    """

    def __init__(self, msg):
        self.msg = msg

class LibGuadalete(object):
    """Main class of the wrapper module for clips scripts
    
    This class provides an abstraction layer that allows to run a
    simulation of 'La batalla del Guadalete', generating a file
    that can be parsered easily.
    """
    def __init__(self, teamA, teamB, number_turns=100, suppress_output = False, teams_path = '../teams'):
        """Class initializator.

        Keywords arguments:
        teamA -- Tuple with paths to the rule file and formation file for the A team.
        teamB -- Tuple with paths to the rule file and formation file for the B team.
        teams_path -- Path to the directory that teams are stored by default
        """
        self.teamA = teamA
        self.teamB = teamB
        self.teams_path = teams_path
        self.max_value = 6
        self.suppress_output = suppress_output
        self.number_turns = number_turns
        
        if not os.path.exists(configure.__file_path__):
            configure.generate_configuration_file()

    def __startGame(self):
        """Intialize rules and facts of the main environment.

        This function loads differents modules and create an environment that provides
        the proper context where a game can be played.
        """
        clips.Eval('(clear)')
        
        clips.EngineConfig.Strategy = clips.RANDOM_STRATEGY

        random.seed()
        clips.Eval("(seed " + str(random.randint(0,9999)) + ")") 
        
        funciones.LoadFunctions(clips)
        f1.init_world(clips, self.number_turns)
        f1.LoadFunctions(clips)
        mover.LoadFunctions(clips)
        texto.LoadFunctions(clips)
        traducirF.LoadFunctions(clips)
        traducirM.LoadFunctions(clips)

        temp_form_A = parsear_fichero_formacion.parsear_fichero_formacion(self.teamA[1])
        temp_form_B = parsear_fichero_formacion.parsear_fichero_formacion(self.teamB[1])

        self.teamA = (self.teamA[0], temp_form_A)
        self.teamB = (self.teamB[0], temp_form_B)

        temp_team = mirroring.mirroring_team(self.teamB[1])

        logging.info('Cargando %s', self.teamA[1])
        #create a temporally file that mirror the formation of B team,
        #because it's written thinking in A team
        try:
            clips.Load(self.teamA[1])
        except clips.ClipsError as e:
            logging.error("####################")
            logging.error("ERROR de clips: %s", e)
            logging.error("Mensaje: ")
            logging.error(clips.ErrorStream.Read())
            logging.error("####################")

            raise FileError(_('Error parsing the file ') +  self.teamA[1] + "\n" + e)

        logging.info('Cargando %s', self.teamB[1])

        try:
            clips.Load(temp_team)
        except clips.ClipsError as e:
            logging.error("####################")
            logging.error("ERROR de clips: %s", e)
            logging.error("Mensaje: ")
            logging.error(clips.ErrorStream.Read())
            logging.error("####################")

            os.remove(temp_team)
            raise FileError(_('Error parsing the file ') +  self.teamB[1])
        
        os.remove(temp_team)
        os.remove(temp_form_A)
        os.remove(temp_form_B)

        fA.LoadFunctions(clips)
        logging.info('Cargando %s', self.teamA[0])
        try:
            clips.Load(self.teamA[0])
        except clips.ClipsError as e:
            logging.error("####################")
            logging.error("ERROR de clips: %s", e)
            logging.error("Mensaje: ")
            logging.error(clips.ErrorStream.Read())
            logging.error("####################")
            raise FileError(_('Error parsing the file ') +  self.teamA[0])

        temp_rules = mirroring.mirroring_rules(self.teamB[0])
        
        #same thing that for the formation, but this time using the rules
        fB.LoadFunctions(clips)
        logging.info('Cargando %s', self.teamB[0])
        try:
            clips.Load(temp_rules)
        except clips.ClipsError as e:
            os.remove(temp_rules)
            logging.error("####################")
            logging.error("ERROR de clips: %s", e)
            logging.error("Mensaje: ")
            logging.error(clips.ErrorStream.Read())
            logging.error("####################")

            raise FileError(_('Error parsing the file ') +  self.teamB[0] + "\n")
        
        os.remove(temp_rules)

        clips.Reset() #restart the environment

        clips.Run() #start the simulation

        t = clips.StdoutStream.Read() #print the output
        f = clips.FactList()

        last_fact = f[len(f)-1].PPForm()
        prev_last_fact = f[len(f)-2].PPForm()

        winner = self.__define_winner(last_fact, prev_last_fact)

        return winner

    def __generateFileName(self):
        """This function generates a proper filename for the game log

        Returns a string like 'game_YYYY-MM-DD_hh:mm:ss_teamA-vs-teamB.txt'
        """
        des = filenames.generate_filename('game',
                                          (self.teamA, self.teamB))

        base_path = configure.load_configuration()['games_path']

        return os.path.join(base_path, des)

    def __renameOutputFile(self,des):
        """
        Simple function that renames the output file named 'resultado.txt'
        to the proper filename with the date, names and so on.
        """
        src = "resultado.txt"
        f = open(src,"a")
        f.write("fin\n")
        os.rename(src, des)

    def __define_winner(self, last_fact, prev_last_fact):
        """
        Given the 2 lasts facts of an execution of the main environment,
        this function define the result of the game.
        """
        i_l = last_fact.find('(rey-')
        i_p = prev_last_fact.find('(rey-')

        if (i_l == -1 and i_p == -1) or (not(i_l == -1) and not(i_p == -1)):
            return 0
        else:
            t = last_fact[i_l + 5]
            if t == 'B':
                return 1
            elif t == 'A':
                return -1
            

    def run_game(self):
        """This method starts the game, generating an output file with the
        results

        Returns a pair containing the name of the output file where the game has
        been logged, and an integer indicating who won the game.
        """
        logging.info("")
        logging.info("** PROCESANDO PARTIDO...")

        try:
            winner = self.__startGame()
        except FileError as e:
            raise FileError(e.msg)

        logging.info("")
        logging.info("** PROCESAMIENTO TERMINADO")

        des = self.__generateFileName()
        self.__renameOutputFile(des)

        logging.info("Archivo de log: %s", des)
        logging.info("")
        
        return des, winner
