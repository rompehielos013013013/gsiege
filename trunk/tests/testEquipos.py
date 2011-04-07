#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

# _Incluímos en el path de módulos el directorio raíz
sys.path.insert(0, "..")

from resistencia.contest import *

teams = [(u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasA.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoA.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasGent0oza.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoGent0oza.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasB.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoB.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasPabloRecio.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoPabloRecio.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasRafa.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoRafa.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasAbrahan.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoAbrahan.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasJoaquin.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoJoaquin.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasPalomo.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoPalomo.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasRosunix.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoRosunix.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasNoelia.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoNoelia.clp'),
 (u'/home/jose/proyectos/gsiege/trunk/data/teams/rules/reglasJavierS.clp',
 u'/home/jose/proyectos/gsiege/trunk/data/teams/formations/equipoJavierS.clp')]

# k = tournament.Tournament(teams, 200)

# print "INICIO"

# while not k.completed():
#     k.play_round(None, True)
#     print "RONDA"

# print "FIN"

print tournament.closest_power2(5)
