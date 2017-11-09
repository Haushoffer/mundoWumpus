require './lib/cave.rb'
class Cavern
	attr_accessor :wumpusX,:wumpusY
	def initialize(sizex, sizey)
	    $x_length = sizex
	    $y_length = sizey
	    $play_area = []
	    #initialize dead cells
	    caveCounter=0
	    $x_length.times do |x|
		  $play_area[x] ||= []
		  $y_length.times do |y|
		    $play_area[x][y] = Cave.new(nil,nil,nil,nil,caveCounter)
		  	caveCounter=caveCounter+1
		  end
		end
		@wumpusX = (sizex+1)/2
		@wumpusY = (sizey+1)/2
		$play_area[wumpusX][wumpusY].hostWumpus
	end
	def getCavern(row,column)
		return $play_area[row][column]
	end
	def generateNeighbors()
		fillUpperEdge()
		fillLowerEdge()
		fillLeftEdge()
		fillRightEdge()
		for rows in 1..$x_length-2
			for cols in 0..$y_length-2

				if  (rows>=1 and rows<$x_length-1) and (cols>=1 and cols<$y_length-1)
					$play_area[rows][cols].assignBottomNeighbor($play_area[rows+1][cols])
					$play_area[rows][cols].assignRightNeighbor($play_area[rows][cols+1])
					$play_area[rows][cols].assignTopNeighbor($play_area[rows-1][cols])
					$play_area[rows][cols].assignLeftNeighbor($play_area[rows][cols-1])
				end						
			end
		end				
	end
	def fillLeftEdge()
		cols=0
		for rows in 1..$x_length-2
			$play_area[rows][cols].assignBottomNeighbor($play_area[rows+1][cols])
			$play_area[rows][cols].assignRightNeighbor($play_area[rows][cols+1])
			$play_area[rows][cols].assignTopNeighbor($play_area[rows-1][cols])
		end
	end
	def fillRightEdge()
		cols=$y_length-1
		for rows in 1..$x_length-2
			$play_area[rows][cols].assignBottomNeighbor($play_area[rows+1][cols])
			$play_area[rows][cols].assignTopNeighbor($play_area[rows-1][cols])
			$play_area[rows][cols].assignLeftNeighbor($play_area[rows][cols-1])
		end
	end
	def fillUpperEdge()
		rows=0
		$play_area[rows][0].assignBottomNeighbor($play_area[rows+1][0])
		$play_area[rows][0].assignRightNeighbor($play_area[rows][1])
		for cols in 1..$y_length-2
			$play_area[rows][cols].assignBottomNeighbor($play_area[rows+1][cols])
			$play_area[rows][cols].assignRightNeighbor($play_area[rows][cols+1])
			$play_area[rows][cols].assignLeftNeighbor($play_area[rows][cols-1])
		end
		$play_area[rows][$y_length-1].assignBottomNeighbor($play_area[rows+1][$y_length-1])
		$play_area[rows][$y_length-1].assignLeftNeighbor($play_area[rows][$y_length-2])
	end
	def fillLowerEdge()
		rows=$x_length-1
		$play_area[rows][0].assignTopNeighbor($play_area[rows-1][0])
		$play_area[rows][0].assignRightNeighbor($play_area[rows][1])
		for cols in 1..$y_length-2
			$play_area[rows][cols].assignTopNeighbor($play_area[rows-1][cols])
			$play_area[rows][cols].assignRightNeighbor($play_area[rows][cols+1])
			$play_area[rows][cols].assignLeftNeighbor($play_area[rows][cols-1])
		end
		$play_area[rows][$y_length-1].assignTopNeighbor($play_area[rows-1][$y_length-1])
		$play_area[rows][$y_length-1].assignLeftNeighbor($play_area[rows][$y_length-2])
	end
	def getWelcomeMessage()
		return "Bienvenido al Mapa por Defecto"
	end
	def moveWumpusOnePosToTop
		$play_area[@wumpusX][@wumpusY].oustWumpus
		@wumpusY = @wumpusY - 1
		$play_area[@wumpusX][@wumpusY].hostWumpus
	end
	def moveWumpusOnePosToBottom
		$play_area[@wumpusX][@wumpusY].oustWumpus
		@wumpusY = @wumpusY + 1
		$play_area[@wumpusX][@wumpusY].hostWumpus
	end
	def moveWumpusOnePosToLeft
		$play_area[@wumpusX][@wumpusY].oustWumpus
		@wumpusX = @wumpusX - 1
		$play_area[@wumpusX][@wumpusY].hostWumpus
	end
	def moveWumpusOnePosToRight
		$play_area[@wumpusX][@wumpusY].oustWumpus
		@wumpusX = @wumpusX + 1
		$play_area[@wumpusX][@wumpusY].hostWumpus
	end
	def moveWumpusRandomly
		newpos = rand(1..4)
		if newpos == 1 #top
			if($play_area[@wumpusX][@wumpusY].topNeighbor.nil?)
				moveWumpusRandomly
			else
				moveWumpusOnePosToTop
			end
		end
		if newpos == 2 #right
			if($play_area[@wumpusX][@wumpusY].rightNeighbor.nil?)
				moveWumpusRandomly
			else
				moveWumpusOnePosToRight
			end
		end
		if newpos == 3 #bot
			if($play_area[@wumpusX][@wumpusY].bottomNeighbor.nil?)
				moveWumpusRandomly
			else
				moveWumpusOnePosToBottom
			end
		end
		if newpos == 4 #left
			if($play_area[@wumpusX][@wumpusY].leftNeighbor.nil?)
				moveWumpusRandomly
			else
				moveWumpusOnePosToLeft
			end
		end
	end
end