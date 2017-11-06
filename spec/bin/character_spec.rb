require "./lib/cavern.rb"
require "./lib/character.rb"

describe Cavern do 

	it 'devolver false a norte' do
		cavernita = Cavern.new(10,10)
		character= Character.new(cavernita.getCavern(0,0))
		expect(character.canGoNorth()).to be false
	end

	it 'devolver false a oeste' do
		cavernita = Cavern.new(10,10)
		character= Character.new(cavernita.getCavern(0,0))
		expect(character.canGoWest()).to be false
	end
end
