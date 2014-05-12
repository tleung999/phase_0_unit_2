# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?
# Create a new new method called total
# Allow the new method called total to accept 1 array as an argument
# Calculate the sum of the array and return the sum
# Create another method called sentence_maker
# Allow the new method called sentence_maker to accept 1 array as an argument
# Join all the array elements together to become 1 long sentence.
# Capitalize the first letter in the sentence
# Place a period at the end of the sentence.


# 2. Initial Solution
def total array
	sum = 0
	array.each do |x|
		sum = sum + x
	end
	return sum
end


def sentence_maker array
	sentence = ""
	first = array.shift.capitalize + " "
	last = array.pop + "."
	array.each do |x|
		sentence = sentence << x.to_s + " "
	end
	return sentence = first + sentence + last
end

# 3. Refactored Solution
def total array
	return array.reduce(:+)
end

def sentence_maker array
	return array.join(" ").capitalize + "."
end

# 4. Reflection 