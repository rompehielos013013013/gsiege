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

import gtk
import gtk.glade

from guadaboard import guada_board
from resistencia import configure, xdg
from resistencia.contest import controlPartida

import settings_dialog
import quick_game_dialog
import contest_dialog
import tests_dialog
import human_game_dialog

class Resistencia:
    """
    @brief Main class of the application 'Resistencia en Cadiz: 1812'.

    This class allows to start the program, and connect all events of the
    main window
    """
    def previous_games_file_chooser_handler(self):
        print "\n"
        print "#### PARTIDA ANTIGUA"

        selected_file = self.previous_games_chooser.get_filename()
        if not (selected_file == None):
            print 'Seleccionado ' + selected_file
            controlPartida.restaurarCampeonato()
            guada_board.run_from_file(selected_file)
            return True
        else:
            self.games_chooser_warning.show()
            return False
    
    def on_mainWindow_destroy(self, widget, data=None):
        gtk.main_quit()

    # Botón salir
    def on_btn_quit_clicked(self, widget, data=None):
        gtk.main_quit()

    # Botón Acerca de
    def on_btn_about_clicked(self, widget):
        print "About button clicked"

        self.about.connect('response', lambda d, r: d.hide())
        self.about.set_transient_for(self.window)
        self.about.show()

    # Botón Competiciones
    def on_btn_competitions_clicked(self, widget):
        treeview = contest_dialog.contestDialog(self.window)
        treeview.contest_dialog.run()

    # Botón jugar contra Sistema Experto
    def on_btn_human_es_game_clicked(self, widget):
        human_es_game = human_game_dialog.humanGameDialog(self.window)
        human_es_game.human_ia_dialog.run()

    # Botón juegos anteriores
    def on_btn_previous_games_clicked(self, widget):
        self.previous_games_chooser.connect('response', lambda d, r: d.hide())
        self.previous_games_chooser.set_transient_for(self.window)
        self.previous_games_chooser.show()

    # Botón laboratorio
    def on_btn_laboratory_clicked(self, widget):
        testing_dialog = tests_dialog.testDialog(self.window)
        testing_dialog.tests_dialog.run()

    # Botón Settings
    def on_btn_settings_clicked(self, widget):
        settings_dial = settings_dialog.settingsDialog(self.window)
        settings_dial.settings.run()

    # Botón Juego Rápido
    def on_btn_quick_game_clicked(self, widget):
        quick_game = quick_game_dialog.quickGameDialog(self.window)
        quick_game.quick_game.run()

    def on_btn_file_chooser_apply_clicked(self, widget):
        self.previous_games_file_chooser_handler()
        self.previous_games_chooser.hide()

    def on_btn_file_chooser_close_clicked(self, widget):
        self.previous_games_chooser.hide()
        
    def __init__(self):
        "Constructor of the object"

        # gtk.Builder es un objeto que lee una interfaz de glade e instancia los
        # widgets descritos en el fichero
        builder = gtk.Builder()

        # Carga el fichero con la interfaz principal
        builder.add_from_file(xdg.get_data_path('glade/main.glade')) 
        
        # Guarda referencias a cada uno de los diálogos
        self.window = builder.get_object("mainWindow")
        self.about = builder.get_object("aboutdialog1")
        self.previous_games_chooser = builder.get_object("filechooserdialog1")
        self.games_chooser_warning = builder.get_object("messagedialog1")

        # Conecta el evento response a una lambda-función que oculta el cuadro
        # de diálogo
        self.games_chooser_warning.connect('response', lambda d, r: d.hide())

        # Indica que ese diálogo es un subdiálogo (sort of) de
        # previous_game_chooser
        self.games_chooser_warning.set_transient_for(self.previous_games_chooser)

        # Lo mismo, pero de la ventana principal
        self.previous_games_chooser.set_transient_for(self.window)

        # Lo mismo, pero de la ventana principal también
        self.about.set_transient_for(self.window)
        
        def_path = configure.load_configuration()['games_path']
        self.previous_games_chooser.set_current_folder(def_path)
        builder.connect_signals(self)