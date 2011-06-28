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

import sys
import os.path

import gtk
import pprint

from resistencia import filenames, xdg
from resistencia.nls import gettext as _

class notifyResult:
    def __init__(self, teams, winner):
        """ Genera un nuevo diálogo de notificación de resultados.

        teams será un par cuyos elementos pueden ser cadenas con el nombre del
        equipo o un par con la ruta del fichero de formación y de reglas, de los
        que sacarán los nombres.
        """

        result = ''

        if type(teams[0]) == str:
            msg_team_a = teams[0]
            msg_team_b = teams[1]
        else:

            team_a = filenames.quitar_prefijo_multiple(teams[0])
            team_b = filenames.quitar_prefijo_multiple(teams[1])
        
            msg_team = "equipo <b>%s</b> con formación <b>%s</b>"
            msg_team_a = msg_team % team_a
            msg_team_b = msg_team % team_b
        
        if winner == 0:
            result = '<span foreground="red"><b>' + _('Draw') + '</b></span>\n'
            result += msg_team_a + '\n' + msg_team_b
        elif winner == 1:
            result  = '<span foreground="red"><b>Ganador</b>: '
            result += msg_team_a 
            result += '</span>\n'
            result +=  "Contrincante: "  + msg_team_b
        else:
            result  = '<span foreground="red"><b>Ganador</b>: '
            result += msg_team_b
            result += '</span>\n'
            result +=  "Contrincante: "  + msg_team_a
            
        builder = gtk.Builder()
        builder.add_from_file(xdg.get_data_path('glade/resultNotifier.glade'))

        self.dlg_result = builder.get_object('dlg_result')
        self.dlg_result.connect('response', lambda d, r: d.hide())
        self.dlg_result.format_secondary_markup(result)

class SimpleNotify:
    def __init__(self, msg, title = "Information"):

        builder = gtk.Builder()
        builder.add_from_file(xdg.get_data_path('glade/resultNotifier.glade'))

        self.dlg_result = builder.get_object('dlg_result')
        self.dlg_result.connect('response', lambda d, r: d.hide())
        self.dlg_result.set_markup("<b>" + title + "</b>")
        self.dlg_result.format_secondary_markup(msg)
