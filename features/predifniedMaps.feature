Feature:
	Como jugador
	Quiero elegir un mapa ya definido
	Para poder jugar en diferentes mapas y dificultades

Scenario:
		Given visito la pagina de inicio
		When pulso el boton "Predefinidos"
		And pulso el boton "mapaT"
		Then deberia mostrar el mensaje "Bienvenido al Mapa T"