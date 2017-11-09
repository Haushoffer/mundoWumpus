require './lib/cave.rb'
class Character
	attr_accessor :caveOfPosition

	def initialize(caveOfPosition)
		@caveOfPosition = caveOfPosition
	end

	def canGoNorth()
	 	@caveOfPosition.topNeighbor != nil
	end 

	def canGoSouth()
		@caveOfPosition.bottomNeighbor != nil
	end

	def canGoEast()
		@caveOfPosition.rightNeighbor != nil
	end

	def canGoWest()
		@caveOfPosition.leftNeighbor != nil
	end

	def moveNorth()
		@caveOfPosition=@caveOfPosition.topNeighbor
	end

	def moveSouth()
		@caveOfPosition=@caveOfPosition.bottomNeighbor
	end

	def moveEast()
		@caveOfPosition=@caveOfPosition.rightNeighbor
	end

	def moveWest()
		@caveOfPosition=@caveOfPosition.leftNeighbor
	end

	def getNumberOfCavePositionated()
		@caveOfPosition.caveNumber
	end

end


