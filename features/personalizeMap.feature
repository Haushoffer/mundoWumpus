Feature:
	Como jugador
	Quiero Asignar un valor de preferencia al numero de cavernas para generar mapa
	Para jugar en una caverna segun mis requerimientos

Scenario:
		Given visito la pagina de inicio
		When pulso el boton "CONFIGURAR MAPA"
		And lleno el campo "numberOfCaves" con "6"
		And pulso el boton "CONFIRMAR CONFIGURACION"
		Then deberia mostrar el mensaje "Bienvenido al Mapa Personalizado"