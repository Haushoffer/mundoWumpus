require 'sinatra'
require('./lib/cavern.rb')

get '/' do	
	$startWumpus=Cavern.new(10,10)
	erb :start
end	

post '/start' do	
	@mensaje=$startWumpus.getWelcomeMessage()
	erb :defaultMap
end

