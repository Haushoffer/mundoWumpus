Feature:
	Como jugador
	Quiero recibir pista sobre monstruo
	Para tener una referencia sobre la ubicación del monstruo y decidir si atacar o no

Scenario:
		Given visito la pagina de inicio
		When pulso el boton "testMap"
		And pulso el boton "INICIO"
		And pulso el boton de direccion "Este"
		And pulso el boton de direccion "Este"
		And pulso el boton de direccion "Este"
		And pulso el boton de direccion "Este"
		And pulso el boton de direccion "Sur"
		And pulso el boton de direccion "Sur"
		And pulso el boton de direccion "Sur"
		And pulso el boton de direccion "Sur"
		And pulso el boton de direccion "Sur"
		Then deberia mostrar el mensaje "Se siente un olor fetido en este cuarto"
