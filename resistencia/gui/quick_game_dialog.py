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

from guadaboard import guada_board
from libguadalete.parsear_fichero_reglas import leer_comentario
from resistencia import configure, xdg, filenames
from resistencia.nls import gettext as _

from resistencia.contest import controlPartida

import notify_result

class quickGameDialog:    
    def __init__(self, parent):
        self.es_team_a = ''
        self.team_team_a = ''
        self.es_team_b = ''
        self.team_team_b = ''
        
        builder = gtk.Builder()
        builder.add_from_file(xdg.get_data_path('glade/quickGame.glade'))

        def_path = configure.load_configuration()['se_path']
        def_rules_path = def_path + '/rules'
        def_formations_path = def_path + '/formations'
        builder.get_object('file_chooser_es_a').set_current_folder(def_rules_path)
        builder.get_object('file_chooser_team_a').set_current_folder(def_formations_path)
        builder.get_object('file_chooser_es_b').set_current_folder(def_rules_path)
        builder.get_object('file_chooser_team_b').set_current_folder(def_formations_path)
        
        self.file_chooser_team_a = builder.get_object('file_chooser_team_a')
        self.file_chooser_team_b = builder.get_object('file_chooser_team_b')

        self.quick_game = builder.get_object("quick_game_dialog")
        self.quick_game.set_transient_for(parent)

        #---- Initialation for the dialogs
        self.error_es_a = builder.get_object("error_no_es_a")
        self.error_es_a.connect('response', lambda d, r: d.hide())
        self.error_es_a.set_transient_for(self.quick_game)
        
        self.error_team_a = builder.get_object("error_no_team_a")
        self.error_team_a.connect('response', lambda d, r: d.hide())
        self.error_team_a.set_transient_for(self.quick_game)
        
        self.error_es_b = builder.get_object("error_no_es_b")
        self.error_es_b.connect('response', lambda d, r: d.hide())
        self.error_es_b.set_transient_for(self.quick_game)
        
        self.error_team_b = builder.get_object("error_no_team_b")
        self.error_team_b.connect('response', lambda d, r: d.hide())
        self.error_team_b.set_transient_for(self.quick_game)

        #self.result_dialog = builder.get_object("dlg_result")
        #self.result_dialog.connect('response', lambda d, r: d.hide())
        #self.result_dialog.set_transient_for(self.quick_game)

        self.dlg_bad_file = builder.get_object('dlg_bad_file')
        self.dlg_bad_file.connect('response', lambda d, r: d.hide())
        self.dlg_bad_file.set_transient_for(self.quick_game)
        

        self.num_turns = 120
        self.spin_turns = builder.get_object("spin_num_turns")
        self.spin_turns.set_range(50,300)
        self.spin_turns.set_increments(2,10)
        self.spin_turns.set_value(self.num_turns)
        #---------------
        self.fast_game = False
        self.dont_save_game = False
        self.hidde_values = False
        
        self.label_desc_A = builder.get_object("label_desc_A")
        self.label_desc_B = builder.get_object("label_desc_B")

        builder.connect_signals(self)
        
    def on_quickGameDialog_close(self, widget, data=None):
        self.quick_game.hide()

    def on_file_chooser_es_a_file_set(self, widget, data=None):
        self.es_team_a = widget.get_uri()
        
        formacionAsociada = filenames.devolverFormacionAsociada(widget.get_uri())
        self.label_desc_A.set_label(leer_comentario(widget.get_filename()))

        if formacionAsociada != None:			
            self.file_chooser_team_a.set_uri(formacionAsociada)
            self.team_team_a = formacionAsociada

    def on_file_chooser_team_a_file_set(self, widget, data=None):
        self.team_team_a = widget.get_uri()
        
    def on_file_chooser_es_b_file_set(self, widget, data=None):
        self.es_team_b = widget.get_uri()
        
        formacionAsociada = filenames.devolverFormacionAsociada(widget.get_uri())
        self.label_desc_B.set_label(leer_comentario(widget.get_filename()))

        if formacionAsociada != None:			
            self.file_chooser_team_b.set_uri(formacionAsociada)
            self.team_team_b = formacionAsociada

    def on_file_chooser_team_b_file_set(self, widget, data=None):
        self.team_team_b = widget.get_uri()

    def on_check_fastgame_toggled(self, widget):
        self.fast_game = widget.get_active()

    def on_check_dont_save_toggled(self, widget):
        self.dont_save_game = widget.get_active()

    def on_check_hide_values_toggled(self, widget):
        self.hidde_values = widget.get_active()

    def on_spin_num_turns_change_value(self, widget, data=None):
        self.num_turns = int(widget.get_value())

    def on_spin_num_turns_value_changed(self, widget, data=None):
        self.num_turns = int(widget.get_value())
        
    def on_btn_cancel_clicked(self, widget, data=None):
        self.quick_game.hide()

    def on_btn_apply_clicked(self, widget, data=None):
        correct = True
        if len(self.es_team_a) == 0:
            self.error_es_a.run()
            correct = False
        else:
            self.es_team_a = self.es_team_a[7:]
            
        if len(self.es_team_b) == 0:
            self.error_es_b.run()
            correct = False
        else:
            self.es_team_b = self.es_team_b[7:]
            
        if len(self.team_team_a) == 0:
            self.error_team_a.run()
            correct = False
        else:
            self.team_team_a = self.team_team_a[7:]
            
        if len(self.team_team_b) == 0:
            self.error_team_b.run()
            correct = False
        else:
            self.team_team_b = self.team_team_b[7:]

        if correct == True:
            print "\n#### INIT QUICK GAME"

            # Ocultamos la ventana
            self.quick_game.hide()

            while gtk.events_pending():
                gtk.main_iteration(False)

            try:
                print ">>>> Iniciando juego"
                self.load_board()
                print ">>>> Fin del juego"

            except guada_board.GuadaFileError as e:
                self.dlg_bad_file.format_secondary_text(e.msg)
                self.dlg_bad_file.run()

            print "#### END QUICK GAME \n"

    def load_board(self):
        controlPartida.restaurarCampeonato()
        try:
            winner,kk = guada_board.run(
                ((self.es_team_a, self.team_team_a),
                 xdg.get_data_path('images/piece-orange.png')),
                ((self.es_team_b,self.team_team_b),
                 xdg.get_data_path('images/piece-violete.png')),

                self.fast_game, 
                self.dont_save_game,
                self.hidde_values, 
                str(int(self.num_turns))
                )
        except guada_board.GuadaFileError as e:
            raise guada_board.GuadaFileError(e.msg)
        
        # Se ha seleccionado mostrar sólo los resultados
        if self.fast_game:
            teamA = (self.es_team_a, self.team_team_a)
            teamB = (self.es_team_b, self.team_team_b)

            n = notify_result.notifyResult((teamA, teamB), winner)
            
            n.dlg_result.run()
