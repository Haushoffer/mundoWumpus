Feature:
	Como jugador
	Quiero recibir pistas sobre la ubicacion de los murcielagos
	Para estar preparado para atacar

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
	Then deberia mostrar el mensaje "Se escucha un aleteo cerca"

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
	Then deberia mostrar el mensaje "los murcielagos de devolvieron al inicio"

Scenario:
	Given visito la pagina de inicio
	When pulso el boton "testMap"
	And pulso el boton "INICIO"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Sur"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Este"
	And pulso el boton de direccion "Sur"
	And pulso el boton de direccion "Sur"
	And pulso el boton de cambio de utilidad a "pressShootSpray"
	And pulso el boton "sprayBot"
	Then deberia mostrar el mensaje "los murcielagos estaran aturdidos por un turno"
