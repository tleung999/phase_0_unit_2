# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: 
#Create an instance of GuessingGame
#Call the method guess passing in 1 number as the argument
#Call the method solved? to display whether the number was found

# Output:
# Calling the method guess will return if the number is too high, too low, or correct.
# Calling the method solved? will return true or false based on the last guess you passed into the guess method.

# Steps:
=begin
  Create a new class called GuessingGame.
  Set two instance variables to hold the answer and the current guess result.
  Create a guess method that will accept 1 argument.
    The method will compare the argument passed to it and return the following
    return the symbol :high if the argument is greater than the answer.  Also set the guess result to false
    return the symbol :low if the argument is less than the answer. Also set the guess result to false
    return the symbol :correct if the argument equals the answer. Also set the guess result to true.

  Create a solved? method that will return the guess result boolean value.
=end


# 3. Initial Solution

# class GuessingGame
#   def initialize(answer)
#   	@answer = answer
#   	@guessright = false
#   end
  
#   def guess(guess)
#   	@guess = guess
#   	if @guess > @answer
#   		@guessright = false
#   		return :high
#   	elsif @guess < @answer
#   		@guessright = false
#   		return :low
#   	else
#   		@guessright = true
#   		return :correct
#   	end
#   end

#   def solved?
#   	@guessright
#   end
# end

# 4. Refactored Solution
#I am not exactly sure how to refactor this better.  The Initial code seems pretty efficient and clean to me.
class GuessingGame
  def initialize(answer)
  	@answer = answer
  	@guessright = false
  end
  
  def guess(guess)
  	@guess = guess
  	if @guess > @answer
  		@guessright = false
  		return :high
  	elsif @guess < @answer
  		@guessright = false
  		return :low
  	else
  		@guessright = true
  		return :correct
  	end
  end

  def solved?
  	@guessright
  end
end

#DBC Code Sample
 # game = GuessingGame.new(10)
 # p game.solved?   # => false
 # p game.guess(5)  # => :low
 # p game.guess(20) # => :high
 # p game.solved?   # => false
 # p game.guess(10) # => :correct
 # p game.solved?   # => true

#OR 

# game = GuessingGame.new rand(100)
# last_guess  = nil
# last_result = nil

# until game.solved?
#   unless last_guess.nil?
#     puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
#     puts ""
#   end

#   print "Enter your guess: "
#   last_guess  = gets.chomp.to_i
#   last_result = game.guess(last_guess)
# end

# puts "#{last_guess} was correct!"

# 1. DRIVER TESTS GO BELOW THIS LINE
#Declare a new instance of GuessingGame set to 20
g = GuessingGame.new(20)

#Check to see if solved method exist, return false
p g.solved? == false

#Passing 5 to guess return :low
p g.guess(5) == :low

#Passing 25 to guess return :high
p g.guess(25) == :high

#passing 20 to guess return :correct
p g.guess(20) == :correct


# 5. Reflection 
=begin
Making sure I am clear on what the task is asking is critical in figuring out what I need to code.    I was a little confused on if an instance method will accept an argument when called such as g.guess(5).   For some reason I thought I needed to build a setter method to pass in the 5 so it will work.   But after looking online, I found the setter method are really just made so you can directly access an instance variable that was built during intialization and change its value to something else.    

After working with classes more, I see that instance variables are encapsulated in the instance of the class.   You can not directly manipulate the instance variable unless you build a setter method to deliberately allow changing of the instance variable.    Variables and methods represents actions and attributes of an object and how it should behave and interact with the caller.   Everything within the object should have some reason to be part of the object.  If you have a car object, it should have attributes such as color, type, #of wheels, horsepower.   Then you can have methods for the car where you can drive, brake, start and stop the engine, and anything else that pertains to the function of a car.   

I am starting to get better at writing driver code and understanding the errors that rspec is throwing at me.  I did not find any part of this challenge tedious.    
=end
