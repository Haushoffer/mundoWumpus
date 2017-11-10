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
	it 'devolver 0 a la cantidad de flechas por defecto' do
		cavernita = Cavern.new(10,10)
		cavernita.generateNeighbors()
		character= Character.new(cavernita.getCavern(0,0))
		expect(character.numberOfArrows).to eq(0)
	end
	it 'devolver 1 al recojer una nueva flecha' do
		cavernita = Cavern.new(10,10)
		cavernita.generateNeighbors()
		character= Character.new(cavernita.getCavern(0,0))
		expect(character.pickArrow()).to eq(1)
	end
end
