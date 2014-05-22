# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [by myself, with: John Akers ].

$boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
# No Pseudocode, this was taken from the example.

# Initial Solution
def create_word(board, *coords)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
end

# Refactored Solution
#The code is already clean and refactored.

# DRIVER TESTS GO BELOW THIS LINE
puts create_word($boggle_board, [2,1], [1,1], [1,2], [0,3])  == 'code'
puts create_word($boggle_board, [0,1], [0,2], [1,2])  == 'rad'


# Reflection 
#Its great to see how you can pass more than 1 argument into a method by using the slat or * in front of the variable.  Also using map and join together really trimmed down the code.

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
#Create a new method called get_row that allows 1 argument called row
#Return the row of the boggle_board

# Initial Solution
def get_row(row)
  return $boggle_board[row]
end
p get_row(2)
# Refactored Solution
# There really is no refactored solution 

# DRIVER TESTS GO BELOW THIS LINE
p get_row(2) ==  ["e", "c", "l", "r"]
p get_row(1) ==  ["i", "o", "d", "t"]

# Reflection 
#When john and I worked together, we we're trying out different ways to display the row information in IRB and found simply using boggle_board[row] to be the best solution.   We also changed the boggle_board to a global variable.   I dont know if that is cheating, but that is our way to accessing the board without having to pass the board into the method.


#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
#Create a new method called get_col that allows 1 arguement called col
#Create a new blank array called col_list
#Based on the length of the board, iterate x times
#   Insert the current row with the col we passed in from the argument to the current slow in the new array col_list.
#Return the col_list back to the caller.

# Initial Solution
# def get_col(col)
# 	col_list = []
#   $boggle_board.length.times do |a|
#      col_list[a] = $boggle_board[a][col]
#   end
#   col_list
# end

# p get_col(2)

# Secondary Solution - We wanted to try it a different way.
# def get_col(col)
# 	col_list = []
# 	counter = 0
# 	until counter == $boggle_board.size
# 		col_list[counter] = $boggle_board[counter][col]
# 		counter += 1
# 	end
# 	col_list
# end
# p get_col(2)

# Refactored Solution
# We found the Matrix class and found the transpose method.   Its so funny to think there is something in ruby that can do this so easily.
def get_col(col)
	transpose_board = $boggle_board.transpose
	return transpose_board[col]
end
p get_col(2)

# DRIVER TESTS GO BELOW THIS LINE
p get_col(3) == ["e", "t", "r", "e"]
p get_col(1) == ["r", "o", "c", "a"]

# Reflection
# We knew we had to iterate through the board since each column element is located on different array rows.   So we set the column to be the 2nd array index and the first index is the counter as you iterate x times based on the length of the board.   John also tried a secondary solution to see how we can do it using a counter.    Though its not idea to make your variable global, setting boggle_board to global took care of the second argument passing and it allowed us to easily read its values.   When we finished this last part, we thought there is probably no way to refactored the code.   But then we talked about if we can flip flop the rows and columns.   Then John mentioned a matrix and I did a search on Google for changing rows to columns matrix in ruby.   We ended up finding the Matrix class in the docs and there was an example of transpose.    I really didnt think this was going to work, but it worked flawlessly.   We made the code much leaner using transpose.   We really enjoyed this challenge, it was fun learning by trying things out in IRB and working together to come up with different ideas.    

