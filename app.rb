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
	erb :console
end	

post '/toNorth' do	
	$character.moveNorth()
	$startWumpus.moveWumpusRandomly
	$m="El wumpus se movio aleatoriamente"
	redirect "/play"
	
end

post '/toSouth' do	
	$character.moveSouth()
	$startWumpus.moveWumpusRandomly
	$m="El wumpus se movio aleatoriamente"
	redirect "/play"
	
end

post '/toEast' do	
	$character.moveEast()
	$startWumpus.moveWumpusRandomly
	$m="El wumpus se movio aleatoriamente"
	redirect "/play"
	
end

post '/toWest' do	
	$character.moveWest()
	$startWumpus.moveWumpusRandomly
	$m="El wumpus se movio aleatoriamente"
	redirect "/play"
	
end

post '/start' do	
	@mensaje=$startWumpus.getWelcomeMessage()
	erb :defaultMap
end

