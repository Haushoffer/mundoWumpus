require "./lib/cavern.rb"
require "./lib/cave.rb"

describe Cavern do 
	it 'devuelve el valor de la caverna selecionada' do

		cavernita = Cavern.new(10,10)

		expect(cavernita.getCavern(0,1).caveNumber).to eq(1)
		expect(cavernita.getCavern(0,9).caveNumber).to eq(9)
		expect(cavernita.getCavern(7,7).caveNumber).to eq(77)
		expect(cavernita.getCavern(9,9).caveNumber).to eq(99)
		
	end

	it 'devuelve el valor de la caverna inferior vecina' do
		cavernita=Cavern.new(10,10)
		cavernita.generateNeighbors()

		expect(cavernita.getCavern(0,0).bottomNeighbor.caveNumber).to eq(10)
	end
	it 'devuelve el valor de la caverna derecha vecina' do
		cavernita=Cavern.new(10,10)
		cavernita.generateNeighbors()

		expect(cavernita.getCavern(0,0).rightNeighbor.caveNumber).to eq(1)
	end
	it 'devuelve el valor de la caverna izquierda vecina' do
		cavernita=Cavern.new(10,10)
		cavernita.generateNeighbors()

		expect(cavernita.getCavern(7,5).leftNeighbor.caveNumber).to eq(74)
	end
	it 'devuelve el valor de la caverna superior vecina' do
		cavernita=Cavern.new(10,10)
		cavernita.generateNeighbors()

		expect(cavernita.getCavern(5,6).topNeighbor.caveNumber).to eq(46)
	end
	it 'el wumpus se encuentra al medio de las cavernas al iniciar el juego' do
		cavernita=Cavern.new(9,8)
		expect(cavernita.getCavern(5,4).isWumpusHere).to eq(true)
	end

	it 'El wumpus se movio una posicion arriba' do
		cavernita = Cavern.new(9,8)
		cavernita.moveWumpusOnePosToTop
		expect(cavernita.getCavern(5,3).isWumpusHere).to eq(true)
	end
	it 'El wumpus se movio una posicion abajo' do
		cavernita = Cavern.new(9,8)
		cavernita.moveWumpusOnePosToBottom
		expect(cavernita.getCavern(5,5).isWumpusHere).to eq(true)
	end
	it 'El wumpus se movio una posicion a la izquierda' do
		cavernita = Cavern.new(9,8)
		cavernita.moveWumpusOnePosToLeft
		expect(cavernita.getCavern(4,4).isWumpusHere).to eq(true)
	end
	it 'El wumpus se movio una posicion a la derecha' do
		cavernita = Cavern.new(9,8)
		cavernita.moveWumpusOnePosToRight
		expect(cavernita.getCavern(6,4).isWumpusHere).to eq(true)
	end

end
