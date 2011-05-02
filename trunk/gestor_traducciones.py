#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import os
import glob
import sys

def generar_pot():
    print "** Generando / actualizando plantilla .pot"
    directorios_a_revisar = ["resistencia", "guadaboard", "libguadalete", "data/glade"]
    listado = "[encoding: UTF-8]\n"
    for dirSuperior in directorios_a_revisar:
        for directorio, subdirectorios, ficheros in os.walk(dirSuperior):
            for f in ficheros:
                if (f[-3:] == ".py" or f[-6:] == ".glade") and ".svn" not in directorio:
                    listado += os.path.join(directorio, f) + "\n"

    os.chdir("po")
    listado_file = open("POTFILES.in", "w")
    listado_file.write(listado)
    listado_file.close()
    os.system('intltool-update --pot --gettext-package=messages --verbose')
    os.remove("POTFILES.in")
    os.chdir("..")
    
def actualizar_po():
    os.chdir("po")
    if not os.path.isfile("messages.pot"):
        print "## ERROR: no existe el fichero de plantilla messages.pot"
        print "          vuelva a ejecutar el asistente con la opción 1"

        return


    ficheros = glob.glob('*.po')

    if not ficheros:
        print "** No existen ficheros de traducción .po"

    for f in ficheros:
        print "** Actualizando fichero de locale '" + f + "'"
        os.system("msgmerge -s -U " + f + " messages.pot")

    os.chdir("..")

def compilar_mo():
    os.chdir("po")
    if not os.path.isfile("messages.pot"):
        print "## ERROR: no existe el fichero de plantilla messages.pot"
        print "          vuelva a ejecutar el asistente con la opción 1"

        return

    ficheros = glob.glob('*.po')

    if not ficheros:
        print "** No existen ficheros de traducción .po"

    for f in ficheros:
        nombre = os.path.splitext(f)[0]
        os.system('mkdir -p -m 0777 %s/LC_MESSAGES' % nombre)

        print "** Generando traducción para el locale '%s'" % nombre
        os.system('msgmerge -o - %s messages.pot | msgfmt -c -o %s/LC_MESSAGES/resistencia1812.mo -' % (f, nombre))


def imprimir_menu():
    print """## GESTOR DE TRADUCCIONES ##
  [1] - Generar o actualizar plantilla .pot
  [2] - Actualizar ficheros .po
  [3] - Compilar y generar .mo
  [4] - Salir\n"""

def main():
    imprimir_menu()

    opcion = ""

    if len(sys.argv) > 1:
        opcion = sys.argv[1]

    while not re.match(r"^[1-4]$", opcion):
        print "Elija una opción [1-4]:",

        try:
            opcion = raw_input()
        except KeyboardInterrupt:
            print
            sys.exit()

    if not os.path.isdir("po"):
        print "### AVISO: el directorio 'po' no existía y se creó\n"
        os.mkdir("po")

    opciones = [generar_pot, actualizar_po, compilar_mo, sys.exit]
    opciones[int(opcion) - 1]()


if __name__ == '__main__':
    main()
    
    
