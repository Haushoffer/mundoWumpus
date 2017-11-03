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
end
