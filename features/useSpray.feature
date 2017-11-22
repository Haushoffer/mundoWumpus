Feature:	
	Como jugador
	Quiero Usar spray en direccion a una caverna contigua
	Para estar preparado para adormecer a los murcielagos

Scenario:
	Given visito la pagina de inicio
	When pulso el boton "JUGAR MAPA POR DEFECTO"
	And pulso el boton "INICIO"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Sur"
	And pulso el boton de direccion "Este"
	And pulso el boton "pressShootSpray"
	And pulso el boton "sprayBot"
	Then deberia mostrar la cantidad de "Spray: 0"