# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself].

# 1. Pseudocode

# What is the input? 
# Input is an array passed to the method that also takes 1 or 2 argument.  Example [1,2,3].pad(5) or [1,2,3].pad(5, 'a') or
# [1,2,3].pad!(5)
# What is the output? (i.e. What should the code return?)
# The output depends on the input.  If the array length is less than or equal to the argument passed in, it 
# will return the original array.  If the array length is greater than the argument, then pad the array elements after the
# last array element on the original array with nil if there is no second argument or pad it with the value of the 
# second argument all the way to the end using he first arguement - 1 as the index of where to end. Example [1,2,3].pad(5)
# should return [1,2,3,nil,nil]  or [1,2,3].pad(5, 'a') should return [1,2,3,'a','a'], pad! will return the same except it 
# modify the original array.
# What are the steps needed to solve the problem?
=begin
	Create class Array that has a method called pad and pad!
	pad and pad! methods both take in 1 or two arguments.
	First argument is the array length you want after end of array.
	Optional second argument is the value you want to set the pad elements to be.  
	Set the second argument's default value to nil.
	
	In pad (non destructive version), clone a copy of the array
	While the original array length is less than the first argument (array length we want)
	Push the pad value into the end of the array
	Return the cloned array
	
	In pad! (destructive version)
	While the original array length is less than the first argument (array length we want)
	Push the pad value into the end of the array
	Return the array
=end

# 2. Initial Solution
class Array 
	def pad  (padnum, padvalue = nil)
		@newarr = self.clone
		while  @newarr.length < padnum
			@newarr.push(padvalue)
		end
		@newarr
	end

	def pad! (padnum, padvalue = nil)
		while self.length < padnum
			self.push(padvalue)
		end
		self
	end
end
# 3. Refactored Solution
class Array 
	def pad  (padnum, padvalue = nil)
		self.clone.pad!(padnum, padvalue)
	end

	def pad! (padnum, padvalue = nil)
		self.fill(padvalue, self.length..padnum-1)
	end
end
# 4. Reflection 
=begin
I had to look in the Chris Pine, Learn to Program Second Edition book to see an example on how to extend the Array class and add
in my own methods.    Once I figured that out, I then had to figure out how to handle the array begin passed to the put(!) methods.
Once I saw that I can use self to work with the array, everything else wasnt so bad.   My initial solution using a while loop to push
new pad elements in worked fine, but during my refactored solution, I looked in the Array class and found fill, which just took in
the pad value you want to fill with and then set the array index positions.   I just set the position to the length of the original
array up to the array length we want - 1 to account for 0 index.   

I felt pretty confident about most of the task.  The one thing I think I did correctly was using clone to duplicate self in order 
not to make it destructive.   I cloned the array with an internal instance array variable and returned that so that self wont get
manipulated.   

It was fun trying to extend the Array class with your own method.    I didnt find anything really tedious here.
=end