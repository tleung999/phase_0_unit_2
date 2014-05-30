# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself].


# 2. Pseudocode
=begin
	Create a class called BoggleBoard
	Create a attr_reader to allow you to read the data in board
	Create an initialize method that takes in 1 2D array and assign it to the instance variable @board
	Create a create_word method that takes in a wildcard of arguments.   These arguments are array coordinates such as [0,3].
	 	In the create_word method, map the letters of each coordinates into an array and then join them together to form the word.
	Create a get_row method that takes in 1 argument that is an integer
		return the row selected
	Create a get_col method that takes in 1 argument that is an integer
		Transpose the rows to columns on the board
		return the col selected

=end

# 3. Initial Solution
class BoggleBoard
	attr_reader :board

	def initialize(board)
		@board = board
	end

	def create_word(*coords)
    coords.map { |coord| @board[coord.first][coord.last]}.join("")
	end
 
 	def get_row(row)
  	board[row].join("")
	end

	def get_col(col)
		transpose_board = board.transpose
		transpose_board[col].join("")
	end

	def get_diagonal(startcord, endcord)
		diagonal_word = []
		raise "These coordinates does not make a diagonal" unless startcord.inject(:-).abs == endcord.inject(:-).abs
		
		until (startcord == endcord) do
				diagonal_word << @board[startcord.first][startcord.last]		
				if startcord[0] > endcord[0]
					startcord[0] -= 1
				else
					startcord[0] += 1
				end

				if startcord[1] > endcord[1]
					startcord[1] -= 1
				else
					startcord[1] += 1
				end
		end
		diagonal_word << @board[endcord.first][endcord.last]
		diagonal_word.join("")
	end

end

# 4. Refactored Solution
=begin
	I dont think there is anything I can do to make it more refactored.    I believe my solution is DRY and the
	variables are named pretty well.  Also after adding in the get_diagonal method, I'm not exactly sure how to refactor the code.   I needed to deal with each array element individually, compare each piece to the end coordinates and then decide whether to increment by 1 or decrement by 1. 
=end



# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]

boggle_board = BoggleBoard.new(dice_grid)

def assert
  raise "Assertion failed!" unless yield
end

#These coordinates create the word "dock"
assert { boggle_board.create_word([1,2], [1,1], [2,1], [3,2])  == "dock" }

#These coordinates create the word "code"
assert { boggle_board.create_word([2,1], [1,1], [1,2], [0,3]) == "code"}

#These coordinates create the word "rad"
assert { boggle_board.create_word([0,1], [0,2], [1,2]) == "rad" }

#Get row one - should return "iodt"
assert { boggle_board.get_row(1) == "iodt" }

#Get row three - should return "take"
assert { boggle_board.get_row(3) == "take" }

#Get column zero - should return "biet"
assert { boggle_board.get_col(0) == "biet"}

#Get column two - should return "adlk"
assert { boggle_board.get_col(2) == "adlk"}

#print out all rows and columns as strings
4.times { |a| p boggle_board.get_row(a) }
4.times { |b| p boggle_board.get_col(b) }
#Results - Only real word is "take"
# "brae"
# "iodt"
# "eclr"
# "take"
# "biet"
# "roca"
# "adlk"
# "etre"

#Access an individual coordinate
assert { boggle_board.create_word([3,2]) == "k" }

#Return diagonal word "edct"
assert { boggle_board.get_diagonal([0,3], [3,0]) == "edct" }

#Return diagonal word "ick"
assert { boggle_board.get_diagonal([1,0], [3,2]) == "ick" }

#Return diagonal word "ta"
assert { boggle_board.get_diagonal([1,3], [0,2]) == "ta" }

# 5. Reflection 
=begin
	Most of the challenge wasnt very difficult, the tough part of this challenge was the get_diagonal method.   I had to first break out the start coordinate into the row index, compare it to the end row index to figure out whether to increment or decrement the row index.   Then take the column index, compare it the end column index to figure out whether to increment or decrement the column index.    I also had problems trying to figure out how to throw an error if the diagonal coordinates isnt a diagonal.   The application will automatically throw a NoMethodError if it moves outside of its grid boundaries.   I am still trying to learn how to hand exceptions correctly and how to raise and rescue errors.   This was a fun exercise and I learn how to build the asserts better.
=end