Feature:
	Como jugador
	Quiero bloquear el movimiento del Wumpus
	Para que sea mas llevadero el juego

Scenario:
		Given visito la pagina de inicio
		When pulso el boton "testMap"
		And pulso el boton "INICIO"
		Then deberia mostrar el mensaje "El Wumpus esta quieto"