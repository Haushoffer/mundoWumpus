require './lib/cave.rb'
class Wumpus
    attr_accessor :caveOfPosition, :wumpusAlive
    def initialize(caveOfPosition)
        @caveOfPosition = caveOfPosition
        @caveOfPosition.hostWumpus
        setSmellAround(true)
        @wumpusAlive = true
    end
end