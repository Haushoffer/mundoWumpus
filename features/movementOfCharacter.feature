Feature:
	Como jugador
	Quiero moverme al Norte, Sur, Este, Oeste de una cueva
	Para cambiar de posicion

Scenario:
		Given visito la pagina de inicio
		When pulso el boton "testMap"
		And pulso el boton "INICIO"
		Then deberia mostrar el boton "Sur"
		And deberia mostrar el boton "Este"
		And deberia mostrar el mensaje "Entraste a la cueva 0"

Scenario:
		Given visito la pagina de inicio
		When pulso el boton "testMap"
		And pulso el boton "INICIO"
		And pulso el boton "Sur"
		Then deberia mostrar el boton "Sur"
		And deberia mostrar el boton "Este"
		And deberia mostrar el boton "Norte"
		And deberia mostrar el mensaje "Entraste a la cueva 10"

Scenario:
	   Given visito la pagina de inicio
		When pulso el boton "testMap"
		And pulso el boton "INICIO"
		And pulso el boton "Sur"
		Then deberia mostrar el mensaje "El wumpues se movio aleatoriamente"
