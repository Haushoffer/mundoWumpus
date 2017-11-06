class Cave
	attr_accessor :topNeighbor,:bottomNeighbor,:leftNeighbor,:rightNeighbor,:caveNumber,:isWumpusHere

	def initialize(topNeighbor,bottomNeighbor,leftNeighbor,rightNeighbor,caveNumber)
		@topNeighbor = topNeighbor
		@bottomNeighbor = bottomNeighbor
		@rightNeighbor = rightNeighbor
		@leftNeighbor = leftNeighbor
		@caveNumber = caveNumber
		@isWumpusHere = false
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
end


