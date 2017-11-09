Feature:
	Como jugador
	Quiero moverme al Norte, Sur, Este, Oeste de una cueva
	Para cambiar de posicion

Scenario:
		Given visito la pagina de inicio
		When pulso el boton "JUGAR MAPA POR DEFECTO"
		And pulso el boton "INICIO"
		Then deberia mostrar el boton "Sur"
		And deberia mostrar el boton "Este"
		And deberia mostrar el mensaje "Entraste a la cueva 0"
