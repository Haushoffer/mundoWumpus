require 'sinatra'
require('./lib/cavern.rb')
require('./lib/character.rb')
require('./lib/wumpus.rb')
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
	#$wumpus.moveWumpusRandomly
	$character.moveNorth()
	
	$m="El wumpus se movio"
	redirect "/play"
	
end
post '/toSouth' do
	#$wumpus.moveWumpusRandomly	
	$character.moveSouth()
	
	$m="El wumpus se movio"
	redirect "/play"
	
end
post '/toEast' do	
	#$wumpus.moveWumpusRandomly
	$character.moveEast()
	
	$m="El wumpus se movio"
	redirect "/play"
	
end

post '/toWest' do	
	#$wumpus.moveWumpusRandomly
	$character.moveWest()
	
	$m="El wumpus se movio"
	redirect "/play"
	
end
post '/shootToTop' do
	$character.shootArrow()
	@caveaux=$character.caveOfPosition
	while (!@caveaux.topNeighbor.nil? && $wumpus.wumpusAlive) do
		if(@caveaux.topNeighbor.isWumpusHere)
			$wumpus.killWumpus
			$character.setCoins(10)
			
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
			$character.setCoins(10)
			
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
			$character.setCoins(10)
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
			$character.setCoins(10)
			
		else	
			@caveaux = @caveaux.rightNeighbor
		end
	end
	if $wumpus.wumpusAlive
		@caveaux.assignArrow()
	end
	redirect "/play"
end

post '/start' do		
	$startWumpus=Cavern.new(10,10)
	$startWumpus.generateNeighbors()
	$character=Character.new($startWumpus.getCavern(0,0))
	$wumpus=Wumpus.new($startWumpus.getCavern(5,5))
    @mensaje="Bienvenido al Mapa por Defecto"
	erb :defaultMap
end


