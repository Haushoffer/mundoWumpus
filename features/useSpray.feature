Feature:	
	Como jugador
	Quiero Usar spray en direccion a una caverna contigua
	Para estar preparado para adormecer a los murcielagos

Scenario:
	Given visito la pagina de inicio
	When pulso el boton "testMap"
	And pulso el boton "INICIO"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Sur"
	And pulso el boton de direccion "Este"
	And pulso el boton de cambio de utilidad a "pressShootSpray"
	And pulso el boton "sprayBot"
	Then deberia mostrar la cantidad de "Spray: 0"