# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: Create a new instace of Die, call method .sides, call method .roll
# Output: It can output the number of sides and a random roll of the die based on the number of sides 
# Steps:
=begin
Create a new class called Die
Create an initialize method that takes in 1 argument called sides
If the number of sides is greater than or equal to one. 
	set sides equal to an instance variable called sides
else if number is less than 1
	raise an error 
Create a method inside Die called sides
	return the number of sides
Create a method inside Die called roll
	return a random number between 1 and the number of sides
=end

# 3. Initial Solution
=begin
class Die
  def initialize(sides)
    
    if sides >= 1 
    	@sides = sides
    else
    	raise ArgumentError.new("Please enter the number of sides 1 or larger")
    end
  end
  
  def sides
    @sides
  end
  
  def roll
    rand(@sides) + 1
  end
end
=end
# 4. Refactored Solution
class Die
  def initialize(sides)
    @sides = sides
    unless sides >= 1
    	raise ArgumentError.new("Please enter the number of sides 1 or larger")
    end
  end
  
  def sides
    @sides
  end
  
  def roll
    rand(@sides) + 1
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
#Declare a new instance of Die
d = Die.new(3)

#Check to see if sides is returned correctly
p d.sides == 3

#Check to see if roll will produce a random number between 1 to 3
p (1..3).include?(d.roll)

#Check for an arguement error
begin
  Die.new(0)
rescue ArgumentError => e
  chkerror = e.message
end 
p chkerror == "Please enter the number of sides 1 or larger"

# 5. Reflection 
=begin
So making sure I read up on Classes and how to create them was important
in building my Class correctly. Also reading up on how to raise an exception 
error was needed to write my ArgumentError correctly.  Only big question
I had was how to write a driver code to check for an argument.    The rest of the 
challenge was pretty easy.   Nothing was tedious.   I am very confident with the
learning competencies.  
=end
