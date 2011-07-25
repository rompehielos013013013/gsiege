#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import tempfile

from resistencia.xdg import get_data_path as xdg_data_path

def parsear_obstaculos():
    obstaculos = []
    try:
        fichero = open(xdg_data_path("obstaculos"))
        for linea in fichero:
            m = re.search(r"\(([1-8]),([1-8])\)", linea)
            if m:
                obstaculos.append((int(m.group(1)), int(m.group(2))))
    except:
        pass

    return obstaculos

def generar_reglas_obstaculos():
    obstaculos = parsear_obstaculos()

    if obstaculos:

        fichero = tempfile.NamedTemporaryFile(delete = False)
        fichero.write("(deffacts obstaculos")
        for obs in obstaculos:
            fichero.write ("(obstaculo (pos-x %i) (pos-y %i))\n" % obs)
        fichero.write(")")
        fichero.close()

        return fichero.name

    else:
        return None


