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
This file contains a function to get all the installed teams
"""

import os
import re
import logging

from resistencia import configure, filenames

def strip_svn(list_to_strip):

    l = list_to_strip[:]
    for m in l:
        if m.count('svn'):
            list_to_strip.remove(m)

    return list_to_strip

def browse_dir_rules(rules_path):
    retorno = []
    
    for f in os.listdir(rules_path):
        file_path = os.path.join(rules_path, f)

        if "svn" in f:
            pass 
        elif os.path.isdir(file_path):
            retorno.extend(browse_dir_rules(file_path))
        elif re.match(r"^reglas(.*?).clp$", f):
            retorno.append(file_path)

    return retorno                

def get_installed_teams():
    """
    Return a list of the installed teams. We consider a installed team some
    of the way 'data/teams/formations/equipoXX.form',
    'data/teams/rules/reglasYYYY.clp' where XX == YYYY
    """
    base_path = configure.load_configuration()['se_path']
    rules_path = os.path.join(base_path, 'rules')

    ficheros_reglas = browse_dir_rules(rules_path)
    conjuntoTotal = []
    for this_regla in ficheros_reglas:
        this_formacion = filenames.devolverFormacionAsociada(this_regla, True)
        if this_formacion != "":
            conjuntoTotal.append((this_regla, this_formacion))
        else:
            logging.error("ATENCIÓN: no se encontró el fichero de formación para el fichero de reglas <%s>", this_regla)

    logging.info("* %i equipos instalados en el sistema", len(conjuntoTotal))
    return conjuntoTotal
