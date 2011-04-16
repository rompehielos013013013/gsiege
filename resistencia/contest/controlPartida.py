# -*- coding: utf-8 -*-

import gtk

flagCancelarCampeonato = False

def restaurarCampeonato():
    global flagCancelarCampeonato
    print "Restaurando estado de la flag de cancelación de campeonato..."
    flagCancelarCampeonato = False

def cancelarCampeonato():
    mensajeDialogo = gtk.MessageDialog(None, gtk.DIALOG_MODAL,
                                       gtk.MESSAGE_WARNING,
                                       gtk.BUTTONS_YES_NO)

    mensajeDialogo.set_markup("<b>Cancel competition?</b>")
    mensajeDialogo.format_secondary_markup("Are you sure to cancel the entire competition?")
    respuesta = mensajeDialogo.run()
    mensajeDialogo.destroy()

    global flagCancelarCampeonato

    if respuesta == gtk.RESPONSE_YES:
        flagCancelarCampeonato = True
        print "Cancelando campeonato..."
    else:
        flagCancelarCampeonato = False

    while gtk.events_pending():
        gtk.main_iteration(False)
