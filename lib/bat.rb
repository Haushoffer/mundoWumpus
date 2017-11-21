require './lib/cave.rb'
class Bat
    attr_accessor :caveOfPosition, :wumpusAlive
    def initialize(caveOfPosition)
        @caveOfPosition = caveOfPosition
        @caveOfPosition.hostBat
        @wumpusAlive = true
    end
end