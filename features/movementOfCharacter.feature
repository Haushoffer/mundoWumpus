Feature:
	Como jugador
	Quiero moverme al Norte de una cueva
	Para cambiar de posicion

Scenario:
		Given visito la pagina de inicio
		When pulso el boton "JUGAR MAPA POR DEFECTO"
		And pulso el boton "INICIO"
		Then deberia mostrar el boton "Norte"