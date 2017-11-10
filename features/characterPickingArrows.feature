Feature:
	Como jugador
	Quiero recoger flecha en una caverna
	Para estar preparado para atacar

Scenario:
	Given visito la pagina de inicio
		When pulso el boton "JUGAR MAPA POR DEFECTO"
		And pulso el boton "INICIO"
		Then deberia mostrar la cantidad de flechas igual a "0"