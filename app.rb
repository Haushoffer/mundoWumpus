require 'sinatra'
require('./lib/cavern.rb')
require('./lib/character.rb')
require('./lib/wumpus.rb')
require('./lib/bats.rb')
require('./lib/TMap.rb')
require('./lib/Umap.rb')
get '/' do	
	$m=" "
	erb :start
end	
get '/mostrarMapas' do	
	$m=" "
	
	erb :mapas
end	
get '/play' do
	@mensaje=$character.getNumberOfCavePositionated()
	$m=$m + ""
	@north=$character.canGoNorth()
	@south=$character.canGoSouth()
	@east=$character.canGoEast()
	@west=$character.canGoWest()
	@smell=$character.caveOfPosition.smell
	@numberOfArrows=$character.numberOfArrows
	@numberOfSpray=$character.numberOfSpray
	@caught = $wumpus.wumpusAlive && ($character.caveOfPosition.caveNumber == $wumpus.caveOfPosition.caveNumber)
	@wumpusvivo = $wumpus.wumpusAlive
	@monedas = $character.coins
	@whirr=$character.caveOfPosition.whir
	if($wumpus.isLock)
		@mensajeWumpus = "El Wumpus esta quieto"
		@nombreBoton = "Desbloquear movimiento"
	else
		@mensajeWumpus = "El Wumpus esta activo"
		@nombreBoton = "Bloquear movimiento"
	end
	@pressMo=$pressMov
	@pressAr=$pressSA
	@pressSp=$pressSpray
	erb :console	
end	
get '/configureMap' do
	erb :configureMap
end
post '/configureMap' do
	$numberOfCaves = params[:numberOfCaves].to_i
	if($numberOfCaves==nil or $numberOfCaves<=0)
		$startWumpus=Cavern.new(10,10)
	else
		$numberOfCaves=$numberOfCaves/2
		$startWumpus=Cavern.new($numberOfCaves,$numberOfCaves)
	end
	$startWumpus.generateNeighbors()
	$character=Character.new($startWumpus.getCavern(0,0))
    @mensaje="Bienvenido al Mapa Personalizado"
    $pressMov=true
	$pressSA=false
	$pressSpray=false
	erb :defaultMap
end
post '/toNorth' do	
	$wumpus.moveWumpusRandomly
	$character.moveNorth()
	if($character.withBats)
		$character.setPos($startWumpus.getCavern(0,0))
		$mensajeActual="los murcielagos te devolvieron al inicio"
	else
		$mensajeActual=""
	end
	$m=""
	redirect "/play"
	
end
post '/toSouth' do
	$wumpus.moveWumpusRandomly	
	$character.moveSouth()
	if($character.withBats)
		$character.setPos($startWumpus.getCavern(0,0))
		$mensajeActual="los murcielagos te devolvieron al inicio"
	else
		$mensajeActual=""
	end
	$m=""
	redirect "/play"
	
end
post '/toEast' do	
	$wumpus.moveWumpusRandomly
	$character.moveEast()
	if($character.withBats)
		$character.setPos($startWumpus.getCavern(0,0))
		$mensajeActual="los murcielagos te devolvieron al inicio"
	else
		$mensajeActual=""
	end
	$m=""
	redirect "/play"
	
end

post '/toWest' do	
	$wumpus.moveWumpusRandomly
	$character.moveWest()
	if($character.withBats)
		$character.setPos($startWumpus.getCavern(0,0))
		$mensajeActual="los murcielagos te devolvieron al inicio"
	else
		$mensajeActual=""
	end
	$m=""
	redirect "/play"
	
end
post '/lockWumpus' do	
	if($wumpus.isLock)
		$wumpus.unlock
	else
		$wumpus.lock
	end
	redirect "/play"
end
post '/shootToTop' do
	$character.shootArrow()
	@caveaux=$character.caveOfPosition
	while (!@caveaux.topNeighbor.nil? && $wumpus.wumpusAlive) do
		if(@caveaux.topNeighbor.isWumpusHere)
			$wumpus.killWumpus
			$character.coins=$character.coins+100
			
		else	
			@caveaux = @caveaux.topNeighbor
		end
	end
	if $wumpus.wumpusAlive
		@caveaux.assignArrow()
	end
	checkMovement
	redirect "/play"
end
post '/shootToBottom' do
	$character.shootArrow()
	@caveaux=$character.caveOfPosition
	while (!@caveaux.bottomNeighbor.nil? && $wumpus.wumpusAlive) do
		if(@caveaux.bottomNeighbor.isWumpusHere)
			$wumpus.killWumpus
			$character.coins=$character.coins+100
			
		else	
			@caveaux = @caveaux.bottomNeighbor
		end
	end
	if $wumpus.wumpusAlive
		@caveaux.assignArrow()
	end
	checkMovement
	redirect "/play"
end

post '/shootToLeft' do
	$character.shootArrow()
	@caveaux=$character.caveOfPosition
	while (!@caveaux.leftNeighbor.nil? && $wumpus.wumpusAlive) do
		if(@caveaux.leftNeighbor.isWumpusHere)
			$wumpus.killWumpus
			$character.coins=$character.coins+100
		else	
			@caveaux = @caveaux.leftNeighbor
		end
	end
	if $wumpus.wumpusAlive
		@caveaux.assignArrow()
	end
	checkMovement
	redirect "/play"
end
post '/shootToRight' do
	$character.shootArrow()
	@caveaux=$character.caveOfPosition
	while (!@caveaux.rightNeighbor.nil? && $wumpus.wumpusAlive) do
		if(@caveaux.rightNeighbor.isWumpusHere)
			$wumpus.killWumpus
			$character.coins=$character.coins+100
			
		else	
			@caveaux = @caveaux.rightNeighbor
		end
	end
	if $wumpus.wumpusAlive
		@caveaux.assignArrow()
	end
	checkMovement
	redirect "/play"
end
post '/sprayToTop' do
	$character.useSpray()
	@caveaux=$character.caveOfPosition
	if(@caveaux.topNeighbor.isBatHere)
		$character.coins=$character.coins+10
		@caveaux.bottomNeighbor.stunTheBat()
		$mensajeActual="los murcielagos estaran aturdidos por un turno"
	end
	checkMovement
	redirect "/play"
end
post '/sprayToBottom' do
	$character.useSpray()
	@caveaux=$character.caveOfPosition
	if(@caveaux.bottomNeighbor.isBatHere)
		$character.coins=$character.coins+10
		@caveaux.bottomNeighbor.stunTheBat()
		$mensajeActual="los murcielagos estaran aturdidos por un turno"
	end
	checkMovement
	redirect "/play"
end

post '/sprayToLeft' do
	$character.useSpray()
	@caveaux=$character.caveOfPosition
	if(@caveaux.leftNeighbor.isBatHere)
		$character.coins=$character.coins+10
		@caveaux.bottomNeighbor.stunTheBat()
		$mensajeActual="los murcielagos estaran aturdidos por un turno"
	end	
	checkMovement
	redirect "/play"
end
post '/sprayToRight' do
	$character.useSpray()
	@caveaux=$character.caveOfPosition
	if(@caveaux.rightNeighbor.isBatHere)
		$character.coins=$character.coins+10
		@caveaux.bottomNeighbor.stunTheBat()
		$mensajeActual="los murcielagos estaran aturdidos por un turno"
	end
	checkMovement
	redirect "/play"
end

post '/start' do		
	$startWumpus=Cavern.new(10,10)
	$startWumpus.generateNeighbors()
	param= $startWumpus
	$batriders=Bats.new(param)
	$character=Character.new($startWumpus.getCavern(0,0))
	$wumpus=Wumpus.new($startWumpus.getCavern(5,5))
    @mensaje="Bienvenido al Mapa por Defecto"
    $pressMov=true
	$pressSA=false
	$pressSpray=false
	erb :defaultMap
end
get '/mapaT' do	
	$startWumpus=TMap.new()
	$startWumpus.generateNeighbors()
	$character=Character.new($startWumpus.getCavern(0,0))
	$wumpus=Wumpus.new($startWumpus.getCavern(4,4))
	$wumpus.isLock=true
	$pressMov=true
	$pressSA=false
	$pressSpray=false
	redirect "play"
end
get '/mapaU' do	
	$startWumpus=UMap.new()
	$startWumpus.generateNeighbors()
	$character=Character.new($startWumpus.getCavern(0,0))
	$wumpus=Wumpus.new($startWumpus.getCavern(7,4))
	$wumpus.isLock=true
	$pressMov=true
	$pressSA=false
	$pressSpray=false
	redirect "play"
end
post '/testStart' do
	$startWumpus=Cavern.new(10,10)
	$startWumpus.generateNeighbors()
	param= $startWumpus
	$batriders=Bat.new($startWumpus.getCavern(4,4))
	$character=Character.new($startWumpus.getCavern(0,0))
	$wumpus=Wumpus.new($startWumpus.getCavern(5,5))
	$wumpus.isLock=true
    @mensaje="Bienvenido al Mapa por Defecto"
    $pressMov=true
	$pressSA=false
	$pressSpray=false
	erb :defaultMap
end

post '/pressMovement' do
	checkMovement
	redirect "/play"
end

def checkMovement
	if($pressMov)
		$pressMov=false
	else
		$pressMov=true
		$pressSA=false
		$pressSpray=false
	end
end
post '/pressShootArrow' do
	if($pressSA)
		$pressSA=false
		checkMovement
	else
		$pressSA=true
		$pressMov=false
		$pressSpray=false
	end
	redirect "/play"
end
post '/pressUseSpray' do
	if($pressSpray)
		$pressSpray=false
		checkMovement
	else
		$pressSpray=true
		$pressMov=false
		$pressSA=false
	end
	redirect "/play"
end