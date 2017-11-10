require 'sinatra'
require('./lib/cavern.rb')
require('./lib/character.rb')

get '/' do	
	$startWumpus=Cavern.new(10,10)
	$startWumpus.generateNeighbors()
	$character=Character.new($startWumpus.getCavern(0,0))
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
	@wumpusvivo = $startWumpus.wumpuslife
	erb :console
end	

post '/toNorth' do	
	$startWumpus.moveWumpusRandomly
	$character.moveNorth()
	
	$m="El wumpus se movio aleatoriamente"
	redirect "/play"
	
end

post '/toSouth' do
	$startWumpus.moveWumpusRandomly	
	$character.moveSouth()
	
	$m="El wumpus se movio aleatoriamente"
	redirect "/play"
	
end

post '/toEast' do	
	$startWumpus.moveWumpusRandomly
	$character.moveEast()
	
	$m="El wumpus se movio aleatoriamente"
	redirect "/play"
	
end

post '/toWest' do	
	$startWumpus.moveWumpusRandomly
	$character.moveWest()
	
	$m="El wumpus se movio aleatoriamente"
	redirect "/play"
	
end
post '/shootToTop' do
	$character.shootArrow()
	if($character.caveOfPosition.topNeighbor.isWumpusHere)
		$startWumpus.killWumpus
		
	else	
		$character.caveOfPosition.topNeighbor.assignArrow()
	end
	redirect "/play"
end
post '/shootToBottom' do
	$character.shootArrow()
	if($character.caveOfPosition.bottomNeighbor.isWumpusHere)
		$startWumpus.killWumpus
	else	
		$character.caveOfPosition.bottomNeighbor.assignArrow()
	end
	redirect "/play"
end
post '/shootToLeft' do
	$character.shootArrow()
	if($character.caveOfPosition.leftNeighbor.isWumpusHere)
		$startWumpus.killWumpus
	else	
		$character.caveOfPosition.leftNeighbor.assignArrow()
	end
	redirect "/play"
end
post '/shootToRight' do
	$character.shootArrow()
	if($character.caveOfPosition.rightNeighbor.isWumpusHere)
		$startWumpus.killWumpus
	else	
		$character.caveOfPosition.rightNeighbor.assignArrow()
	end
	redirect "/play"
end
post '/start' do	
	@mensaje=$startWumpus.getWelcomeMessage()
	erb :defaultMap
end

