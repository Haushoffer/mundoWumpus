Feature:
	Como jugador
	Quiero recoger flecha en una caverna
	Para estar preparado para atacar

Scenario:
	Given visito la pagina de inicio
	When pulso el boton "testMap"
	And pulso el boton "INICIO"
	Then deberia mostrar la cantidad de "Flechas: 0"
Scenario:
	Given visito la pagina de inicio
	When pulso el boton "testMap"
	And pulso el boton "INICIO"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Sur"
	Then deberia mostrar la cantidad de "Flechas: 1"
Scenario:
	Given visito la pagina de inicio
	When pulso el boton "testMap"
	And pulso el boton "INICIO"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Sur"
	And pulso el boton de direccion "Norte"
	And pulso el boton de direccion "Sur"
	Then deberia mostrar la cantidad de "Flechas: 1"
