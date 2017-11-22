Feature:
	Como jugador
	Quiero iniciar el juego en un mapa con valores por defecto
	Para poder jugar de una forma rápida

Scenario:
		Given visito la pagina de inicio
		Then deberia mostrar el mensaje "MUNDO WUMPUS"
Scenario:
		Given visito la pagina de inicio
		When pulso el boton "testMap"
		Then deberia mostrar el mensaje "Bienvenido al Mapa por Defecto"
Scenario:
		Given visito la pagina de inicio
		When pulso el boton "testMap"
		And pulso el boton "INICIO"
		Then deberia mostrar el mensaje "MUNDO WUMPUS"