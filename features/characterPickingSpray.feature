Feature:
	Como jugador
	Quiero recoger spray de una cueva
	Para estar preparado para defenderme de los murciélagos


Scenario:
	Given visito la pagina de inicio
	When pulso el boton "testMap"
	And pulso el boton "INICIO"
	Then deberia mostrar la cantidad de "Spray: 0"
Scenario:
	Given visito la pagina de inicio
	When pulso el boton "testMap"
	And pulso el boton "INICIO"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Sur"
	And pulso el boton de direccion "Este"
	Then deberia mostrar la cantidad de "Spray: 1"
Scenario:
	Given visito la pagina de inicio
	When pulso el boton "testMap"
	And pulso el boton "INICIO"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Sur"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Sur"
	And pulso el boton de direccion "Norte"
	Then deberia mostrar la cantidad de "Spray: 1"
