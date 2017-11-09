require './lib/cave.rb'
class Cavern
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
end