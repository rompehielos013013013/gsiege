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
This file provides some functions commonly used in all the application.
"""

from os import path
from resistencia.xdg import get_data_path as xdg_data_path
import datetime
import types
import sys

from resistencia.nls import gettext as _

import resistencia

def comprobar_nombre_reglas (s):
    n, e = path.splitext(path.basename(s))

    if n[:6] != 'reglas' or e != '.clp':
        errorMsg = _("The rules file <b>\"%s\"</b> is not properly formed. \n\nIt should have the following syntax: <i>reglasNombre.clp</i>.") % (n + e)
        notificacion = resistencia.gui.notify_result.SimpleNotify(errorMsg)
        notificacion.dlg_result.run()
        return False
    else:
        return True

def comprobar_nombre_formacion (s):
    n, e = path.splitext(path.basename(s))

    if n[:6] != 'equipo' or e != '.form':
        errorMsg = _("The formation file <b>\"%s\"</b> is not properly formed. \n\nIt should have the following syntax: <i>equipoNombre.form</i>.") % (n + e)
        notificacion = resistencia.gui.notify_result.SimpleNotify(errorMsg)
        notificacion.dlg_result.run()
        return False
    else:
        return True

def despejar_ruta (ruta):
    """ Recibe la ruta total o parcial de un fichero y la limpia, dejando solo
    el nombre del fichero sin la extensión"""

    return path.splitext(path.split(ruta)[1])[0]

def quitar_prefijo(nombre):
    if "/" in nombre:
        nombre = despejar_ruta(nombre)

    if (nombre[0:6] == "equipo" or nombre[0:6] == "reglas"):
        return nombre[6:]
    else:
        return nombre

def quitar_prefijo_multiple(varios):
    retorno = list(varios)
    for i,e in enumerate(retorno):
        retorno[i] = quitar_prefijo(retorno[i])

    return tuple(retorno)
    

def dividir_ruta(rutaReglas):
    defPathRules = xdg_data_path('teams/rules/')

    # Le quitamos a la ruta del fichero de reglas la parte común
    rutaReglas = rutaReglas[len(defPathRules):]
    
    # Leemos el subdirectorio (si hay alguno)
    subdirectorio, fichero = path.split(rutaReglas)

    # Despejamos el nombre, quitando la extensión y el prefijo "reglas"
    nombreDespejado = quitar_prefijo(path.splitext(fichero)[0])

    return (subdirectorio, nombreDespejado)

def devolverFormacionAsociada(rutaReglas, noPrefijo = False):
    # Quitamos lo de 'file://' del principio
    if "file://" in rutaReglas:
        rutaReglas = rutaReglas[7:]

    subdirectorio, nombreDespejado = dividir_ruta(rutaReglas)

    # Formamos el nuevo nombre
    nombreFormacion = "equipo" + nombreDespejado + ".form"

    # Formamos la ruta completa
    rutaFormacion = path.join(xdg_data_path('teams/formations/'), subdirectorio, nombreFormacion)

    if not path.isfile(rutaFormacion):
        return ""

    prefijo = "file://"
    if noPrefijo:
        prefijo = ""
        
    return prefijo + rutaFormacion

def extract_simple_name_es (team):
    """Reciving a 2 elements tuple, extract the name of the player.

    Keywords arguments:
    team -- Tuple with the names of the rules and formation files.
    """
    if not (type(team) == types.TupleType) or not (len(team) == 2):
        str_error = 'Variable must be a pair '
        raise ValueError(str_error)
    
    subDirectorio, nombreDespejado = dividir_ruta(team[0])

    return subDirectorio+nombreDespejado

def extract_name_expert_system(team):
    """Reciving a 2 elements tuple, extract the name of the player
    using the 2 files instead of only one.

    Keywords arguments:
    team -- Tuple with the names of the rules and formation files.
    """
    if not (type(team) == types.TupleType) or not (len(team) == 2):
        str_error = 'Variable must be a pair '
        raise ValueError(str_error)
    
    subDirectorio, nombreDespejado = dividir_ruta(team[0])

    i_1 = team[0].find("/reglas")
    j_1 = team[0].find(".clp")
    i_2 = team[1].find("/equipo")
    j_2 = team[1].find(".form")
    
    return subDirectorio + (team[0])[i_1+7:j_1] + (team[1])[i_2+7:j_2]

def extract_names_from_file (filename):
    """
    Given the name of a game's log, extract names of the players
    """
    _file = path.split(filename)
    file_name = _file[1]

    name_a_i = 25
    name_a_j = file_name.find('-vs-')
    name_b_i = name_a_j + 4
    name_b_j = file_name.find('.txt')

    return (file_name[name_a_i:name_a_j], file_name[name_b_i:name_b_j])

def generate_filename_keys (filetype, teams=None):
    """
    Generate the name of a log file
    """
    if filetype == 'game':
        if not (type(teams) == types.TupleType) or not (len(teams) == 2):
            str_error = 'If you want to generate a filename for a game '
            str_error += 'an extra argument is needed'
            raise ValueError(str_error)

    _time = datetime.datetime.now()

    iso_date = _time.isoformat()
    iso_date = iso_date.replace('T', '_')
    iso_date = iso_date[:iso_date.find('.')]

    tail = ''
    extension = '.txt'

    if filetype == 'game':
        name_team_a = teams[0]
        name_team_b = teams[1]
        tail = '_' + name_team_a + '-vs-' + name_team_b
    if filetype == 'stats':
        tail = '_' + extract_name_expert_system(teams)
        extension = '.csv'

    filename = filetype + '_' + iso_date + tail + extension

    return filename

def generate_isodate():
    _time = datetime.datetime.now()

    iso_date = _time.isoformat()
    iso_date = iso_date.replace('T', '_')
    iso_date = iso_date[:iso_date.find('.')]

    return iso_date

def generate_filename (filetype, teams=None, noExtension = False):
    """This function allow to generates files with proper name.

    Keyword arguments:
    filetype -- String that indicates what type of file we want. Could be
    'game', 'league', 'tournament'
    teams -- If filetype is 'game', teams must be a tuple of 2 elements,
    containing the path of the files that compose the expert system.
    """
    if filetype == 'game':
        if not (type(teams) == types.TupleType) or not (len(teams) == 2):
            str_error = 'If you want to generate a filename for a game '
            str_error += 'an extra argument is needed'
            raise ValueError(str_error)

    iso_date = generate_isodate()

    tail = ''
    extension = '.txt'

    if filetype == 'game':
        name_team_a = extract_name_expert_system(teams[0])
        name_team_b = extract_name_expert_system(teams[1])
        tail = '_' + name_team_a + '-vs-' + name_team_b
    elif filetype == 'stats':
        tail = '_' + extract_name_expert_system(teams)
        extension = '.csv'
    elif filetype == 'labdir':
        filetype = "LaboratorySession"
        tail = '_' + extract_name_expert_system(teams)
        extension = ''

    filename = filetype + '_' + iso_date + tail + (extension if not noExtension else "")

    return filename
