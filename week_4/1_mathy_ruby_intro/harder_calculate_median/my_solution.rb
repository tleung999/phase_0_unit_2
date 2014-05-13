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



# 4. Reflection 