class Cave
	attr_accessor :topNeighbor,:bottomNeighbor,:leftNeighbor,:rightNeighbor,:caveNumber,:isWumpusHere,:isBatHere,:smell, :arrow, :spray, :whir, :batStunned

	def initialize(topNeighbor,bottomNeighbor,leftNeighbor,rightNeighbor,caveNumber)
		@topNeighbor = topNeighbor
		@bottomNeighbor = bottomNeighbor
		@rightNeighbor = rightNeighbor
		@leftNeighbor = leftNeighbor
		@caveNumber = caveNumber
		@isWumpusHere = false
		@isBatHere = false
		@smell = false
		@arrow = false
		@spray = false
		@batStunned = false
		@whir = false #aleteo-zumbido

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
	def stunTheBat()
		if(thereIsABatHere())
			@isBatHere=false
		end
		@batStunned = true
	end
	def hostWumpus()
		@isWumpusHere = true
	end
	def oustWumpus()
		@isWumpusHere = false
	end
	def hostBat()
		@isBatHere = true
	end
	def oustBat()
		@isBatHere = false
	end
	def thereIsAnArrowHere()
		return @arrow
	end
	def thereIsASprayHere()
		return @spray
	end
	def thereIsABatHere()
		return @isBatHere
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
	def setSmell(v)
		@smell = v
	end
	def setWhir(v)
		@whir = v
	end
end


