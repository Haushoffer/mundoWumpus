require "./lib/cavern.rb"
require "./lib/cave.rb"
require "./lib/wumpus.rb"
describe Wumpus do
    it 'El wumpus se movio una posicion arriba' do
        cavernita = Cavern.new(9,8)
        cavernita.generateNeighbors()
        wumpus = Wumpus.new(cavernita.getCavern(5,4))
		wumpus.moveWumpusOnePosToTop
		expect(cavernita.getCavern(5,4).isWumpusHere).to eq(false)
		expect(cavernita.getCavern(4,4).isWumpusHere).to eq(true)
    end
    it 'El wumpus devuelve true a isLock' do
        cavernita = Cavern.new(9,8)
        cavernita.generateNeighbors()
        wumpus = Wumpus.new(cavernita.getCavern(5,4))
        wumpus.lock
		expect(wumpus.isLock).to eq(true)
    end
    it 'El wumpus se movio una posicion arriba y el olor lo acompaña' do
        cavernita = Cavern.new(9,8)
        cavernita.generateNeighbors()
        wumpus = Wumpus.new(cavernita.getCavern(5,4))
		wumpus.moveWumpusOnePosToTop
		expect(cavernita.getCavern(5,4).isWumpusHere).to eq(false)
		expect(cavernita.getCavern(5,4).smell).to eq(true)
		expect(cavernita.getCavern(4,4).isWumpusHere).to eq(true)
		expect(cavernita.getCavern(6,3).smell).to eq(false)
    end
    it 'El wumpus se movio una posicion abajo' do
        cavernita = Cavern.new(9,8)
        cavernita.generateNeighbors()
        wumpus = Wumpus.new(cavernita.getCavern(5,4))
		wumpus.moveWumpusOnePosToBottom
		expect(cavernita.getCavern(5,4).isWumpusHere).to eq(false)
		expect(cavernita.getCavern(6,4).isWumpusHere).to eq(true)
    end
    it 'El wumpus se movio una posicion a la izquierda' do
        cavernita = Cavern.new(9,8)
        cavernita.generateNeighbors()
        wumpus = Wumpus.new(cavernita.getCavern(5,4))
		wumpus.moveWumpusOnePosToLeft
		expect(cavernita.getCavern(5,4).isWumpusHere).to eq(false)
		expect(cavernita.getCavern(5,3).isWumpusHere).to eq(true)
    end
    it 'El wumpus se movio una posicion a la derecha' do
        cavernita = Cavern.new(9,8)
        cavernita.generateNeighbors()
        wumpus = Wumpus.new(cavernita.getCavern(5,4))
		wumpus.moveWumpusOnePosToRight
		expect(cavernita.getCavern(5,4).isWumpusHere).to eq(false)
		expect(cavernita.getCavern(5,5).isWumpusHere).to eq(true)
	end
	it 'EL wumpus se movio a una caverna contigua aleatoria' do
        cavernita = Cavern.new(9,8)
        cavernita.generateNeighbors()
        wumpus = Wumpus.new(cavernita.getCavern(5,4))
		cavernita.generateNeighbors()
		wumpus.moveWumpusRandomly
		expect(cavernita.getCavern(5,4).isWumpusHere).to eq(false)
	end
	it 'El wumpus murio' do
		cavernita = Cavern.new(9,8)
        cavernita.generateNeighbors()
        wumpus = Wumpus.new(cavernita.getCavern(5,4))
		wumpus.killWumpus
		expect(wumpus.wumpusAlive).to eq(false)
	end
end