require 'sinatra'
require('./lib/cavern.rb')
require('./lib/character.rb')
require('./lib/wumpus.rb')
require('./lib/bats.rb')
get '/' do	
	$m=" "
	
	erb :start
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
	@wumpusvivo = $wumpus.wumpusAlive
	@monedas = $character.coins
	@whirr=$character.caveOfPosition.whir
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
	erb :defaultMap
end
post '/toNorth' do	
	$wumpus.moveWumpusRandomly
	$character.moveNorth()
	if($character.withBats)
		$character.setPos($startWumpus.getCavern(0,0))
		$mensajeActual="los murcielagos de devolvieron al inicio"
	else
		$mensajeActual=""
	end
	
	$m="El wumpus se movio"
	redirect "/play"
	
end
post '/toSouth' do
	$wumpus.moveWumpusRandomly	
	$character.moveSouth()
	if($character.withBats)
		$character.setPos($startWumpus.getCavern(0,0))
		$mensajeActual="los murcielagos Te devolvieron al inicio"
	else
		$mensajeActual=""
	end
	$m="El wumpus se movio"
	redirect "/play"
	
end
post '/toEast' do	
	$wumpus.moveWumpusRandomly
	$character.moveEast()
	if($character.withBats)
		$character.setPos($startWumpus.getCavern(0,0))
		$mensajeActual="los murcielagos de devolvieron al inicio"
	else
		$mensajeActual=""
	end
	$m="El wumpus se movio"
	redirect "/play"
	
end

post '/toWest' do	
	$wumpus.moveWumpusRandomly
	$character.moveWest()
	if($character.withBats)
		$character.setPos($startWumpus.getCavern(0,0))
		$mensajeActual="los murcielagos de devolvieron al inicio"
	else
		$mensajeActual=""
	end
	$m="El wumpus se movio"
	redirect "/play"
	
end
post '/shootToTop' do
	$character.shootArrow()
	@caveaux=$character.caveOfPosition
	while (!@caveaux.topNeighbor.nil? && $wumpus.wumpusAlive) do
		if(@caveaux.topNeighbor.isWumpusHere)
			$wumpus.killWumpus
			$character.setCoins(100)
			
		else	
			@caveaux = @caveaux.topNeighbor
		end
	end
	if $wumpus.wumpusAlive
		@caveaux.assignArrow()
	end
	redirect "/play"
end
post '/shootToBottom' do
	$character.shootArrow()
	@caveaux=$character.caveOfPosition
	while (!@caveaux.bottomNeighbor.nil? && $wumpus.wumpusAlive) do
		if(@caveaux.bottomNeighbor.isWumpusHere)
			$wumpus.killWumpus
			$character.setCoins(100)
			
		else	
			@caveaux = @caveaux.bottomNeighbor
		end
	end
	if $wumpus.wumpusAlive
		@caveaux.assignArrow()
	end
	redirect "/play"
end

post '/shootToLeft' do
	$character.shootArrow()
	@caveaux=$character.caveOfPosition
	while (!@caveaux.leftNeighbor.nil? && $wumpus.wumpusAlive) do
		if(@caveaux.leftNeighbor.isWumpusHere)
			$wumpus.killWumpus
			$character.setCoins(100)
		else	
			@caveaux = @caveaux.leftNeighbor
		end
	end
	if $wumpus.wumpusAlive
		@caveaux.assignArrow()
	end
	redirect "/play"
end
post '/shootToRight' do
	$character.shootArrow()
	@caveaux=$character.caveOfPosition
	while (!@caveaux.rightNeighbor.nil? && $wumpus.wumpusAlive) do
		if(@caveaux.rightNeighbor.isWumpusHere)
			$wumpus.killWumpus
			$character.setCoins(100)
			
		else	
			@caveaux = @caveaux.rightNeighbor
		end
	end
	if $wumpus.wumpusAlive
		@caveaux.assignArrow()
	end
	redirect "/play"
end
post '/sprayToTop' do
	$character.useSpray()
	@caveaux=$character.caveOfPosition


	redirect "/play"
end
post '/sprayToBottom' do
	$character.useSpray()
	@caveaux=$character.caveOfPosition



	redirect "/play"
end

post '/sprayToLeft' do
	$character.useSpray()
	@caveaux=$character.caveOfPosition
	
	redirect "/play"
end
post '/sprayToRight' do
	$character.useSpray()
	@caveaux=$character.caveOfPosition
	


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
	erb :defaultMap
end


