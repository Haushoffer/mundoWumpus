class Cave
	attr_accessor :topNeighbor,:bottomNeighbor,:leftNeighbor,:rightNeighbor,:caveNumber,:isWumpusHere,:smell, :arrow, :spray

	def initialize(topNeighbor,bottomNeighbor,leftNeighbor,rightNeighbor,caveNumber)
		@topNeighbor = topNeighbor
		@bottomNeighbor = bottomNeighbor
		@rightNeighbor = rightNeighbor
		@leftNeighbor = leftNeighbor
		@caveNumber = caveNumber
		@isWumpusHere = false
		@smell = false
		@arrow = false
		@spray = false
	end
	def assignBottomNeighbor(newNighbor)
	 	@bottomNeighbor = newNighbor
	end 	
	def assignTopNeighbor(newNighbor)
		@topNeighbor= newNighbor
	end
	def assignLeftNeighbor(newNighbor)
		@leftNeighbor= newNighbor
	end
	def assignRightNeighbor(newNighbor)
		@rightNeighbor= newNighbor
	end
	def hostWumpus()
		@isWumpusHere = true
	end
	def oustWumpus()
		@isWumpusHere = false
	end
	def thereIsAnArrowHere()
		return @arrow
	end
	def thereIsASprayHere()
		return @spray
	end
	def arrowPicked()
		@arrow=false
	end
	def assignArrow()
		@arrow=true
	end
	def sprayPicked()
		@spray = false
	end
	def assignSpray()
		@spray = true
	end
end


