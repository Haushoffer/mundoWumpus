require './lib/cave.rb'
class Character
	attr_accessor :caveOfPosition, :numberOfArrows

	def initialize(caveOfPosition)
		@caveOfPosition = caveOfPosition
		@numberOfArrows=0
	end

	def canGoNorth()
		theCaveHasAnArrow()
	 	@caveOfPosition.topNeighbor != nil
	end 

	def canGoSouth()
		theCaveHasAnArrow()
		@caveOfPosition.bottomNeighbor != nil
	end

	def canGoEast()
		theCaveHasAnArrow()
		@caveOfPosition.rightNeighbor != nil
	end

	def canGoWest()
		theCaveHasAnArrow()
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
	def theCaveHasAnArrow()
		if(@caveOfPosition.thereIsAnArrowHere()==true)
			pickArrow()
			@caveOfPosition.arrowPicked()
		end
	end
	def pickArrow()
		@numberOfArrows=@numberOfArrows+1
	end
	def shootArrow()
		@numberOfArrows=@numberOfArrows-1
	end
end


