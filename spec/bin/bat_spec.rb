require "./lib/bat.rb"
require "./lib/cave.rb"
describe Bat do 
    it 'crear murcielago en una caverna' do
        cave = Cave.new(nil,nil,nil,nil,10)
        bat = Bat.new(cave)
        expect(cave.isBatHere).to eq(true)
    end
    it 'Escuchar zumbido del murcielago al norte de la caverna del murcielago' do
        cave = Cave.new(nil,nil,nil,nil,10)
        cavenorte = Cave.new(nil,nil,nil,nil,9)
        cave.assignTopNeighbor(cavenorte)
        bat = Bat.new(cave)
        expect(cave.topNeighbor.whir).to eq(true)
    end
    it 'Escuchar zumbido del murcielago al sur de la caverna del murcielago' do
        cave = Cave.new(nil,nil,nil,nil,10)
        cavesur = Cave.new(nil,nil,nil,nil,9)
        cave.assignBottomNeighbor(cavesur)
        bat = Bat.new(cave)
        expect(cave.bottomNeighbor.whir).to eq(true)
    end
    it 'Escuchar zumbido del murcielago al este de la caverna del murcielago' do
        cave = Cave.new(nil,nil,nil,nil,10)
        caveeste = Cave.new(nil,nil,nil,nil,9)
        cave.assignRightNeighbor(caveeste)
        bat = Bat.new(cave)
        expect(cave.rightNeighbor.whir).to eq(true)
    end
    it 'Escuchar zumbido del murcielago al oeste de la caverna del murcielago' do
        cave = Cave.new(nil,nil,nil,nil,10)
        caveoeste = Cave.new(nil,nil,nil,nil,9)
        cave.assignLeftNeighbor(caveoeste)
        bat = Bat.new(cave)
        expect(cave.leftNeighbor.whir).to eq(true)
    end
end