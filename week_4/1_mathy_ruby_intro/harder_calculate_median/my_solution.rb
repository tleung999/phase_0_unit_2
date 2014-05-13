# U2.W4: SOLO CHALLENGE Calculate the Median!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode
# What is the input? 
#Looks like it is taking in an array
# What is the output? (i.e. What should the code return?)
#Should return the median from an array set
# What are the steps needed to solve the problem?
#Create a method called median which can take in 1 array argument
#Sort array in ascending order (smallest to largest)
#Check the length of the array
#If the array is an odd length 
# => calculate median by getting the middle array value
#if the array is an even length
# => calculate median by getting the two middle array value
# => Get the total of both values together
# => Take the total and divide by 2


# 2. Initial Solution
def median array
	med = ""
	sorted = array.sort
	if array.length % 2 == 0 then
		med = sorted[(array.length/2-1)].to_f + sorted[(array.length/2)].to_f
		med = med/2
	else 
		med = sorted[(array.length/2).ceil]
	end
		return med
end

# 3. Refactored Solution
def median array
	sortarr = array.sort
	if array.length % 2 == 0 then
		val1 = sortarr[array.length/2-1].to_f
		val2 = sortarr[array.length/2].to_f
		return (val1 + val2)/2
	else
		return sortarr[(array.length/2).ceil]
	end
end


# 4. Reflection 
=begin
It was pretty easy to layout my pseudo code and figure out what method
I needed to make plus how many parameters to pass.    I had to look online
to see what the formula was to calculate the median when the array length was
even.    One of the things I learned was chaining methods, but then I realize it
was bad practice since it made my code so unreadable.    I ended up break it up
into easy to read chunks so people can clearly see that for even array length
you take the middle value 1 and middle val2, add them together and divide by 2.
I am pretty confident with this challenge, it was really fun to solve.  Nothing
tedious with this project, it was clean and easy to learn.	
=end