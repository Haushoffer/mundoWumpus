require 'sinatra'
require('./lib/cavern.rb')
require('./lib/character.rb')

get '/' do	
	$startWumpus=Cavern.new(10,10)
	$startWumpus.generateNeighbors()
	$character=Character.new($startWumpus.getCavern(5,5))
	erb :start
end	

get '/play' do	
	$startWumpus=Cavern.new(10,10)
	@mensaje=$character.getNumberOfCavePositionated()
	@north=$character.canGoNorth()
	@south=$character.canGoSouth()
	@east=$character.canGoEast()
	@west=$character.canGoWest()
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

