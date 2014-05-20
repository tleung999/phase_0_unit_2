# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: Create a instance of Die an pass in an array of non numbers, Can call the method sides, Can call the method roll
# Output: Return the number of sides, Return a random string value randomly.
# Steps:
=begin
Create a new class called Die
Create an initialize method that takes in 1 argument called sides
If the labels array is passed in 
	set labels equal to an instance variable called sides
else if labels array is not passed in
	raise an error 
Create a method inside Die called sides
	return the number of sides
Create a method inside Die called roll
	return a random string value
=end


# 3. Initial Solution

class Die

  def initialize(labels)
  		if labels.empty?
  			raise ArgumentError.new ("Array is empty!")
  		end
	  	@labels = labels
  end

  def sides
  	@labels.length
  end

  def roll
  	@labels[rand(@labels.length)]
  end
end

# 4. Refactored Solution
#I couldnt see where I can make the code tighter and cleaner, so I didnt refactored.   
class Die

  def initialize(labels)
  		if labels.empty?
  			raise ArgumentError.new ("Array is empty!")
  		end
	  	@labels = labels
  end

  def sides
  	@labels.length
  end

  def roll
  	@labels[rand(@labels.length)]
  end
end

# 1. DRIVER TESTS GO BELOW THIS LINE
#Declare a new instance of Die
d = Die.new(['A', 'B', 'C', 'D', 'E', 'F'])

#Check to see if number of sides is correct
p d.sides == 6

#Check to see if roll will generate a random letter between A to F
p ('A'..'F').include?(d.roll)

#Check to see if Exception is thrown when you pass in blank array
begin
  Die.new([])
rescue ArgumentError => e
  chkerror = e.message
end 
p chkerror == "Array is empty!"

#Check to see if Exception is thrown you dont pass in any arguments (This is for fun, my personal learning)
begin
  Die.new()
rescue Exception => e
  error_object = e.inspect
end
p error_object == "#<ArgumentError: wrong number of arguments (0 for 1)>"


# 5. Reflection 
=begin
Taking what I learned from Challenge 1 and moving it to this challenge was very helpful.   Changing from numbers to strings wasnt that hard to deal with since I only need to figure out the length of the array to randomize and then use that number as the index of the array.    The only thing I got stuck with was simply that I didnt read the directions clearly.  I thought the instruction said to catch the exception error if you pass no argument when creating the instance of the class.   But it turned out that I need to pass in an empty array.    So checking to see if the array is empty helped catch the error and produce my message to the user.   I am now starting to know how to use begin, rescue, and end for an exception block.   Its a little weird in the beginning, but I think I'll get better once I use it more.  I didnt find the challenge tedious, it was a good learning experience.	
=end
