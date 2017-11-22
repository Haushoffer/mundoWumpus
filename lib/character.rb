require './lib/cave.rb'
class Character
	attr_accessor :caveOfPosition, :numberOfArrows, :numberOfSpray, :coins

	def initialize(caveOfPosition)
		@caveOfPosition = caveOfPosition
		@numberOfArrows=0
		@numberOfSpray=10
		@coins=0
	end

	def canGoNorth()
		theCaveHasAnArrowOrASpray()
	 	@caveOfPosition.topNeighbor != nil
	end 

	def canGoSouth()
		theCaveHasAnArrowOrASpray()
		@caveOfPosition.bottomNeighbor != nil
	end

	def canGoEast()
		theCaveHasAnArrowOrASpray()
		@caveOfPosition.rightNeighbor != nil
	end

	def canGoWest()
		theCaveHasAnArrowOrASpray()
		@caveOfPosition.leftNeighbor != nil
	end

	def moveNorth()
		if(@caveOfPosition.batStunned)
			@caveOfPosition.isBatHere=true
		end
		@caveOfPosition=@caveOfPosition.topNeighbor
	end

	def moveSouth()
		if(@caveOfPosition.batStunned)
			@caveOfPosition.isBatHere=true
		end
		@caveOfPosition=@caveOfPosition.bottomNeighbor
	end

	def moveEast()
		if(@caveOfPosition.batStunned)
			@caveOfPosition.isBatHere=true
		end
		@caveOfPosition=@caveOfPosition.rightNeighbor
	end

	def moveWest()
		if(@caveOfPosition.batStunned)
			@caveOfPosition.isBatHere=true
		end
		@caveOfPosition=@caveOfPosition.leftNeighbor
	end

	def getNumberOfCavePositionated()
		@caveOfPosition.caveNumber
	end
	def theCaveHasAnArrowOrASpray()
		if(@caveOfPosition.thereIsAnArrowHere()==true)
			pickArrow()
			@caveOfPosition.arrowPicked()
		end
		if(@caveOfPosition.thereIsASprayHere()==true)
			pickSpray()
			@caveOfPosition.sprayPicked()
		end
	end
	def pickArrow()
		@numberOfArrows=@numberOfArrows+1
	end
	def shootArrow()
		if(@caveOfPosition.batStunned)
			@caveOfPosition.isBatHere=true
		end
		@numberOfArrows=@numberOfArrows-1
	end
	def pickSpray()
		@numberOfSpray=@numberOfSpray+1
	end
	def useSpray()
		if(@caveOfPosition.batStunned)
			@caveOfPosition.isBatHere=true
		end
		@numberOfSpray=@numberOfSpray-1
	end
	def setCoins(c)
		@coins = c
	end
	def setPos(cavePos)
		@caveOfPosition = cavePos
	end
	def withBats
		return @caveOfPosition.isBatHere
	end
end


