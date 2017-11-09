require "./lib/cavern.rb"
require "./lib/character.rb"

describe Cavern do 

	it 'devolver false a norte' do
		cavernita = Cavern.new(10,10)
		cavernita.generateNeighbors()
		character= Character.new(cavernita.getCavern(0,0))
		expect(character.canGoNorth()).to be false
	end

	it 'devolver false a oeste' do
		cavernita = Cavern.new(10,10)
		cavernita.generateNeighbors()
		character= Character.new(cavernita.getCavern(0,0))
		expect(character.canGoWest()).to be false
	end
	it 'devolver false a Norte luego de moverse al este' do
		cavernita = Cavern.new(10,10)
		cavernita.generateNeighbors()
		character= Character.new(cavernita.getCavern(0,0))
		character.moveEast()
		expect(character.canGoNorth()).to be false
	end
	it 'devolver true a todas las direcciones luego de moverse al este y al sur' do
		cavernita = Cavern.new(10,10)
		cavernita.generateNeighbors()
		character= Character.new(cavernita.getCavern(0,0))
		character.moveEast()
		character.moveSouth()
		expect(character.canGoNorth()).to be true
		expect(character.canGoSouth()).to be true
		expect(character.canGoWest()).to be true
		expect(character.canGoEast()).to be true
	end
end
