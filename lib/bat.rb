require './lib/cave.rb'
class Bat
    attr_accessor :caveOfPosition, :batAlive
    def initialize(caveOfPosition)
        @caveOfPosition = caveOfPosition
        @caveOfPosition.hostBat()
        @batAlive = true
        setSmellAround(true)
    end
    def setSmellAround(value)
        if (@caveOfPosition.topNeighbor != nil)
            @caveOfPosition.topNeighbor.setWhir(value)
        end
        if (@caveOfPosition.bottomNeighbor != nil)
            @caveOfPosition.bottomNeighbor.setWhir(value)
        end
        if (@caveOfPosition.leftNeighbor != nil)
            @caveOfPosition.leftNeighbor.setWhir(value)
        end
        if (@caveOfPosition.rightNeighbor != nil)
            @caveOfPosition.rightNeighbor.setWhir(value)
        end
    end
end