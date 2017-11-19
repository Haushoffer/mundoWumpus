require './lib/cave.rb'
class Wumpus
    attr_accessor :caveOfPosition, :wumpusAlive
    def initialize(caveOfPosition)
        @caveOfPosition = caveOfPosition
        @caveOfPosition.hostWumpus
        setSmellAround(true)
        @wumpusAlive = true
    end
    
    def setSmellAround(value)
        if (@caveOfPosition.topNeighbor != nil)
            @caveOfPosition.topNeighbor.setSmell(value)
        end
        if (@caveOfPosition.bottomNeighbor != nil)
            @caveOfPosition.bottomNeighbor.setSmell(value)
        end
        if (@caveOfPosition.leftNeighbor != nil)
            @caveOfPosition.leftNeighbor.setSmell(value)
        end
        if (@caveOfPosition.rightNeighbor != nil)
            @caveOfPosition.rightNeighbor.setSmell(value)
        end
    end
    def moveWumpusOnePosToTop
        setSmellAround(false)
        @caveOfPosition.topNeighbor.hostWumpus
        @caveOfPosition.oustWumpus
        @caveOfPosition = @caveOfPosition.topNeighbor
		setSmellAround(true)
	end
	def moveWumpusOnePosToBottom
        setSmellAround(false)
        @caveOfPosition.bottomNeighbor.hostWumpus
        @caveOfPosition.oustWumpus
        @caveOfPosition = @caveOfPosition.bottomNeighbor
		setSmellAround(true)
	end
	def moveWumpusOnePosToLeft
        setSmellAround(false)
        @caveOfPosition.leftNeighbor.hostWumpus
        @caveOfPosition.oustWumpus
        @caveOfPosition = @caveOfPosition.leftNeighbor
		setSmellAround(true)
	end
	def moveWumpusOnePosToRight
        setSmellAround(false)
        @caveOfPosition.rightNeighbor.hostWumpus
        @caveOfPosition.oustWumpus
        @caveOfPosition = @caveOfPosition.rightNeighbor
		setSmellAround(true)
    end
    def moveWumpusRandomly
		newpos = rand(1..4)
		if newpos == 1 #top
			if(@caveOfPosition.topNeighbor.nil?)
				moveWumpusRandomly
			else
				moveWumpusOnePosToTop
			end
		end
		if newpos == 2 #right
			if(@caveOfPosition.rightNeighbor.nil?)
				moveWumpusRandomly
			else
				moveWumpusOnePosToRight
			end
		end
		if newpos == 3 #bot
			if(@caveOfPosition.bottomNeighbor.nil?)
				moveWumpusRandomly
			else
				moveWumpusOnePosToBottom
			end
		end
		if newpos == 4 #left
			if(@caveOfPosition.leftNeighbor.nil?)
				moveWumpusRandomly
			else
				moveWumpusOnePosToLeft
			end
		end
	end
    def killWumpus
		@wumpusAlive = false
	end
end