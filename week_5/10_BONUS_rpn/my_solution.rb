# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: Create a new instance of RPNCalculator. Call the evaluate method and pass in 1 argument as a string of numbers and +,-,* symbols with space in between. Example: calc.evaluate('5 1 2 + 4 * + 3 -').   
# Output: Return an integer of the calculated total
# Steps:
=begin
	Create a new class called RPNCalculator
	Create a new method called evaluate that allows one argument called @rpcstring to pass in.  The argument is a string of numbers and +,-,* symbols separated by a space.
	Create a new array called @rpcstack
	Create 2 new variables called @val1 and @val2
	Create a new array called @rpcarray and set it equal to the string argument rpcstring, and split into individual elements in an array.  

	Iterate through the @rpcarray and check for the following conditions.
		if current element is a + then
			Pop the last element on the stack out and set @val1 equal to it.
			Pop the next element to the last on the stack out and set @val2 equal to it
			push the total of @val1 plus @val2 back into the @rpcstack array.
		else if the current element is a - then
			Pop the last element on the stack out and set @val1 equal to it.
			Pop the next element to the last on the stack out and set @val2 equal to it
			push the total of @val1 minus @val2 back into the @rpcstack array.
		else if  the current element is a * then
			Pop the last element on the stack out and set @val1 equal to it.
			Pop the next element to the last on the stack out and set @val2 equal to it
			push the total of @val1 multiply by @val2 back into the @rpcstack array.
		if the current is not a symbol (is a number) then just push that element into the @rpcstack array.
After iteration is done, pop the last element in @rpcstack out, change it to an integer, and return it to the caller.

=end



# 3. Initial Solution

# class RPNCalculator
#   def evaluate(rpcstring)
#   	@rpcarray = rpcstring.split(' ')
#   	@rpcstack = []
#   	@val1 = ""
#   	@val2 = ""

#   	@rpcarray.each do |a|
#   		if a == "+"
#   			@val1 = @rpcstack.pop.to_i
#   			@val2 = @rpcstack.pop.to_i
#   			@rpcstack.push(@val2 + @val1)
#   		elsif a == "-"
#   			@val1 = @rpcstack.pop.to_i
#   			@val2 = @rpcstack.pop.to_i
#   			@rpcstack.push(@val2-@val1)
#   		elsif a == "*"
#   			@val1 = @rpcstack.pop.to_i
#   			@val2 = @rpcstack.pop.to_i
#   			@rpcstack.push(@val2*@val1)
#   		else
#   			@rpcstack.push(a)
#   		end
#   	end
#   	@rpcstack.pop.to_i
#   end

# end

# 4. Refactored Solution
# I did attempt to refactor the code, but my refactoring made the code really unreadable.  I wanted to get rid of @val1 and @val2 and just push back the pop values.   But when you deal with the subtraction condition, it is important that I take the 2nd popped element and subtract it from the first.   I had to save the first popped element somewhere, so I felt its just cleaner to have declared variable to hold the pop values.
class RPNCalculator
  def evaluate(rpcstring)
  	@rpcarray = rpcstring.split(' ')
  	@rpcstack = []
  	@val1 = ""
  	@val2 = ""

  	@rpcarray.each do |a|
  		if a == "+"
  			@val1 = @rpcstack.pop.to_i
  			@val2 = @rpcstack.pop.to_i
  			@rpcstack.push(@val2 + @val1)
  		elsif a == "-"
  			@val1 = @rpcstack.pop.to_i
  			@val2 = @rpcstack.pop.to_i
  			@rpcstack.push(@val2-@val1)
  		elsif a == "*"
  			@val1 = @rpcstack.pop.to_i
  			@val2 = @rpcstack.pop.to_i
  			@rpcstack.push(@val2*@val1)
  		else
  			@rpcstack.push(a)
  		end
  	end
  	@rpcstack.pop.to_i
  end

end

# 1. DRIVER TESTS GO BELOW THIS LINE
calc = RPNCalculator.new
p calc.evaluate('5 1 2 + 4 * + 3 -') == 14
p calc.evaluate('70 10 4 + 5 * -') == 0
p calc.evaluate('50 20 -') == 30
p calc.evaluate('1 2 +') == 3
p calc.evaluate('2 5 *') == 10

# 5. Reflection 
=begin
	This assignment was a lot easier than I thought.   Once I looked at the example on wikipedia and read through the algorithm, it was a breeze to implement.   I felt like I was cheating when I followed the algorithm using the pop and pushes.   I think I could have refactored it better, but after my refactored it was extremely hard to read and understand.   So I kept it the way it is.   I really enjoy just learning about the algorithm to calculate these challenges and converting the algorithm into actual code.    The rspec test really helps me confirm that what I am doing is correct.   I rarely use push and pop, and this challege is a great example of using these methods.
=end
