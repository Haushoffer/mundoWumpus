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
		for rows in 0..$x_length-1
			for cols in 0..$y_length-1

				if rows==0 and cols==0
					$play_area[rows][cols].assignBottomNeighbor($play_area[rows+1][cols])
					$play_area[rows][cols].assignRightNeighbor($play_area[rows][cols+1])
				elsif rows==$x_length-1 and cols==$y_length-1
					$play_area[rows][cols].assignTopNeighbor($play_area[rows-1][cols])
					$play_area[rows][cols].assignLeftNeighbor($play_area[rows][cols-1])
				elsif  rows>=1 and rows<$x_length-1 and cols>=1 and cols<$y_length-1
					$play_area[rows][cols].assignBottomNeighbor($play_area[rows+1][cols])
					$play_area[rows][cols].assignRightNeighbor($play_area[rows][cols+1])
					$play_area[rows][cols].assignTopNeighbor($play_area[rows-1][cols])
					$play_area[rows][cols].assignLeftNeighbor($play_area[rows][cols-1])
				end						
			end
		end				
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
end