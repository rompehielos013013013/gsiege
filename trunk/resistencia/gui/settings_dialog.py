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
import sys

import gtk

from resistencia import configure, xdg
from resistencia.nls import gettext as _

class settingsDialog:
    def __init__(self, parent):
        builder = gtk.Builder()
        builder.add_from_file(xdg.get_data_path('glade/settingsDialog.glade'))

        self.settings = builder.get_object("settingsDialog")
        self.settings.set_transient_for(parent)

        self.file_chooser_games = builder.get_object("file_chs_prev_games")
        self.file_chooser_teams = builder.get_object("file_chs_se")
        self.check_active_music = builder.get_object("check_active_music")

        self.label_subfolders = builder.get_object("label_subfolders")
        self.label_logfolder = builder.get_object("label_logfolder")

        config_vars = configure.load_configuration()

        games_current_folder = config_vars['games_path'] + '..'
        teams_current_folder = config_vars['se_path'] + '..'
        
        self.file_chooser_games.set_current_folder(games_current_folder)
        self.file_chooser_games.set_filename(config_vars['games_path'])
        self.file_chooser_teams.set_current_folder(teams_current_folder)
        self.file_chooser_teams.set_filename(config_vars['se_path'])

        active = False
        if config_vars['music_active'] == '1':
            active = True
        self.check_active_music.set_active(active)

        self.scale_intervalo = builder.get_object("scale_intervalo")
        self.scale_intervalo.set_range(100, 2000)
        self.scale_intervalo.set_value(config_vars['auto_interval_time'])
        
        builder.connect_signals(self)
        
    def on_settingsDialog_close(self, widget, data=None):
        self.settings.hide()

    def on_btn_cancel_clicked(self, widget, data=None):
        self.settings.hide()

    def comprobarDirectorios(self):
        widget = self.file_chooser_teams

        return (os.path.isdir(os.path.join(widget.get_filename(), "rules")) and
                os.path.isdir(os.path.join(widget.get_filename(), "formations")))

    def on_file_chs_prev_games_selection_changed(self, widget, data=None):
        self.label_logfolder.set_markup(_("<b>Full path</b>: ") + widget.get_filename())

    def on_file_chs_se_file_set(self, widget, data=None):
        if (self.comprobarDirectorios()):
            mensaje = _("<b>Correct directory</b>")
            mensaje += "\n    <b>" + _("Rules") + "</b>: %s" % os.path.join(widget.get_filename(), "rules")
            mensaje += "\n    <b>" + _("Teams") + "</b>: %s" % os.path.join(widget.get_filename(), "formations")
            self.label_subfolders.set_markup(mensaje)
        else:
            self.label_subfolders.set_markup("<span foreground=\"red\" weight=\"bold\">" + _("Invalid directory") + "</span>")


    def on_btn_apply_clicked(self, widget, data=None):
        config_vars = configure.load_configuration()
        #current_games_path = self.file_chooser_games.get_current_folder()
        #current_teams_path = self.file_chooser_teams.get_current_folder()
        
        current_games_path = self.file_chooser_games.get_filename()
        current_teams_path = self.file_chooser_teams.get_filename()
        current_active_music = ''
        if self.check_active_music.get_active():
            current_active_music = "1"
        else:
            current_active_music = "0"

        current_interval_time = self.scale_intervalo.get_value()
        
        if current_games_path != config_vars['games_path']:
            configure.set_games_path(current_games_path)

        if self.comprobarDirectorios() and current_teams_path != config_vars['se_path']:
            configure.set_se_path(current_teams_path)

        if current_active_music != config_vars['music_active']:
            configure.set_active_music(current_active_music)

        if current_interval_time != config_vars['auto_interval_time']:
            configure.set_interval_time(current_interval_time)

        self.settings.hide()
