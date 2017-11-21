require "./lib/cavern.rb"
require "./lib/cave.rb"

describe Cave do 
	it 'devuelve el numero de caverna' do
		cave = Cave.new(nil,nil,nil,nil,10)
		expect(cave.caveNumber).to eq(10)
	end

	it 'devuelve el numero 10 de caverna superior vecina' do
		caveTop = Cave.new(nil,nil,nil,nil,10)
		cave = Cave.new(caveTop,nil,nil,nil,5)
	
		expect(cave.topNeighbor.caveNumber).to eq(10)
	end

	it 'devuelve el numero 9 de caverna inferior vecina' do
		caveBottom = Cave.new(nil,nil,nil,nil,9)
		cave = Cave.new(nil,caveBottom,nil,nil,10)
	
		expect(cave.bottomNeighbor.caveNumber).to eq(9)
	end

	it 'devuelve el numero 8 de caverna izquierda vecina' do
		caveLeft = Cave.new(nil,nil,nil,nil,8)
		cave = Cave.new(nil,nil,caveLeft,nil,5)
	
		expect(cave.leftNeighbor.caveNumber).to eq(8)
	end

	it 'devuelve el numero 5 de caverna superior vecina' do
		caveRight = Cave.new(nil,nil,nil,nil,5)
		cave = Cave.new(nil,nil,nil,caveRight,6)
	
		expect(cave.rightNeighbor.caveNumber).to eq(5)
	end
	it 'devuelve false si el wumpus no se encuetra en la cueva' do
		cave = Cave.new(nil,nil,nil,nil,10)
		expect(cave.isWumpusHere).to eq(false)
	end
	it 'devuelve true si el wumpus se encuetra en la cueva' do
		cave = Cave.new(nil,nil,nil,nil,10)
		cave.hostWumpus
		expect(cave.isWumpusHere).to eq(true)
	end
	it 'devuelve true si existe olor en la cueva' do
		cave = Cave.new(nil,nil,nil,nil,10)
		cave.smell=true
		expect(cave.smell).to eq(true)
	end
	it 'devuelve false si no hay olor en la cueva' do
		cave = Cave.new(nil,nil,nil,nil,10)
		expect(cave.smell).to eq(false)
	end
	it 'aignar flecha a una caverna' do
		cave = Cave.new(nil,nil,nil,nil,10)
		cave.assignArrow()
		expect(cave.arrow).to eq(true)
	end
	it 'asignar murcielago a una caverna' do
		cave = Cave.new(nil,nil,nil,nil,10)
		cave.hostBat
		expect(cave.isBatHere).to eq(true)
	end
end
