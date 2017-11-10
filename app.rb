require 'sinatra'
require('./lib/cavern.rb')
require('./lib/character.rb')

get '/' do	
	$startWumpus=Cavern.new(10,10)
	$startWumpus.generateNeighbors()
	$character=Character.new($startWumpus.getCavern(0,0))
	erb :start
end	

get '/play' do	
	@mensaje=$character.getNumberOfCavePositionated()
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
	redirect "/play"
end

post '/toSouth' do	
	$character.moveSouth()
	redirect "/play"
end

post '/toEast' do	
	$character.moveEast()
	redirect "/play"
end

post '/toWest' do	
	$character.moveWest()
	redirect "/play"
end

post '/start' do	
	@mensaje=$startWumpus.getWelcomeMessage()
	erb :defaultMap
end

