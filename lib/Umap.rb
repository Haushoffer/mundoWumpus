require './lib/cave.rb'
class UMap
	attr_accessor :name
	def initialize()
		@name="U Map"
	    $x_length = 8
	    $y_length = 8
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
		$play_area[1][0].assignArrow()
		$play_area[5][0].assignSpray()
	end
	def getCavern(row,column)
		return $play_area[row][column]
	end
	def generateNeighbors()
		row=0
		column=0
		length=$x_length
		fillDown(row,column,length)
		row=length-1
		fillRight(row,column,length)
		column=length-1
		fillUp(row,column,length)
	end
	def fillRight(row, column, length) 
		$play_area[row][column].assignRightNeighbor($play_area[row][column+1])
		for i in column+1..length-2
			$play_area[row][i].assignLeftNeighbor($play_area[row][i-1])
			$play_area[row][i].assignRightNeighbor($play_area[row][i+1])
		end
		$play_area[row][column+(length-1)].assignLeftNeighbor($play_area[row][column+(length-2)])
	end
	def fillDown(row, column, length) 
		$play_area[row][column].assignBottomNeighbor($play_area[row+1][column])
		for i in row+1..length-2
			$play_area[i][column].assignTopNeighbor($play_area[i-1][column])
			$play_area[i][column].assignBottomNeighbor($play_area[i+1][column])
		end
		$play_area[row+(length-1)][column].assignTopNeighbor($play_area[row+(length-2)][column])
	end
	def fillLeft(row, column, length) 
		$play_area[row][column].assignLeftNeighbor($play_area[row][column-1])
		for i in (column-1)..(column-(length-2))
			$play_area[row][i].assignLeftNeighbor($play_area[row][i-1])
			$play_area[row][i].assignRightNeighbor($play_area[row][i+1])
		end
		$play_area[row][column-(length-1)].assignRightNeighbor($play_area[row][column-(length-2)])
	end
	def fillUp(row, column, length) 
		$play_area[row][column].assignTopNeighbor($play_area[row-1][column])
		for i in (row-1)..(row-(length-2))
			$play_area[i][column].assignTopNeighbor($play_area[i-1][column])
			$play_area[i][column].assignBottomNeighbor($play_area[i+1][column])
		end
		$play_area[row-(length-1)][column].assignBottomNeighbor($play_area[row-(length-2)][column])
	end
end