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
# Return sentence


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
=begin
Having a clear understanding of the problem was absolutely key in building my pseudo code and everything else down the line
I had to read the directions at least 4 times before I was exactly sure of what they want.   You really dont want 
to miss anything, else you need to rewrite the pseudo code again. I tried my best to be clear on what methods to create, 
how many arguements, what you want to achieve with the data being pushed into the method.   

I had some slight problems remembering the exact syntax in Ruby since we've been working on Javascript the past week
and I intermingled the syntax.    Also I realized that if I didnt declare a new varible as something and start using it
in the array iteration, it will error out.    But once I figured it out, things started to come back to me.   In my initial 
solution, I was pretty crude in devising a way to add the array and contatenate the array.   I broke up the pieces such as shifting
out the first array element, capitalizing that, poping out the last array element and adding a period to it, contatenate everything
in between and then finally put it all together.   Ruby-doc.org really helped bring back how to write the syntax.

During the refactor solution part, I recalled the enumerable class and it has a lot of short hand ways of doing thing.  So 
I went there to look up some ways to simplify things.   It was really fun to see it done so easily.    I didnt find the challenge tedious,
the challenge was straight forward and clear on exactly what we needed to do.   
=end
