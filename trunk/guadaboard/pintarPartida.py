#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pygame
from pygame.locals import *

import pprint
import algoritmoDiferencias

from resistencia.xdg import get_data_path as xdg_data_path
from resistencia import configure, filenames
from resistencia.contest import controlPartida

from pintarFicha import Ficha
from pintarBoton import Boton
from pintarInterruptor import Interruptor

class PintarPartida(object):
    
    def __init__(self, ficheroOrigen, team_a, team_b, musica, hidden=False, cant_draw=False):
        
        # team_a y team_b son pares con el nombre procesado del equipo y la ruta
        # a la imagen de la ficha correspondiente

        self.team_a = team_a
        self.team_b = team_b

        self.name_team_a = team_a[0]
        self.name_team_b = team_b[0]

        self.musica = musica
        self.hidden = hidden
        self.cant_draw = cant_draw
        # FPS 
        self.fps = 100.0

        # Intervalo
        self.intervalo = 1.0 / self.fps * 1000.0
        self.ticksAnterior = pygame.time.get_ticks()

        self.fichas = {}

        # Cargamos el parseador de partidas
        self.parseador = algoritmoDiferencias.ParseadorPartida(ficheroOrigen)

    def run(self):
        print "  ## INICIANDO Pintado de partida"
        # Inicializando pygame..."
        pygame.init()

        if self.musica:
            _music_path = xdg_data_path('music/walking_on_old_stones.ogg')
            pygame.mixer.music.load(_music_path)
            pygame.mixer.music.play()

        tamanoVentana = (760,560)
        
        # Estableciendo el modo de pantalla..."
        self.pantalla = pygame.display.set_mode(tamanoVentana)

        # Estableciendo el título de la ventana..."
        pygame.display.set_caption("Reproduciendo partida")

        # Cargando imagen de fondo..."
        self.imagenFondoTemp = pygame.image.load(xdg_data_path("images/fondo.png"))

        # Convirtiendo la imagen de fondo al formato adecuado..."
        self.imagenFondo = self.imagenFondoTemp.convert()

        # Parseando el estado inicial..."
        organizacionInicial = self.parseador.esteTurno()

        # Cargamos la imagen de los marcos con los nombres..."
        imagenMarco = pygame.image.load(xdg_data_path("images/marco.png"))
        imagenMarco = imagenMarco.convert()

        # Posición inicial de los marcos con los nombres de los equipos
        posMarcoSuperior = 10 
        posMarcoInferior = 152

        # Bliteamos el marco en el fondo
        self.imagenFondo.blit(imagenMarco, (510, posMarcoSuperior))
        self.imagenFondo.blit(imagenMarco, (510, posMarcoInferior))

        # Cargamos la fuente para el rótulo con el valor de la ficha
        fuenteEquipos = pygame.font.Font(xdg_data_path("fonts/zektonbi.ttf"), 18)
        
        # Renderizamos los textos en superficies
        textoEquipoA = fuenteEquipos.render(self.name_team_a[:16], 1, (255,255,255))
        sombraTextoEquipoA = fuenteEquipos.render(self.name_team_a[:16], 1, (0,0,0))
        self.imagenEquipoA = pygame.transform.scale(pygame.image.load(self.team_a[1]), (30,30))

        textoEquipoB = fuenteEquipos.render(self.name_team_b[:16], 1, (255,255,255))
        sombraTextoEquipoB = fuenteEquipos.render(self.name_team_b[:16], 1, (0,0,0))
        self.imagenEquipoB = pygame.transform.scale(pygame.image.load(self.team_b[1]), (30,30))

        # Bliteamos las superficies de los marcadores
        self.imagenFondo.blit(self.imagenEquipoA, (515, posMarcoSuperior + 9))
        self.imagenFondo.blit(sombraTextoEquipoA, (552, posMarcoSuperior + 11))
        self.imagenFondo.blit(textoEquipoA, (550, posMarcoSuperior + 9))

        self.imagenFondo.blit(self.imagenEquipoB, (515, posMarcoInferior + 9))
        self.imagenFondo.blit(sombraTextoEquipoB, (552, posMarcoInferior + 11))
        self.imagenFondo.blit(textoEquipoB, (550, posMarcoInferior + 9))

        # Cargamos la fuente para el texto de las fichas muertas
        self.fuenteFichasMuertas = pygame.font.Font(xdg_data_path("fonts/LiberationMono-Bold.ttf"), 19)

        # Pintamos las fichas blancas del fondo
        fichaBlanca = pygame.image.load(xdg_data_path("images/piece-default.png"))
        fichaBlanca = fichaBlanca.convert()

        for i in range(8):
            for j in range (8):
                self.imagenFondo.blit(fichaBlanca, (10 + 60 * i, 10 + 60 * j))

        # Cargando las fichas iniciales..."
        for keyFicha in organizacionInicial.keys():
            ficha = organizacionInicial[keyFicha];
            self.fichas[keyFicha] = Ficha(ficha[0], ficha[1], ficha[2], 
                                       ficha[3], ficha[4], ficha[5], self.hidden)

        # Pintamos los botones
        botonesInterfaz = []
        botonesInterfaz.append(Boton(700, 500, "images/salir", self.callSalir))
        botonesInterfaz.append(Boton(120, 500, "images/flecha_izquierda2", self.callRetrocederInicio))
        botonesInterfaz.append(Boton(190, 500, "images/flecha_izquierda1", self.callRetrocederTurno))
        botonesInterfaz.append(Boton(260, 500, "images/flecha_derecha1", self.callAvanzarTurno))
        botonesInterfaz.append(Boton(330, 500, "images/flecha_derecha2", self.callAvanzarFinal))
        botonesInterfaz.append(Boton(630, 500, "images/btnAbortar", self.callAbortar, False))
        botonesInterfaz.append(Interruptor(700, 430, "images/btnAvanceAutomatico", self.callToggleAvanceAutomatico))

        self.salir = False
        self.avanceAutomatico = False

        # Leemos del fichero de configuración la velocidad del avance automático
        config_vars = configure.load_configuration()
        self.intervaloAvanceAutomatico = config_vars['auto_interval_time']

        # Comienza el game loop
        while not self.salir and not controlPartida.flagCancelarCampeonato:

            # Comprobación del avance automático
            if self.avanceAutomatico:
                # Si el tiempo que ha pasado desde el último avance supera el intervalo
                if pygame.time.get_ticks() - self.ultimoAvance > self.intervaloAvanceAutomatico:

                    # Avanzamos el turno
                    self.callAvanzarTurno()

                    # Actualizamos la variable con el tiempo del último avance
                    self.ultimoAvance = pygame.time.get_ticks()

            # Gestión de eventos
            for eventos in pygame.event.get():
                
                # Si se ha pulsado ALT+F4 o el botón de cerrar ventana
                if eventos.type == QUIT:
                    # Activamos el flag de salir
                    self.salir = True

                # Cuando se pulsa el botón el ratón
                elif eventos.type == MOUSEBUTTONDOWN:

                    # Informamos a cada botón de la interfaz
                    for btn in botonesInterfaz:
                        btn.informarClick(eventos.pos)

                # Cuando se mueve el ratón
                elif eventos.type == MOUSEMOTION:

                    # Informamos a cada botón de la interfaz
                    for btn in botonesInterfaz:
                        btn.informarHover(eventos.pos)

                # Podemos avanzar turno con la flecha derecha del teclado
                elif eventos.type == KEYDOWN and eventos.key == 275:
                    self.callAvanzarTurno()

                # También podemos retroceder turno con las flechas del teclado
                elif eventos.type == KEYDOWN and eventos.key == 276:
                    self.callRetrocederTurno()


            # Pintamos el fondo
            self.pantalla.blit(self.imagenFondo, (0, 0))

            # Pintamos las fichas
            for keyFicha in self.fichas:
                self.fichas[keyFicha].pintar(self.pantalla)

            # Pintamos los botones
            for btn in botonesInterfaz:
                btn.pintar(self.pantalla)

            # Pintamos las fichas muertas
            self.pintarFichasMuertas()

            # Volcamos la pantalla a la gráfica
            pygame.display.flip()

            ##############################
            # GESTIÓN DE LOS FPS

            # Cogemos los ticks actuales
            ticksActual = pygame.time.get_ticks()

            espera = self.intervalo - (ticksActual - self.ticksAnterior)

            if espera > 0:
                # Esperamos el tiempo necesario para mantener los FPS
                pygame.time.delay(int(espera))

            # Actualizamos los ticks anteriores
            self.ticksAnterior = ticksActual

        # Fin del game loop"

        # Cortamos la música
        pygame.mixer.music.stop()

        # Cerramos el subsistema gráfica (no es necesario)
        pygame.display.quit()
        print "  ## FINALIZADO Pintado de partida"
        return 0

    ## CALLBACKS para los botones

    def callSalir(self, ):
        self.salir = True
        
    def callAvanzarTurno(self, ):
        nuevasFichas = self.parseador.avanzarTurno()

        self.actualizarFichas(nuevasFichas)

    def callRetrocederTurno(self, ):
        nuevasFichas = self.parseador.retrocederTurno()
        self.actualizarFichas(nuevasFichas)

    def callAvanzarFinal(self, ):
        nuevasFichas = self.parseador.avanzarFinal()
        self.actualizarFichas(nuevasFichas)

    def callRetrocederInicio(self, ):
        nuevasFichas = self.parseador.retrocederInicio()
        self.actualizarFichas(nuevasFichas)
    
    def callAbortar(self, ):
        controlPartida.cancelarCampeonato()
        print "ABORTAR"

    def callToggleAvanceAutomatico(self, ):
        if self.avanceAutomatico:
            self.avanceAutomatico = False
        else:
            self.ultimoAvance = pygame.time.get_ticks()
            self.avanceAutomatico = True

    def actualizarFichas(self, nuevasFichas):
        # Esto no puede pasar nunca realmente
        if len(nuevasFichas) == 0:
            pass
        else:
            # Recorremos las fichas que teníamos antes
            for f in self.fichas.keys():
            
                # Si alguna ficha ya no está
                if f not in nuevasFichas:
                    # Muere!
                    self.fichas[f].muerete()

                # Estaba muerta y revive (al rebobinar)
                elif f in nuevasFichas and self.fichas[f].visible == False:
                    self.fichas[f].revivete()

                # Si sigue estando
                else:
                    # Actualízate con las cosas que veas nuevas
                    self.fichas[f].actualizate(nuevasFichas[f])


    def pintarFichasMuertas(self):
        # Parseamos las fichas muertas
        dA, dB = self.parseador.calcularFichasMuertas()
        
        # Las convertimos a listas
        fichasA = dict2list(dA)
        fichasB = dict2list(dB)

        # Funciones para pasar de coordenadas locales a globales
        coorX = lambda x : 510 + x * 40
        coorY = lambda y : 65 + y * 40

        # Coordenadas iniciales de dibujado
        x = 0
        y = 0

        # Recorremos las fichas muertas del equipo A
        for fA in fichasA:
            self.pantalla.blit(self.imagenEquipoA, (coorX(x), coorY(y)))
            imText = self.fuenteFichasMuertas.render("%d" % fA, 1, (255,255,255))
            self.pantalla.blit(imText, (10 + coorX(x), 5 + coorY(y)))

            x += 1

            if x == 6:
                x = 0
                y += 1

        x = 0
        y = 0

        # Recorremos las fichas muertas del equipo B
        for fB in fichasB:
            self.pantalla.blit(self.imagenEquipoB, (coorX(x), 142 + coorY(y)))
            imText = self.fuenteFichasMuertas.render("%d" % fB, 1, (255,255,255))
            self.pantalla.blit(imText, (10 + coorX(x), 147 + coorY(y)))

            x += 1

            if x == 6:
                x = 0
                y += 1

def dict2list(d):
    l = []

    for k in d.keys():
        for i in range(d[k]):
            l.append(k)

    return l

